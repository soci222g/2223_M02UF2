DROP TABLE IF EXISTS armors_matirials;
DROP TABLE IF EXISTS weapon_matirials;

DROP TABLE IF EXISTS matirials;

DROP TABLE IF EXISTS characters_weapons;
DROP TABLE IF EXISTS characters_armours;
DROP TABLE IF EXISTS characters_items;

DROP TABLE IF EXISTS weapon_type;
DROP TABLE IF EXISTS armor_type;
DROP TABLE IF EXISTS item_type;

DROP TABLE if EXISTS armors;
DROP TABLE IF EXISTS weapons;
DROP TABLE if EXISTS items;

DROP TABLE IF EXISTS stats; 

DROP TABLE IF EXISTS characters;

CREATE TABLE characters (
  id_character INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  name varchar(32),
  age int(11),
  Race varchar(16),
  Gender char(1),
  Class varchar(16),
  Height float,
  Weight float,
  Origin CHAR(3),
  Description TEXT);
    
INSERT INTO characters (`name`, `age`, `Race`, `Gender`, `Class`, `Height`, `Weight`, `Origin`, `Description`)
    VALUES
( 'Payoh', 67, 'Cambiapieles', 'L', 'Dictador', 1.75, 80, 'RUM', 'Payoh es.... un cambiapieles muy raton.'),
( 'Yuca ', 27, 'Sirenido', 'F', 'Cryptolai', 1, 40, 'PUR', 'Yuca esta en la academia de mundocrypto junto a Mani Thawani para luchar contra Tamayo.'),
('Yulen', 104, 'No muerto', 'D', 'Minero', 0.8, 25, 'NDE', 'Yulen se fue para no volver, o eso cree la gente....'),
('Josema', 3000, 'Deidad', 'T', 'Procrastinador', 3.14, 0, 'PER', 'Josema, es tal su grandeza que decidio vivir en latam.');

CREATE TABLE stats (
  id_stats INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  agility int,
  hp float,
  hp_max int,
  xp float,
  xp_max int,
  mp float,
  mp_max int,
  lvl int,
  physic_attack float,
  `magic_attack` float,
  `physic_defense` float,
  `magic_defense` float,
  `stamina` float,
  `intel` int,
  `stealth` int,
  `lucky` int,
  `faith` int,
  `velocity` int,
  `dexterity` int,
  `strength` int,
  `charisma` int,
  `vigor` int,
  `tenacity` int,
  `critical_rate` float,
  `steal_life` float,
  `accurry` float,
  `balance` float,
  `mana` int ,
  `id_characters` int UNSIGNED,
FOREIGN KEY (id_characters) references characters (id_character)
 );

INSERT INTO `stats` (`agility`, `hp`, `hp_max`, `xp`, `xp_max`, `mp`, `mp_max`, `lvl`, `physic_attack`, `magic_attack`, `physic_defense`, `magic_defense`, `stamina`, `intel`, `stealth`, `lucky`, `faith`, `velocity`, `dexterity`, `strength`, `charisma`, `vigor`, `tenacity`, `critical_rate`, `steal_life`, `accurry`, `balance`, `mana`, `id_characters`) VALUES
( 900, 950, 0, 820, 0, 300, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
( 75, 0, 0, 500, 0, 700, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3),
( 1000, 1000, 0, 999, 0, 1000, 0, 69, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4),
( 200, 600, 0, 150, 0, 750, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2);


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


CREATE TABLE armor_type(
	id_armor_type INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    type VARCHAR(24),
    description TEXT,
    icon VARCHAR (16)
);
INSERT INTO armor_type (type, description, icon)
VALUES 
("peto", "pal pecho", "peto.png"),
("traje", "pal boddy","traje.png"),
("casco","pa la cabesa","casco.png");

CREATE TABLE item_type(
	id_item_type INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    type VARCHAR(24),
    description TEXT,
    icon VARCHAR (16)
);
INSERT INTO item_type(type, description, icon)
VALUES
("comida", "permite alimentar al portador i repuperar sus energias de inmediato",0),
("pocion", "te cura o te mata lo que sea", "pocion.png"),
("tesoro", "$__$", "tesoro.png");

CREATE TABLE item (
	id_item INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    item VARCHAR(24),
    consumable BOOLEAN,
    cost FLOAT,
    fusionable BOOLEAN,
    `key` BOOLEAN,
    rarity INT (11),
    weight FLOAT,
    height FLOAT,
    durability INT(11),
    dissasemble BOOLEAN,
    description TEXT,
    id_item_type INT UNSIGNED,
    FOREIGN KEY (id_item_type) REFERENCES item_type (id_item_type)	
    );


INSERT INTO item (item, consumable, cost, fusionable, `key`, rarity, weight, height, durability, dissasemble, description, id_item_type)
VALUES
		("queso", true, 50, false, false, 
         100, 2.5, 0.1, 3, false,
         "priza de alimento artesanal de la mas alta calidad nutritiva",1), 
		("carne de zombie", true, 30, true, false,
         2, 0.3,0.3, 1, false,
         "parece que si te comes eso vas a acabar pero de lo que estavas antes", 1),
		("fragmento de estella", false, 500, true, false,
         10000, 10, 0.5, 10, false, 
         "fragmento de una estrlla que a cadio para ser usada en una poderosa arma", 2 );	

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


CREATE TABLE armors (
	id_armor INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    armor VARCHAR (24),
    weight FLOAT,
    class VARCHAR (16),
    cost FLOAT,
    magic_defense INT,
    physic_defense INT,
    durability INT,
    `level` INT,
    level_min INT,
    rarity INT,
    description TEXT,
    notoriety INT,
    id_armor_type INT UNSIGNED,
    FOREIGN KEY (id_armor_type) REFERENCES armor_type (id_armor_type)	   
);

INSERT INTO armors (armor, weight, class, cost, magic_defense, physic_defense, durability, `level`, level_min, description, rarity,notoriety ,id_armor_type)
VALUES
		("collar de broly", 20, "luchador", 7500 ,500, 400, 1000, 80, 80, "collar que porto el sayan legendario en su pelea contra", 1000, 10, 1),
        ("tunica de assesino", 0.5, "assesino", 1500, 100, 300, 400, 50, 30, "tunica que te permite pasar desapercivido", 300, 1, 2);


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



CREATE TABLE armors_matirials(
	armors_matirials INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	id_matirials INT UNSIGNED,
	id_armor INT UNSIGNED,
    FOREIGN KEY (id_matirials) REFERENCES matirials (id_matirials),
    FOREIGN KEY (id_armor) REFERENCES armors (id_armor)
);

INSERT INTO armors_matirials (id_matirials, id_armor)
VALUES 
	(5,1),
    (7,2),
    (8,2),
    (2,1),
    (8,2),
    (10,2),
    (5,1),
    (7,1);

CREATE TABLE weapon_matirials(
    id_weapons_matirials INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_weapons INT,
    id_matirials int
    FOREIGN KEY (id_matirials) REFERENCES matirials (id_matirials),
    FOREIGN KEY (id_weapons) REFERENCES weapons (id_weapon)
    );






