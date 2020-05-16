SET search_path = APP1;

-- INSERT categorie
INSERT INTO categorie(id_categorie, nom_categorie)
VALUES
(0110, 'Salle de classe générale'),
(0111, 'Salle de classe spécialisée'),
(0120, 'Salle de séminaire'),
(0121, 'Cubicules'),
(0210, 'Laboratoire informatique'),
(0211, 'Laboratoire enseignement spécialisé'),
(0212, 'Atelier'),
(0213, 'Salle à dessin'),
(0214, 'Atelier (civil)'),
(0215, 'Salle de musique'),
(0216, 'Atelier sur 2 étages, conjoint avec un autre local'),
(0217, 'Salle de conférence'),
(0372, 'Salle de réunion'),
(0373, 'Salle entrevue et de tests'),
(0510, 'Salle de lecture ou de consultation'),
(0620, 'Auditorium'),
(0625, 'Salle de concert'),
(0640, 'Salle audience'),
(0930, 'Salon du personnel'),
(1030, 'Studio enregistrement'),
(1260, 'Hall entrée');

-- INSERT ressource
INSERT INTO ressource (id_ressource,nom_ressource)
VALUES
(0,'Connexion à internet'),
(1,'Tables fixes en U et chaises mobiles'),
(2,'Monoplaces'),
(3,'Tables fixes et chaises fixes'),
(6,'Tables pour 2 ou + et chaises mobiles'),
(7,'Tables mobiles et chaises mobiles'),
(8,'Tables hautes et chaises hautes'),
(9,'Tables fixes et chaises mobiles'),
(11,'Écran'),
(14,'Rétroprojecteur'),
(15,'Gradins'),
(16,'Fenêtres'),
(17,'1 piano'),
(18,'2 pianos'),
(19,'Autres instruments'),
(20,'Système de son'),
(21,'Salle réservée (spéciale)'),
(22,'Ordinateurs PC'),
(23,'Ordinateurs SUN pour génie électrique'),
(25,'Ordinateurs (oscillomètre et multimètre)'),
(26,'Ordinateurs modélisation des structures'),
(27,'Ordinateur PC'),
(28,'Équipements pour microélectronique'),
(29,'Équipements pour génie électrique'),
(30,'Ordinateurs et équipement pour mécatronique'),
(31,'Équipement métrologie'),
(32,'Équipement de machinerie'),
(33,'Équipement de géologie'),
(34,'Équipement pour la caractérisation'),
(35,'Équipement pour la thermodynamique'),
(36,'Équipement pour génie civil'),
(37,'Télévision'),
(38,'VHS'),
(39,'Hauts parleurs'),
(40,'Micro'),
(41,'Magnétophone à cassette'),
(42,'Amplificateur audio'),
(43,'Local barré'),
(44,'Prise réseau');

-- INSERT faculte
INSERT INTO faculte (id_faculte, nom_faculte)
VALUES
('A9', 'Droit'),
('K1', 'École de gestion'),
('A1', 'Éducation'),
('A2', 'Éducation'),
('A7', 'Éducation'),
('C1', 'Génie'),
('C2', 'Génie'),
('C4', 'Génie'),
('A3', 'Lettres et sciences humaines - École de musique'),
('A4', 'Lettres et sciences humaines - École de musique'),
('A5', 'Lettres et sciences humaines - École de musique'),
('A6', 'Lettres et sciences humaines - École de musique'),
('C3', 'Lettres et sciences humaines - École de musique'),
('D1', 'Sciences'),
('D2', 'Sciences'),
('D3', 'Sciences'),
('D4', 'Sciences'),
('D5', 'Sciences'),
('D6', 'Sciences'),
('D7', 'Sciences'),
('D8', 'Sciences'),
('A8', 'Sciences de activité physique');

-- INSERT campus
INSERT INTO campus (nom_campus)
VALUES
('Campus de Longueil'),
('Campus Ouest'),
('Campus Est');

-- INSERT pavillon
INSERT INTO pavillon (id_pavillon, nom_pavillon, id_campus)
VALUES
('A8', 'Albert-Leblanc', 2),
('A9', 'Albert-Leblanc', 2),
('J1', 'Centre sportif Yvon-Lamarche', 2),
('J2', 'Centre sportif Yvon-Lamarche', 2),
('B1', 'Georges-Cabana', 2),
('B2', 'Georges-Cabana', 2),
('B6', 'Irénée-Pinard', 2),
('C1', 'J.-Armand-Bombardier', 2),
('C2', 'J.-Armand-Bombardier', 2),
('F1', 'John-S.-Bourque', 2),
('D6', 'Marie-Victorin', 2),
('D7', 'Marie-Victorin', 2),
('B5', 'Multifonctionnel', 2),
('A10', 'Recherche en sciences humaines et sociales', 2),
('D8', 'Science de la vie', 2),
('E5', 'Vie étudiante', 2);

-- INSERT departement
INSERT INTO departement (nom_departement, id_faculte)
VALUES
('Génie électrique et Génie informatique', 'C2'),
('Génie mécanique', 'C2'),
('Génie biotechnologie', 'C2'),
('Génie civil', 'C1');

-- INSERT privilege
INSERT INTO privilege (nom_privilege)
VALUES
('Lecture'),
('Modification'),
('Création'),
('Suppression'),
('Lecture - Modification'),
('Lecture - Création'),
('Lecture - Suppression'),
('Modification - Création'),
('Modification - Suppression'),
('Création - Supression'),
('Création - Supression - Lecture');

-- INSERT statut
INSERT INTO statut (nom_statut, id_privilege)
VALUES
('Étudiants', 6),
('Enseignants', 11),
('Personnels de soutien', 1),
('Administrateurs', 11);

-- INSERT local
INSERT INTO local(id_pavillon, cubicule, no_local, capacite_local, id_categorie, notes_local)
VALUES
('C1', NULL,1007,21,0212,'Grand'),
('C1', NULL,2018,10,0212,'Matériaux composites'),
('C1', NULL,2055,24,0211, ''),
('C1', NULL,3014,25,0211,'Laboratoire mécatronique'),
('C1', NULL,3027,15,0211,'Petit Laboratoire de élect'),
('C1', NULL,3016,50,0210, ''),
('C1', NULL,3018,50,0211, ''),
('C1', NULL,3024,50,0211, ''),
('C1', NULL,3035,50,0210, ''),
('C1', NULL,3041,50,0210, ''),
('C1', NULL,3007,106,0620, 'Avec console multi-média'),
('C1', NULL,3010,30,0211,'Laboratoire de conception'),
('C1', NULL,4016,91,0620,''),
('C1', NULL,4018,10,0212,'Metallurgie'),
('C1', NULL,4019,8,0212,'Laboratoire accessoire Atelier'),
('C1', NULL,4021,28,0210,''),
('C1', NULL,4023,108,0620,''),
('C1', NULL,4030,25,0211,'Equipement photoelasticite'),
('C1', NULL,4028,14,0210,''),
('C1', NULL,4008,106,0620,''),
('C1', NULL,5012,35,0121,'8 cubicules'),
('C1', NULL,5026,38,0210,'Ordinateurs'),
('C1', NULL,5028,50,0210,'Ordinateurs'),
('C1', NULL,5001,198,0620,'Avec console multi-média'),
('C1', NULL,5009,50,0111,'Avec console multi-média'),
('C1', NULL,5006,110,0620,'Avec console multi-média'),
('C2', NULL,0009,100,0214,'Grand et equipe'),
('C2', NULL,1004,30,0212,'Atelier geologie equipement'),
('C2', NULL,1015,40,0211,'Laboratoire dhydraulique'),
('C2', NULL,1042,21,0211,'Laboratoire chimie-physique'),
('C2', NULL,2040,40,0211,'Laboratoire sans instrument'),
('D7', NULL,3001,35,0110,''),
('D7', NULL,3002,22,0110,''),
('D7', NULL,3007,54,0110,''),
('D7', NULL,3009,45,0110,''),
('D7', NULL,3010,21,0110,''),
('D7', NULL,3011,50,0110,''),
('D7', NULL,3012,54,0110,''),
('D7', NULL,3013,44,0110,''),
('D7', NULL,3014,40,0110,''),
('D7', NULL,3015,48,0110,''),
('D7', NULL,3016,125,0620,'Avec console multi-media'),
('D7', NULL,3017,45,0110,''),
('D7', NULL,3019,48,0110,''),
('D7', NULL,3020,35,0110,'Un mur est en fenetre'),
('D7', NULL,2018,57,0111,''),
('C1', '5012-1',5012,35,0121,'8 cubicules'),
('C1', '5012-2',5012,35,0121,'8 cubicules'),
('C1', '5012-3',5012,35,0121,'8 cubicules'),
('C1', '5012-4',5012,35,0121,'8 cubicules'),
('C1', '5012-5',5012,35,0121,'8 cubicules'),
('C1', '5012-6',5012,35,0121,'8 cubicules'),
('C1', '5012-7',5012,35,0121,'8 cubicules'),
('C1', '5012-8',5012,35,0121,'8 cubicules');

--INSERT membre
INSERT INTO membre(cip,prenom_membre,nom_membre,courriel_membre,id_departement)
VALUES
('casm1907','Marie','Castonguay','casm1907@courriel.com',1),
('lavj2421','Julien','Lavoie','lavj2421@courriel.com',1),
('abcd1234','Bob','Vigneault','abcd1234@courriel.com',2),
('efgh5678','Bibi','Cormier','efgh5678@courriel.com',3),
('wxyz1111','Kiki','Mercier','wxyz1111@courriel.com',4);

-- INSERT ressource_local
INSERT INTO ressource_local(id_local,id_ressource)
VALUES
(4,30),
(9,22),
(10,11),(10,22),
(11,11),(11,14),(11,38),(11,40),
(13,11),(13,14),(13,40),
(16,22),
(17,11),(17,14),(17,38),(17,40),
(19,22),
(20,11),(20,14),(20,38),(20,40),
(22,11),(22,14),(22,22),
(23,11),(23,14),(23,22),
(24,11),(24,14),(24,38),(24,40),
(25,11),(25,14),(25,38),(25,40),
(26,11),(26,14),(26,38),(26,40),
(28,33),
(32,2),(32,11),(32,14),
(33,2),(33,11),(33,14),
(34,2),(34,11),
(35,2),(35,11),
(36,2),(36,11),(36,14),
(37,2),(37,11),(37,14),
(38,2),(38,11),(38,14),
(39,2),(39,11),(39,14),
(40,2),(40,11),(40,14),
(41,2),(41,11),
(42,11),(42,14),(42,39),(42,43),
(43,2),(43,11),(43,14),
(44,2),(44,11),(44,14),
(45,2),(45,11),(45,14),(45,16),
(46,7),(46,11),(46,14),(46,43);

-- INSERT reservation
INSERT INTO reservation (debut_reservation, fin_reservation, cip, id_local)
VALUES
('2020-05-09 10:00:00-05', '2020-05-09 13:00:00-05', 'lavj2421', 21),
('2020-05-09 10:00:00-05', '2020-05-09 12:00:00-05', 'lavj2421', 1),
('2020-05-09 11:00:00', '2020-05-09 12:00:00', 'lavj2421', 2),
('2020-05-09 09:00:00', '2020-05-09 12:00:00', 'lavj2421', 3),
('2020-05-09 13:00:00', '2020-05-09 15:00:00', 'lavj2421', 4),
('2020-05-09 10:00:00', '2020-05-09 12:00:00', 'lavj2421', 5),
('2020-05-09 10:00:00', '2020-05-09 12:00:00', 'lavj2421', 6),
('2020-05-09 13:00:00', '2020-05-09 15:00:00', 'casm1907', 6);


/*
Tests pour la validation
*/

/*
-- Réservé un cubicule lorsque le local parent est réservé
INSERT INTO reservation (debut_reservation, fin_reservation, cip, id_local)
VALUES
('2020-05-09 12:00:00-05', '2020-05-09 13:00:00-05', 'abcd1234', 47);

-- Réservé sur une plage horaire déjà existante
INSERT INTO reservation (debut_reservation, fin_reservation, cip, id_local)
VALUES
('2020-05-09 10:30:00-05', '2020-05-09 13:00:00-05', 'lavj2421', 1);

-- Réservation existante de 10h-12h
INSERT INTO reservation (debut_reservation, fin_reservation, cip, id_local)
VALUES
('2020-05-09 09:00:00-05', '2020-05-09 10:30:00-05', 'lavj2421', 1);

-- Réservation existante de 10h-12h
INSERT INTO reservation (debut_reservation, fin_reservation, cip, id_local)
VALUES
('2020-05-09 12:00:00-05', '2020-05-09 13:00:00-05', 'lavj2421', 1);

-- Réservation existante de 10h-12h
INSERT INTO reservation (debut_reservation, fin_reservation, cip, id_local)
VALUES
('2020-05-09 10:00:00-05', '2020-05-09 11:00:00-05', 'lavj2421', 1);

-- Réservation de 12h-10h
INSERT INTO reservation (debut_reservation, fin_reservation, cip, id_local)
VALUES
('2020-05-09 12:00:00-05', '2020-05-09 10:00:00-05', 'lavj2421', 15);



-- Réservé un local lorsqu'un cubicule est déjà réservé
DELETE FROM reservation WHERE id_reservation = 1;

INSERT INTO reservation (debut_reservation, fin_reservation, cip, id_local)
VALUES
('2020-05-09 12:00:00-05', '2020-05-09 13:00:00-05', 'abcd1234', 47);

INSERT INTO reservation (debut_reservation, fin_reservation, cip, id_local)
VALUES
('2020-05-09 12:00:00-05', '2020-05-09 13:00:00-05', 'abcd1234', 21);
*/