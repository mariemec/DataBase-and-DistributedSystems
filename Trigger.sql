SET search_path = APP1;

/*
ADD logs entry each time a reservation is deleted, updated and inserted
*/
CREATE OR REPLACE FUNCTION process_logs() RETURNS TRIGGER AS $log$
    BEGIN
        --
        -- Create a row in logs to reflect the operation performed on reservation,
        -- make use of the special variable TG_OP to work out the operation.
        --
        IF (TG_OP = 'DELETE') THEN
            INSERT INTO logs (description_logs, "current_timestamp", cip) VALUES ('DELETE', now(), old.cip);
            RETURN OLD;
        ELSIF (TG_OP = 'UPDATE') THEN
            INSERT INTO logs (description_logs, "current_timestamp", cip) VALUES ('UPDATE', now(), new.cip);
            RETURN NEW;
        ELSIF (TG_OP = 'INSERT') THEN
            INSERT INTO logs (description_logs, "current_timestamp", cip) VALUES ('INSERT', now(), new.cip);
            RETURN NEW;
        END IF;
        RETURN NULL; -- result is ignored since this is an AFTER trigger
    END;
$log$ LANGUAGE plpgsql;

/*
Verification if time reservation overlap
*/
CREATE OR REPLACE FUNCTION check_reservation() RETURNS TRIGGER AS $reserv$
    DECLARE
        deb_reserv TIMESTAMP;
        fin_reserv TIMESTAMP;
        cubicule_complet VARCHAR;
        cubicule_local VARCHAR;
        local_parent INT;
        local_enfant VARCHAR;
        loc_parent INT;
    BEGIN
        SELECT reservation.debut_reservation, reservation.fin_reservation INTO deb_reserv, fin_reserv FROM reservation WHERE id_local = new.id_local;
        SELECT local.cubicule INTO cubicule_complet FROM local WHERE id_local = new.id_local;
        SELECT LEFT(local.cubicule,4) INTO cubicule_local FROM local WHERE id_local = new.id_local;
        SELECT reservation.id_local, local.no_local INTO local_parent FROM reservation INNER JOIN local ON local.id_local = reservation.id_local WHERE no_local::VARCHAR = cubicule_local;
        SELECT local.cubicule, local.no_local, reservation.id_local INTO local_enfant, loc_parent FROM reservation INNER JOIN local ON local.id_local = reservation.id_local WHERE local.cubicule IS NOT NULL;

        IF (TG_OP = 'UPDATE') THEN
            IF (new.debut_reservation BETWEEN deb_reserv AND fin_reserv) THEN
                RAISE NOTICE 'Reservation Overlap';
                RETURN NULL;

            ELSIF (new.fin_reservation BETWEEN deb_reserv AND fin_reserv) THEN
                RAISE NOTICE 'Reservation Overlap';
                RETURN NULL;

            ELSIF (new.debut_reservation < deb_reserv AND new.fin_reservation > fin_reserv) THEN
                RAISE NOTICE 'Reservation Overlap';
                RETURN NULL;

            ELSIF (new.fin_reservation > new.debut_reservation) THEN
                RAISE NOTICE 'Heure de fin de réservation doit être plus grande que celle de début';
                RETURN NULL;
            END IF;

            IF (cubicule_complet IS NOT NULL) THEN
                IF (local_parent IS NOT NULL) THEN
                    RAISE NOTICE 'Local parent réservé, impossible de réserver le cubicule';
                    RETURN NULL;
                ELSE
                    RETURN NEW;
                END IF;
            ELSE
                IF (local_enfant IS NOT NULL AND loc_parent::VARCHAR = LEFT(local_enfant,4)) THEN
                    RAISE NOTICE 'Cubicule réservé dans le local, impossible de réserver tout le local';
                    RETURN NULL;
                ELSE
                    RETURN NEW;
                END IF;
            END IF;

        ELSIF (TG_OP = 'INSERT') THEN

            raise notice 'debut_new %', new.debut_reservation;
            raise notice 'fin_new %', new.fin_reservation;

            IF (new.debut_reservation BETWEEN deb_reserv AND fin_reserv) THEN
                RAISE NOTICE 'Reservation Overlap';
                RETURN NULL;

            ELSIF (new.fin_reservation BETWEEN deb_reserv AND fin_reserv) THEN
                RAISE NOTICE 'Reservation Overlap';
                RETURN NULL;

            ELSIF (new.debut_reservation < deb_reserv AND new.fin_reservation > fin_reserv) THEN
                RAISE NOTICE 'Reservation Overlap';
                RETURN NULL;

            ELSIF (new.fin_reservation < new.debut_reservation) THEN
                RAISE NOTICE 'Heure de fin de réservation doit être plus grande que celle de début';
                RETURN NULL;
            END IF;

            IF (cubicule_complet IS NOT NULL) THEN
                IF (local_parent IS NOT NULL) THEN
                    RAISE NOTICE 'Local parent réservé, impossible de réserver le cubicule';
                    RETURN NULL;
                ELSE
                    RETURN NEW;
                END IF;
            ELSE
                IF (local_enfant IS NOT NULL AND loc_parent::VARCHAR = LEFT(local_enfant,4)) THEN
                    RAISE NOTICE 'Cubicule réservé dans le local, impossible de réserver tout le local';
                    RETURN NULL;
                ELSE
                    RETURN NEW;
                END IF;
            END IF;
        END IF;
        RETURN NULL;
    END
$reserv$ LANGUAGE plpgsql;


CREATE TRIGGER log
AFTER INSERT OR UPDATE OR DELETE ON reservation
    FOR EACH ROW EXECUTE PROCEDURE process_logs();

CREATE TRIGGER reserv
BEFORE INSERT ON reservation
    FOR EACH ROW EXECUTE PROCEDURE check_reservation();