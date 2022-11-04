DROP TABLE IF EXISTS weapon_matirials;
DROP TABLE IF EXISTS weapons;
DROP TABLE IF EXISTS weapon_type;
DROP TABLE IF EXISTS matirials;


CREATE TABLE weapon_type(
	id_weapon_type INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    type VARCHAR(24),
    description TEXT,
    icon VARCHAR (16)
);
INSERT into weapon_type (type, description, icon)
VALUES 
("sword", "arrma a uno o dos manos facilmente blandible, una de las mas confiables que puede aber", "sword.png"),
("spear", "arma cuerpo a cuerpo de considerable alcance", "spear.png"),
("wand", "poderosos baculos que permiten canalicar la magia del portador","wand.png"),
("daga", "arma de corto alcance, perfecta para atacar por la espalda","daga.png");

CREATE TABLE weapons (
	id_weapon INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    weapon VARCHAR (24),
    grip INT,
    durability INT,
    distance FLOAT,
    quality INT,
    physic_atack FLOAT,
    magic_atack FLOAT,
    physic_defense FLOAT,
    magic_defense FLOAT,
    description TEXT,
    `level` INT,
    level_min INT,
    id_weapon_type INT UNSIGNED,
    FOREIGN KEY (id_weapon_type) REFERENCES weapon_type (id_weapon_type)
);

INSERT INTO weapons(weapon, grip, durability,distance, quality,physic_atack, magic_atack, physic_defense, magic_defense, description, `level`, level_min, id_weapon_type)
VALUES
("lanza del longinus", 2, 10000, 2.5, 800, 500, 250, 400, 150, "lanza que mato a jesucristo mi rey", 80, 75,2),
("espada de coral", 1, 500, 1.5, 400, 250, 100, 250, 100, "espada que porta la gurada sirenida", 30, 30, 1),
("estalada", 1, 10000, 3000000, 3000000, 1000000000, 1000000000, 10000000000,10000000000, "vandera de la autodetermincio", 100, 1, 2);



CREATE TABLE matirials(
    id_matirials INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    matirials VARCHAR(16),
    color char (6),
    cost FLOAT
    );

INSERT INTO matirials (matirials, color, cost)
VALUES ( "obcidiana", "000000", 40),
	   ( "obcidiana", "ddeeaa", 10),
       ( "carne" , "ffff00", 5),
       ( "pana", "ffdddd", 50),
       ( "hiero", "ffddff",60),
       ( "piedra", "cccccc",1),
       ( "cuero", "ddddaa", 20),
       ("tela", "000000", 15),
       ("coral", "aaddee", 60),
       ( "magia oscura", "000000", 1000),
       ("huesos", "ffffff", 30),
       ("diesnte dragon", "ffffff", 250);




CREATE TABLE weapon_matirials(
    id_weapons_matirials INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_weapons INT,
    id_matirials int
    );