-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 04, 2022 at 06:58 AM
-- Server version: 10.5.17-MariaDB-1:10.5.17+maria~deb11
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `en_busca_de_abascal`
--

-- --------------------------------------------------------

--
-- Table structure for table `armors`
--

CREATE TABLE `armors` (
  `id_armor` int(10) UNSIGNED NOT NULL,
  `armor` varchar(24) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `class` varchar(16) DEFAULT NULL,
  `cost` float DEFAULT NULL,
  `magic_defense` int(11) DEFAULT NULL,
  `physic_defense` int(11) DEFAULT NULL,
  `durability` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `level_min` int(11) DEFAULT NULL,
  `rarity` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `notoriety` int(11) DEFAULT NULL,
  `id_armor_type` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `armors`
--

INSERT INTO `armors` (`id_armor`, `armor`, `weight`, `class`, `cost`, `magic_defense`, `physic_defense`, `durability`, `level`, `level_min`, `rarity`, `description`, `notoriety`, `id_armor_type`) VALUES
(1, 'collar de broly', 20, 'luchador', 7500, 500, 400, 1000, 80, 80, 1000, 'collar que porto el sayan legendario en su pelea contra', 10, 1),
(2, 'tunica de assesino', 0.5, 'assesino', 1500, 100, 300, 400, 50, 30, 300, 'tunica que te permite pasar desapercivido', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `armor_type`
--

CREATE TABLE `armor_type` (
  `id_armor_type` int(10) UNSIGNED NOT NULL,
  `type` varchar(24) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `icon` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `armor_type`
--

INSERT INTO `armor_type` (`id_armor_type`, `type`, `description`, `icon`) VALUES
(1, 'peto', 'pal pecho', 'peto.png'),
(2, 'traje', 'pal boddy', 'traje.png'),
(3, 'casco', 'pa la cabesa', 'casco.png');

-- --------------------------------------------------------

--
-- Table structure for table `characters`
--

CREATE TABLE `characters` (
  `id_character` int(10) UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL,
  `age` int(11) NOT NULL,
  `race` varchar(16) NOT NULL,
  `gender` char(1) NOT NULL,
  `class` varchar(16) NOT NULL,
  `height` float NOT NULL,
  `weight` float NOT NULL,
  `origin` char(3) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `characters`
--

INSERT INTO `characters` (`id_character`, `name`, `age`, `race`, `gender`, `class`, `height`, `weight`, `origin`, `description`) VALUES
(1, 'payoh', 64, 'cambiapieles', 'L', 'dictador', 1.75, 80, 'RUM', 'payoh es... un cambiapieles'),
(2, 'yuca', 27, 'sirenido', 'F', 'cryptolai', 0.7, 40, 'PUR', 'Yuca es una sirena que es fan de Elon Musk i de la enpresa Meta'),
(3, 'yulen', 70, 'nomuerto', 'D', 'minero', 0.8, 25, 'NDE', 'tras una explosion en las minas i gracias a una magia negra pudo segir cominando poara minar sus piedras preciossas'),
(4, 'josema', 3000, 'deidad', 'T', 'Procrastinador', 3.14, 0, 'PER', 'Dios venido a la tirra en vusca de diversion');

-- --------------------------------------------------------

--
-- Table structure for table `characters_weapons`
--

CREATE TABLE `characters_weapons` (
  `id_character_weapon` int(10) UNSIGNED NOT NULL,
  `id_character` int(10) UNSIGNED DEFAULT NULL,
  `id_weapons` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `characters_weapons`
--

INSERT INTO `characters_weapons` (`id_character_weapon`, `id_character`, `id_weapons`) VALUES
(1, 1, 1),
(2, 2, 3),
(3, 1, 2),
(4, 4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `id_item` int(10) UNSIGNED NOT NULL,
  `item` varchar(24) DEFAULT NULL,
  `consumable` tinyint(1) DEFAULT NULL,
  `cost` float DEFAULT NULL,
  `fusionable` tinyint(1) DEFAULT NULL,
  `key` tinyint(1) DEFAULT NULL,
  `rarity` int(11) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `height` float DEFAULT NULL,
  `durability` int(11) DEFAULT NULL,
  `dissasemble` tinyint(1) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `id_item_type` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id_item`, `item`, `consumable`, `cost`, `fusionable`, `key`, `rarity`, `weight`, `height`, `durability`, `dissasemble`, `description`, `id_item_type`) VALUES
(1, 'queso', 1, 50, 0, 0, 100, 2.5, 0.1, 3, 0, 'priza de alimento artesanal de la mas alta calidad nutritiva', 1),
(2, 'carne de zombie', 1, 30, 1, 0, 2, 0.3, 0.3, 1, 0, 'parece que si te comes eso vas a acabar pero de lo que estavas antes', 1),
(3, 'fragmento de estella', 0, 500, 1, 0, 10000, 10, 0.5, 10, 0, 'fragmento de una estrlla que a cadio para ser usada en una poderosa arma', 2);

-- --------------------------------------------------------

--
-- Table structure for table `item_type`
--

CREATE TABLE `item_type` (
  `id_item_type` int(10) UNSIGNED NOT NULL,
  `type` varchar(24) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `icon` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `item_type`
--

INSERT INTO `item_type` (`id_item_type`, `type`, `description`, `icon`) VALUES
(1, 'comida', 'permite alimentar al portador i repuperar sus energias de inmediato', 'comida.png'),
(2, 'pocion', 'te cura o te mata lo que sea', 'pocion.png'),
(3, 'tesoro', '$__$', 'tesoro.png');

-- --------------------------------------------------------

--
-- Table structure for table `matirials`
--

CREATE TABLE `matirials` (
  `id_matirials` int(10) UNSIGNED NOT NULL,
  `matirials` varchar(16) DEFAULT NULL,
  `color` char(6) DEFAULT NULL,
  `cost` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `matirials`
--

INSERT INTO `matirials` (`id_matirials`, `matirials`, `color`, `cost`) VALUES
(1, 'obcidiana', '000000', 40),
(2, 'obcidiana', 'ddeeaa', 10),
(3, 'carne', 'ffff00', 5),
(4, 'pana', 'ffdddd', 50),
(5, 'hiero', 'ffddff', 60),
(6, 'piedra', 'cccccc', 1),
(7, 'cuero', 'ddddaa', 20),
(8, 'tela', '000000', 15),
(9, 'coral', 'aaddee', 60),
(10, 'magia oscura', '000000', 1000),
(11, 'huesos', 'ffffff', 30),
(12, 'diesnte dragon', 'ffffff', 250);

-- --------------------------------------------------------

--
-- Table structure for table `stats`
--

CREATE TABLE `stats` (
  `id_stats` int(10) UNSIGNED NOT NULL,
  `agility` int(11) NOT NULL,
  `hp` int(11) NOT NULL,
  `hp_max` int(11) NOT NULL,
  `xp` int(11) NOT NULL,
  `xp_max` int(11) NOT NULL,
  `mp` float NOT NULL,
  `mp_max` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `physic_attack` float NOT NULL,
  `magic_attack` float NOT NULL,
  `physic_defense` float NOT NULL,
  `magic_defense` float NOT NULL,
  `mana` int(11) NOT NULL,
  `stamina` float NOT NULL,
  `intel` int(11) NOT NULL,
  `stealth` float NOT NULL,
  `faith` float NOT NULL,
  `luck` int(11) NOT NULL,
  `spead` int(11) NOT NULL,
  `critic_rate` float NOT NULL,
  `dexterity` int(11) NOT NULL,
  `strenght` int(11) NOT NULL,
  `charisma` int(11) NOT NULL,
  `vigor` int(11) NOT NULL,
  `aim` int(11) NOT NULL,
  `tenacity` int(11) NOT NULL,
  `balance` float NOT NULL,
  `id_character` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stats`
--

INSERT INTO `stats` (`id_stats`, `agility`, `hp`, `hp_max`, `xp`, `xp_max`, `mp`, `mp_max`, `level`, `physic_attack`, `magic_attack`, `physic_defense`, `magic_defense`, `mana`, `stamina`, `intel`, `stealth`, `faith`, `luck`, `spead`, `critic_rate`, `dexterity`, `strenght`, `charisma`, `vigor`, `aim`, `tenacity`, `balance`, `id_character`) VALUES
(5, 900, 950, 0, 820, 0, 300, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(6, 75, 0, 0, 500, 0, 700, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3),
(7, 1000, 1000, 0, 999, 0, 1000, 0, 69, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4),
(8, 200, 600, 0, 150, 0, 750, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `weapons`
--

CREATE TABLE `weapons` (
  `id_weapos` int(10) UNSIGNED NOT NULL,
  `weapons` varchar(24) DEFAULT NULL,
  `grip` int(11) DEFAULT NULL,
  `durability` int(11) DEFAULT NULL,
  `distance` float DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `physic_atack` float DEFAULT NULL,
  `magic_atack` float DEFAULT NULL,
  `physic_defense` float DEFAULT NULL,
  `magic_defense` float DEFAULT NULL,
  `description` text DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `level_min` int(11) DEFAULT NULL,
  `id_weapon_type` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `weapons`
--

INSERT INTO `weapons` (`id_weapos`, `weapons`, `grip`, `durability`, `distance`, `quality`, `physic_atack`, `magic_atack`, `physic_defense`, `magic_defense`, `description`, `level`, `level_min`, `id_weapon_type`) VALUES
(1, 'lanza del longinus', 2, 10000, 2.5, 800, 500, 250, 400, 150, 'lanza que mato a jesucristo mi rey', 80, 75, 2),
(2, 'espada de coral', 1, 500, 1.5, 400, 250, 100, 250, 100, 'espada que porta la gurada sirenida', 30, 30, 1),
(3, 'estalada', 1, 10000, 3000000, 3000000, 1000000000, 1000000000, 10000000000, 10000000000, 'vandera de la autodetermincio', 100, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `weapon_type`
--

CREATE TABLE `weapon_type` (
  `id_weapon_type` int(10) UNSIGNED NOT NULL,
  `type` varchar(24) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `icon` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `weapon_type`
--

INSERT INTO `weapon_type` (`id_weapon_type`, `type`, `description`, `icon`) VALUES
(1, 'sword', 'arrma a uno o dos manos facilmente blandible, una de las mas confiables que puede aber', 'sword.png'),
(2, 'spear', 'arma cuerpo a cuerpo de considerable alcance', 'spear.png'),
(3, 'wand', 'poderosos baculos que permiten canalicar la magia del portador', 'wand.png'),
(4, 'daga', 'arma de corto alcance, perfecta para atacar por la espalda', 'daga.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `armors`
--
ALTER TABLE `armors`
  ADD PRIMARY KEY (`id_armor`),
  ADD KEY `id_armor_type` (`id_armor_type`);

--
-- Indexes for table `armor_type`
--
ALTER TABLE `armor_type`
  ADD PRIMARY KEY (`id_armor_type`);

--
-- Indexes for table `characters`
--
ALTER TABLE `characters`
  ADD PRIMARY KEY (`id_character`);

--
-- Indexes for table `characters_weapons`
--
ALTER TABLE `characters_weapons`
  ADD PRIMARY KEY (`id_character_weapon`),
  ADD KEY `id_character` (`id_character`),
  ADD KEY `id_weapons` (`id_weapons`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id_item`),
  ADD KEY `id_item_type` (`id_item_type`);

--
-- Indexes for table `item_type`
--
ALTER TABLE `item_type`
  ADD PRIMARY KEY (`id_item_type`);

--
-- Indexes for table `matirials`
--
ALTER TABLE `matirials`
  ADD PRIMARY KEY (`id_matirials`);

--
-- Indexes for table `stats`
--
ALTER TABLE `stats`
  ADD PRIMARY KEY (`id_stats`);

--
-- Indexes for table `weapons`
--
ALTER TABLE `weapons`
  ADD PRIMARY KEY (`id_weapos`),
  ADD KEY `id_weapon_type` (`id_weapon_type`);

--
-- Indexes for table `weapon_type`
--
ALTER TABLE `weapon_type`
  ADD PRIMARY KEY (`id_weapon_type`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `armors`
--
ALTER TABLE `armors`
  MODIFY `id_armor` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `armor_type`
--
ALTER TABLE `armor_type`
  MODIFY `id_armor_type` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `characters`
--
ALTER TABLE `characters`
  MODIFY `id_character` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `characters_weapons`
--
ALTER TABLE `characters_weapons`
  MODIFY `id_character_weapon` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `id_item` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `item_type`
--
ALTER TABLE `item_type`
  MODIFY `id_item_type` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `matirials`
--
ALTER TABLE `matirials`
  MODIFY `id_matirials` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `stats`
--
ALTER TABLE `stats`
  MODIFY `id_stats` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `weapons`
--
ALTER TABLE `weapons`
  MODIFY `id_weapos` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `weapon_type`
--
ALTER TABLE `weapon_type`
  MODIFY `id_weapon_type` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `armors`
--
ALTER TABLE `armors`
  ADD CONSTRAINT `armors_ibfk_1` FOREIGN KEY (`id_armor_type`) REFERENCES `armor_type` (`id_armor_type`);

--
-- Constraints for table `characters_weapons`
--
ALTER TABLE `characters_weapons`
  ADD CONSTRAINT `characters_weapons_ibfk_1` FOREIGN KEY (`id_character`) REFERENCES `characters` (`id_character`),
  ADD CONSTRAINT `characters_weapons_ibfk_2` FOREIGN KEY (`id_weapons`) REFERENCES `weapons` (`id_weapos`);

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`id_item_type`) REFERENCES `item_type` (`id_item_type`);

--
-- Constraints for table `weapons`
--
ALTER TABLE `weapons`
  ADD CONSTRAINT `weapons_ibfk_1` FOREIGN KEY (`id_weapon_type`) REFERENCES `weapon_type` (`id_weapon_type`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
