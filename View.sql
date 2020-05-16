SET search_path = APP1;

/*
TABLEAU
*/
CREATE OR REPLACE VIEW TABLEAU AS
    WITH local_reserve AS (
        SELECT local.id_local,
               local.id_pavillon,
               local.no_local,
               categorie.nom_categorie
        FROM local INNER JOIN categorie ON local.id_categorie = categorie.id_categorie
    ), temps AS (
        SELECT GS AS temp
        FROM generate_series(TIMESTAMP '2020-05-09 08:00:00-05', TIMESTAMP '2020-05-09 23:00:00-05', '15 minutes') GS
    )
    SELECT local_reserve.id_pavillon,
           local_reserve.no_local,
           local_reserve.nom_categorie,
           temp AS temps,
           reservation.cip
    FROM local_reserve
    CROSS JOIN temps
    LEFT JOIN reservation ON local_reserve.id_local = reservation.id_local AND temps.temp >= reservation.debut_reservation AND temps.temp <= reservation.fin_reservation
    ORDER BY id_pavillon, no_local, temps;



SELECT * FROM TABLEAU WHERE nom_categorie = 'Atelier';