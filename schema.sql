-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-11-2026 a las 10:45:34
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `warhammer_wiki`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `miniaturas`
--

CREATE TABLE `miniaturas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `grupo` varchar(100) NOT NULL,
  `faccion` varchar(100) NOT NULL,
  `edicion` varchar(50) NOT NULL,
  `peana` varchar(50) NOT NULL,
  `imagen` varchar(255) DEFAULT 'default.jpg',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `miniaturas`
--

INSERT INTO `miniaturas` (`id`, `nombre`, `grupo`, `faccion`, `edicion`, `peana`, `imagen`, `created_at`) VALUES
(1, 'Anchorite', 'Imperium', 'Adepta Sororitas', '10th', '32mm', 'adepta_sororitas__anchorite.jpg', '2026-11-10 07:15:12'),
(2, 'Battle Sisters Squad', 'Imperium', 'Adepta Sororitas', '10th', '32mm', 'adepta_sororitas__battle_sisters_squad.jpg', '2026-11-10 07:15:12'),
(3, 'Castigator Battle Tank', 'Imperium', 'Adepta Sororitas', '10th', '32mm', 'adepta_sororitas__castigator_battle_tank.jpg', '2026-11-10 07:15:12'),
(4, 'Exorcist', 'Imperium', 'Adepta Sororitas', '10th', '32mm', 'adepta_sororitas__exorcist.jpg', '2026-11-10 07:15:12'),
(5, 'Imagifier', 'Imperium', 'Adepta Sororitas', '10th', '32mm', 'adepta_sororitas__imagifier.jpg', '2026-11-10 07:15:12'),
(6, 'Immolator', 'Imperium', 'Adepta Sororitas', '10th', '32mm', 'adepta_sororitas__immolator.jpg', '2026-11-10 07:15:12'),
(7, 'Junith Eruita', 'Imperium', 'Adepta Sororitas', '10th', '32mm', 'adepta_sororitas__junith_eruita.jpg', '2026-11-10 07:15:12'),
(8, 'Mortifier', 'Imperium', 'Adepta Sororitas', '10th', '32mm', 'adepta_sororitas__mortifier.jpg', '2026-11-10 07:15:12'),
(9, 'Morvenn Vahl', 'Imperium', 'Adepta Sororitas', '10th', '32mm', 'adepta_sororitas__morvenn_vahl.jpg', '2026-11-10 07:15:12'),
(10, 'Repentia Squad', 'Imperium', 'Adepta Sororitas', '10th', '32mm', 'adepta_sororitas__repentia_squad.jpg', '2026-11-10 07:15:12'),
(11, 'Repentia Superior', 'Imperium', 'Adepta Sororitas', '10th', '32mm', 'adepta_sororitas__repentia_superior.jpg', '2026-11-10 07:15:12'),
(12, 'Retributors Squad', 'Imperium', 'Adepta Sororitas', '10th', '32mm', 'adepta_sororitas__retributors_squad.jpg', '2026-11-10 07:15:12'),
(13, 'Seraphim', 'Imperium', 'Adepta Sororitas', '10th', '32mm', 'adepta_sororitas__seraphim.jpg', '2026-11-10 07:15:12'),
(14, 'Sister Dialogus', 'Imperium', 'Adepta Sororitas', '10th', '32mm', 'adepta_sororitas__sister_dialogus.jpg', '2026-11-10 07:15:12'),
(15, 'Triumph Of Saint Katherine', 'Imperium', 'Adepta Sororitas', '10th', '32mm', 'adepta_sororitas__triumph_of_saint_katherine.jpg', '2026-11-10 07:15:12'),
(16, 'Zephyrim', 'Imperium', 'Adepta Sororitas', '10th', '32mm', 'adepta_sororitas__zephyrim.jpg', '2026-11-10 07:15:12'),
(17, 'Allarus Custodians', 'Imperium', 'Adeptus Custodes', '10th', '32mm', 'adeptus_custodes__allarus_custodians.jpg', '2026-11-10 07:15:12'),
(18, 'Aquilon Terminator Sodality', 'Imperium', 'Adeptus Custodes', '10th', '32mm', 'adeptus_custodes__aquilon_terminator_sodality.jpg', '2026-11-10 07:15:12'),
(19, 'Blade Champion', 'Imperium', 'Adeptus Custodes', '10th', '32mm', 'adeptus_custodes__blade_champion.jpg', '2026-11-10 07:15:12'),
(20, 'Caladius Grav Tank', 'Imperium', 'Adeptus Custodes', '10th', '32mm', 'adeptus_custodes__caladius_grav_tank.jpg', '2026-11-10 07:15:12'),
(21, 'Coronus Grav Carrier', 'Imperium', 'Adeptus Custodes', '10th', '32mm', 'adeptus_custodes__coronus_grav_carrier.jpg', '2026-11-10 07:15:12'),
(22, 'Custodian Guards 2016', 'Imperium', 'Adeptus Custodes', '10th', '32mm', 'adeptus_custodes__custodian_guards_2016.jpg', '2026-11-10 07:15:12'),
(23, 'Custodian Guard Sodality', 'Imperium', 'Adeptus Custodes', '10th', '32mm', 'adeptus_custodes__custodian_guard_sodality.jpg', '2026-11-10 07:15:12'),
(24, 'Custodian Wardens', 'Imperium', 'Adeptus Custodes', '10th', '32mm', 'adeptus_custodes__custodian_wardens.jpg', '2026-11-10 07:15:12'),
(25, 'Gyrfalcon Jetbike Sodality', 'Imperium', 'Adeptus Custodes', '10th', '32mm', 'adeptus_custodes__gyrfalcon_jetbike_sodality.jpg', '2026-11-10 07:15:12'),
(26, 'Pallas Grav Attack', 'Imperium', 'Adeptus Custodes', '10th', '32mm', 'adeptus_custodes__pallas_grav_attack.jpg', '2026-11-10 07:15:12'),
(27, 'Sentinel Guard Sodality', 'Imperium', 'Adeptus Custodes', '10th', '32mm', 'adeptus_custodes__sentinel_guard_sodality.jpg', '2026-11-10 07:15:12'),
(28, 'Shield Captain 2024', 'Imperium', 'Adeptus Custodes', '10th', '32mm', 'adeptus_custodes__shield_captain_2024.jpg', '2026-11-10 07:15:12'),
(29, 'Telemon Heavy Dreadnought 2026', 'Imperium', 'Adeptus Custodes', '10th', '32mm', 'adeptus_custodes__telemon_heavy_dreadnought_2026.jpg', '2026-11-10 07:15:12'),
(30, 'Trajann Valoris', 'Imperium', 'Adeptus Custodes', '10th', '32mm', 'adeptus_custodes__trajann_valoris.jpg', '2026-11-10 07:15:12'),
(31, 'Valerian', 'Imperium', 'Adeptus Custodes', '10th', '32mm', 'adeptus_custodes__valerian.jpg', '2026-11-10 07:15:12'),
(32, 'Venatari Sodality', 'Imperium', 'Adeptus Custodes', '10th', '32mm', 'adeptus_custodes__venatari_sodality.jpg', '2026-11-10 07:15:12'),
(33, 'Vertus Praetor', 'Imperium', 'Adeptus Custodes', '10th', '32mm', 'adeptus_custodes__vertus_praetor.jpg', '2026-11-10 07:15:12'),
(34, 'Archaeopter', 'Imperium', 'Adeptus Mechanicus', '10th', '32mm', 'adeptus_mechanicus__archaeopter.jpg', '2026-11-10 07:15:12'),
(35, 'Belisarius Cawl', 'Imperium', 'Adeptus Mechanicus', '10th', '32mm', 'adeptus_mechanicus__belisarius_cawl.jpg', '2026-11-10 07:15:12'),
(36, 'Cybernetica Datasmith', 'Imperium', 'Adeptus Mechanicus', '10th', '32mm', 'adeptus_mechanicus__cybernetica_datasmith.jpg', '2026-11-10 07:15:12'),
(37, 'Electro Priests', 'Imperium', 'Adeptus Mechanicus', '10th', '32mm', 'adeptus_mechanicus__electro_priests.jpg', '2026-11-10 07:15:12'),
(38, 'Kastelan Robots', 'Imperium', 'Adeptus Mechanicus', '10th', '32mm', 'adeptus_mechanicus__kastelan_robots.jpg', '2026-11-10 07:15:12'),
(39, 'Kataphron Battle Servitors', 'Imperium', 'Adeptus Mechanicus', '10th', '32mm', 'adeptus_mechanicus__kataphron_battle_servitors.jpg', '2026-11-10 07:15:12'),
(40, 'Onager Dunecrawler', 'Imperium', 'Adeptus Mechanicus', '10th', '32mm', 'adeptus_mechanicus__onager_dunecrawler.jpg', '2026-11-10 07:15:12'),
(41, 'Pteraxii', 'Imperium', 'Adeptus Mechanicus', '10th', '32mm', 'adeptus_mechanicus__pteraxii.jpg', '2026-11-10 07:15:12'),
(42, 'Serberys Sulphurhounds', 'Imperium', 'Adeptus Mechanicus', '10th', '32mm', 'adeptus_mechanicus__serberys_sulphurhounds.jpg', '2026-11-10 07:15:12'),
(43, 'Sicarian Infiltrators', 'Imperium', 'Adeptus Mechanicus', '10th', '32mm', 'adeptus_mechanicus__sicarian_infiltrators.jpg', '2026-11-10 07:15:12'),
(44, 'Sicarian Ruststalkers', 'Imperium', 'Adeptus Mechanicus', '10th', '32mm', 'adeptus_mechanicus__sicarian_ruststalkers.jpg', '2026-11-10 07:15:12'),
(45, 'Skitarii Rangers', 'Imperium', 'Adeptus Mechanicus', '10th', '32mm', 'adeptus_mechanicus__skitarii_rangers.jpg', '2026-11-10 07:15:12'),
(46, 'Skitarii Vanguard', 'Imperium', 'Adeptus Mechanicus', '10th', '32mm', 'adeptus_mechanicus__skitarii_vanguard.jpg', '2026-11-10 07:15:12'),
(47, 'Skorpius Disintegrator', 'Imperium', 'Adeptus Mechanicus', '10th', '32mm', 'adeptus_mechanicus__skorpius_disintegrator.jpg', '2026-11-10 07:15:12'),
(48, 'Skorpius Dunerider', 'Imperium', 'Adeptus Mechanicus', '10th', '32mm', 'adeptus_mechanicus__skorpius_dunerider.jpg', '2026-11-10 07:15:12'),
(49, 'Sydonian Dragoon', 'Imperium', 'Adeptus Mechanicus', '10th', '32mm', 'adeptus_mechanicus__sydonian_dragoon.jpg', '2026-11-10 07:15:12'),
(50, 'Sydonian Skatros', 'Imperium', 'Adeptus Mechanicus', '10th', '32mm', 'adeptus_mechanicus__sydonian_skatros.jpg', '2026-11-10 07:15:12'),
(51, 'Tech Priest Dominus', 'Imperium', 'Adeptus Mechanicus', '10th', '32mm', 'adeptus_mechanicus__tech_priest_dominus.jpg', '2026-11-10 07:15:12'),
(52, 'Tech Priest Manipulus', 'Imperium', 'Adeptus Mechanicus', '10th', '32mm', 'adeptus_mechanicus__tech_priest_manipulus.jpg', '2026-11-10 07:15:12'),
(53, 'Asurmen 2025', 'Xenos', 'Aeldari', '10th', '32mm', 'aeldari__asurmen_2025.jpg', '2026-11-10 07:15:12'),
(54, 'Avatar Of Khaine 2022', 'Xenos', 'Aeldari', '10th', '32mm', 'aeldari__avatar_of_khaine_2022.jpg', '2026-11-10 07:15:12'),
(55, 'Shroud Runners', 'Xenos', 'Aeldari', '10th', '32mm', 'aeldari__shroud_runners.jpg', '2026-11-10 07:15:12'),
(56, 'Arcadian Leontus', 'Xenos', 'Astra Militarum', '10th', '32mm', 'astra_militarum__arcadian_leontus.jpg', '2026-11-10 07:15:12'),
(57, 'Armoured Sentinel', 'Xenos', 'Astra Militarum', '10th', '32mm', 'astra_militarum__armoured_sentinel.jpg', '2026-11-10 07:15:12'),
(58, 'Attilan Rough Riders', 'Xenos', 'Astra Militarum', '10th', '32mm', 'astra_militarum__attilan_rough_riders.jpg', '2026-11-10 07:15:12'),
(59, 'Cadian Castellan', 'Xenos', 'Astra Militarum', '10th', '32mm', 'astra_militarum__cadian_castellan.jpg', '2026-11-10 07:15:12'),
(60, 'Cadian Command Squad', 'Xenos', 'Astra Militarum', '10th', '32mm', 'astra_militarum__cadian_command_squad.jpg', '2026-11-10 07:15:12'),
(61, 'Cadian Heavy Weapons Squad', 'Xenos', 'Astra Militarum', '10th', '32mm', 'astra_militarum__cadian_heavy_weapons_squad.jpg', '2026-11-10 07:15:12'),
(62, 'Cadian Shock Troopers', 'Xenos', 'Astra Militarum', '10th', '32mm', 'astra_militarum__cadian_shock_troopers.jpg', '2026-11-10 07:15:12'),
(63, 'Death Korps Of Krieg Veteran Guardsmen', 'Xenos', 'Astra Militarum', '10th', '32mm', 'astra_militarum__death_korps_of_krieg_veteran_guardsmen.jpg', '2026-11-10 07:15:12'),
(64, 'Field Ordnance Battery Bombast Cannon', 'Xenos', 'Astra Militarum', '10th', '32mm', 'astra_militarum__field_ordnance_battery_bombast_cannon.jpg', '2026-11-10 07:15:12'),
(65, 'Field Ordnance Battery Heavy Lascannon', 'Xenos', 'Astra Militarum', '10th', '32mm', 'astra_militarum__field_ordnance_battery_heavy_lascannon.jpg', '2026-11-10 07:15:12'),
(66, 'Field Ordnance Battery Malleus Rocket Launcher', 'Xenos', 'Astra Militarum', '10th', '32mm', 'astra_militarum__field_ordnance_battery_malleus_rocket_launcher.jpg', '2026-11-10 07:15:12'),
(67, 'Gaunt S Ghosts', 'Xenos', 'Astra Militarum', '10th', '32mm', 'astra_militarum__gaunt_s_ghosts.jpg', '2026-11-10 07:15:12'),
(68, 'Kasrkin', 'Xenos', 'Astra Militarum', '10th', '32mm', 'astra_militarum__kasrkin.jpg', '2026-11-10 07:15:12'),
(69, 'Minka Lesk', 'Xenos', 'Astra Militarum', '10th', '32mm', 'astra_militarum__minka_lesk.jpg', '2026-11-10 07:15:12'),
(70, 'Rogal Dorn Battle Tank', 'Xenos', 'Astra Militarum', '10th', '32mm', 'astra_militarum__rogal_dorn_battle_tank.jpg', '2026-11-10 07:15:12'),
(71, 'Scout Sentinel', 'Xenos', 'Astra Militarum', '10th', '32mm', 'astra_militarum__scout_sentinel.jpg', '2026-11-10 07:15:12'),
(72, 'Sly Marbo', 'Xenos', 'Astra Militarum', '10th', '32mm', 'astra_militarum__sly_marbo.jpg', '2026-11-10 07:15:12'),
(73, 'Tempestus Scions', 'Xenos', 'Astra Militarum', '10th', '32mm', 'astra_militarum__tempestus_scions.jpg', '2026-11-10 07:15:12'),
(74, 'Ursula Creed', 'Xenos', 'Astra Militarum', '10th', '32mm', 'astra_militarum__ursula_creed.jpg', '2026-11-10 07:15:12'),
(75, 'Be Lakor', 'Chaos', 'Chaos Daemons', '10th', '32mm', 'chaos_daemons__be_lakor.jpg', '2026-11-10 07:15:12'),
(76, 'Burning Chariot', 'Chaos', 'Chaos Daemons', '10th', '32mm', 'chaos_daemons__burning_chariot.jpg', '2026-11-10 07:15:12'),
(77, 'Flamers Of Tzeentch', 'Chaos', 'Chaos Daemons', '10th', '32mm', 'chaos_daemons__flamers_of_tzeentch.jpg', '2026-11-10 07:15:12'),
(78, 'Great Unclean One', 'Chaos', 'Chaos Daemons', '10th', '32mm', 'chaos_daemons__great_unclean_one.jpg', '2026-11-10 07:15:12'),
(79, 'Lord Of Change', 'Chaos', 'Chaos Daemons', '10th', '32mm', 'chaos_daemons__lord_of_change.jpg', '2026-11-10 07:15:12'),
(80, 'Plague Drones', 'Chaos', 'Chaos Daemons', '10th', '32mm', 'chaos_daemons__plague_drones.jpg', '2026-11-10 07:15:12'),
(81, 'The Changeling', 'Chaos', 'Chaos Daemons', '10th', '32mm', 'chaos_daemons__the_changeling.jpg', '2026-11-10 07:15:12'),
(82, 'Accursed Cultists', 'Imperium', 'Chaos Space Marines', '10th', '32mm', 'chaos_space_marines__accursed_cultists.jpg', '2026-11-10 07:15:12'),
(83, 'Chaos Chosen', 'Imperium', 'Chaos Space Marines', '10th', '32mm', 'chaos_space_marines__chaos_chosen.jpg', '2026-11-10 07:15:12'),
(84, 'Chaos Cultists', 'Imperium', 'Chaos Space Marines', '10th', '32mm', 'chaos_space_marines__chaos_cultists.jpg', '2026-11-10 07:15:12'),
(85, 'Chaos Sorcerer', 'Imperium', 'Chaos Space Marines', '10th', '32mm', 'chaos_space_marines__chaos_sorcerer.jpg', '2026-11-10 07:15:12'),
(86, 'Chaos Terminators', 'Imperium', 'Chaos Space Marines', '10th', '32mm', 'chaos_space_marines__chaos_terminators.jpg', '2026-11-10 07:15:12'),
(87, 'Dark Commune', 'Imperium', 'Chaos Space Marines', '10th', '32mm', 'chaos_space_marines__dark_commune.jpg', '2026-11-10 07:15:12'),
(88, 'Fabius Bile', 'Imperium', 'Chaos Space Marines', '10th', '32mm', 'chaos_space_marines__fabius_bile.jpg', '2026-11-10 07:15:12'),
(89, 'Havocs', 'Imperium', 'Chaos Space Marines', '10th', '32mm', 'chaos_space_marines__havocs.jpg', '2026-11-10 07:15:12'),
(90, 'Obliterators', 'Imperium', 'Chaos Space Marines', '10th', '32mm', 'chaos_space_marines__obliterators.jpg', '2026-11-10 07:15:12'),
(91, 'Warpsmith', 'Imperium', 'Chaos Space Marines', '10th', '32mm', 'chaos_space_marines__warpsmith.jpg', '2026-11-10 07:15:12'),
(92, 'Biologus Putrifier', 'Imperium', 'Death Guard', '10th', '32mm', 'death_guard__biologus_putrifier.jpg', '2026-11-10 07:15:12'),
(93, 'Blightlord Terminators', 'Imperium', 'Death Guard', '10th', '32mm', 'death_guard__blightlord_terminators.jpg', '2026-11-10 07:15:12'),
(94, 'Foetid Bloat Drone', 'Imperium', 'Death Guard', '10th', '32mm', 'death_guard__foetid_bloat_drone.jpg', '2026-11-10 07:15:12'),
(95, 'Foul Blightspawn', 'Imperium', 'Death Guard', '10th', '32mm', 'death_guard__foul_blightspawn.jpg', '2026-11-10 07:15:12'),
(96, 'Lord Of Virulence', 'Imperium', 'Death Guard', '10th', '32mm', 'death_guard__lord_of_virulence.jpg', '2026-11-10 07:15:12'),
(97, 'Mortarion', 'Imperium', 'Death Guard', '10th', '32mm', 'death_guard__mortarion.jpg', '2026-11-10 07:15:12'),
(98, 'Myphitic Blight Hauler', 'Imperium', 'Death Guard', '10th', '32mm', 'death_guard__myphitic_blight_hauler.jpg', '2026-11-10 07:15:12'),
(99, 'Plagueburst Crawler', 'Imperium', 'Death Guard', '10th', '32mm', 'death_guard__plagueburst_crawler.jpg', '2026-11-10 07:15:12'),
(100, 'Plague Marine Icon Bearer', 'Imperium', 'Death Guard', '10th', '32mm', 'death_guard__plague_marine_icon_bearer.jpg', '2026-11-10 07:15:12'),
(101, 'Plague Surgeon', 'Imperium', 'Death Guard', '10th', '32mm', 'death_guard__plague_surgeon.jpg', '2026-11-10 07:15:12'),
(102, 'Poxwalkers', 'Imperium', 'Death Guard', '10th', '32mm', 'death_guard__poxwalkers.jpg', '2026-11-10 07:15:12'),
(103, 'Tallyman', 'Imperium', 'Death Guard', '10th', '32mm', 'death_guard__tallyman.jpg', '2026-11-10 07:15:12'),
(104, 'Typhus', 'Imperium', 'Death Guard', '10th', '32mm', 'death_guard__typhus.jpg', '2026-11-10 07:15:12'),
(105, 'Hellions', 'Xenos', 'Drukhari', '10th', '32mm', 'drukhari__hellions.jpg', '2026-11-10 07:15:12'),
(106, 'Kabalite Warriors', 'Xenos', 'Drukhari', '10th', '32mm', 'drukhari__kabalite_warriors.jpg', '2026-11-10 07:15:12'),
(107, 'Scourges', 'Xenos', 'Drukhari', '10th', '32mm', 'drukhari__scourges.jpg', '2026-11-10 07:15:12'),
(108, 'Venom', 'Xenos', 'Drukhari', '10th', '32mm', 'drukhari__venom.jpg', '2026-11-10 07:15:12'),
(109, 'Wyches', 'Xenos', 'Drukhari', '10th', '32mm', 'drukhari__wyches.jpg', '2026-11-10 07:15:12'),
(110, 'Abominant', 'Xenos', 'Genestealer Cults', '10th', '32mm', 'genestealer_cults__abominant.jpg', '2026-11-10 07:15:12'),
(111, 'Achilles Ridgerunner', 'Xenos', 'Genestealer Cults', '10th', '32mm', 'genestealer_cults__achilles_ridgerunner.jpg', '2026-11-10 07:15:12'),
(112, 'Acolyte Hybrids', 'Xenos', 'Genestealer Cults', '10th', '32mm', 'genestealer_cults__acolyte_hybrids.jpg', '2026-11-10 07:15:12'),
(113, 'Acolyte Iconward', 'Xenos', 'Genestealer Cults', '10th', '32mm', 'genestealer_cults__acolyte_iconward.jpg', '2026-11-10 07:15:12'),
(114, 'Atalan Jackals', 'Xenos', 'Genestealer Cults', '10th', '32mm', 'genestealer_cults__atalan_jackals.jpg', '2026-11-10 07:15:12'),
(115, 'Clamavus', 'Xenos', 'Genestealer Cults', '10th', '32mm', 'genestealer_cults__clamavus.jpg', '2026-11-10 07:15:12'),
(116, 'Goliath Truck', 'Xenos', 'Genestealer Cults', '10th', '32mm', 'genestealer_cults__goliath_truck.jpg', '2026-11-10 07:15:12'),
(117, 'Hybrid Metamorphs', 'Xenos', 'Genestealer Cults', '10th', '32mm', 'genestealer_cults__hybrid_metamorphs.jpg', '2026-11-10 07:15:12'),
(118, 'Jackal Alphus', 'Xenos', 'Genestealer Cults', '10th', '32mm', 'genestealer_cults__jackal_alphus.jpg', '2026-11-10 07:15:12'),
(119, 'Kelermorph', 'Xenos', 'Genestealer Cults', '10th', '32mm', 'genestealer_cults__kelermorph.jpg', '2026-11-10 07:15:12'),
(120, 'Locus', 'Xenos', 'Genestealer Cults', '10th', '32mm', 'genestealer_cults__locus.jpg', '2026-11-10 07:15:12'),
(121, 'Neophyte Hybrids', 'Xenos', 'Genestealer Cults', '10th', '32mm', 'genestealer_cults__neophyte_hybrids.jpg', '2026-11-10 07:15:12'),
(122, 'Nexos', 'Xenos', 'Genestealer Cults', '10th', '32mm', 'genestealer_cults__nexos.jpg', '2026-11-10 07:15:12'),
(123, 'Reductus Saboteur', 'Xenos', 'Genestealer Cults', '10th', '32mm', 'genestealer_cults__reductus_saboteur.jpg', '2026-11-10 07:15:12'),
(124, 'Garran Crowe 2021', 'Xenos', 'Grey Knights', '10th', '32mm', 'grey_knights__garran_crowe_2021.jpg', '2026-11-10 07:15:12'),
(125, 'Grand Master Voldus', 'Xenos', 'Grey Knights', '10th', '32mm', 'grey_knights__grand_master_voldus.jpg', '2026-11-10 07:15:12'),
(126, 'Grey Knights Paladin Squad', 'Xenos', 'Grey Knights', '10th', '32mm', 'grey_knights__grey_knights_paladin_squad.jpg', '2026-11-10 07:15:12'),
(127, 'Interceptor Squad', 'Xenos', 'Grey Knights', '10th', '32mm', 'grey_knights__interceptor_squad.jpg', '2026-11-10 07:15:12'),
(128, 'Strike Squad', 'Xenos', 'Grey Knights', '10th', '32mm', 'grey_knights__strike_squad.jpg', '2026-11-10 07:15:12'),
(129, 'Arkanyst Evaluator', 'Xenos', 'Leagues Of Votann', '10th', '32mm', 'leagues_of_votann__arkanyst_evaluator.jpg', '2026-11-10 07:15:12'),
(130, 'Brokhyr Iron Master', 'Xenos', 'Leagues Of Votann', '10th', '32mm', 'leagues_of_votann__brokhyr_iron_master.jpg', '2026-11-10 07:15:12'),
(131, 'Brokhyr Thunderkyn', 'Xenos', 'Leagues Of Votann', '10th', '32mm', 'leagues_of_votann__brokhyr_thunderkyn.jpg', '2026-11-10 07:15:12'),
(132, 'Buri Aegnirssen', 'Xenos', 'Leagues Of Votann', '10th', '32mm', 'leagues_of_votann__buri_aegnirssen.jpg', '2026-11-10 07:15:12'),
(133, 'Cthonian Beserks', 'Xenos', 'Leagues Of Votann', '10th', '32mm', 'leagues_of_votann__cthonian_beserks.jpg', '2026-11-10 07:15:12'),
(134, 'Cthonian Earthshakers', 'Xenos', 'Leagues Of Votann', '10th', '32mm', 'leagues_of_votann__cthonian_earthshakers.jpg', '2026-11-10 07:15:12'),
(135, 'Einhyr Champion', 'Xenos', 'Leagues Of Votann', '10th', '32mm', 'leagues_of_votann__einhyr_champion.jpg', '2026-11-10 07:15:12'),
(136, 'Einhyr Hearthguard', 'Xenos', 'Leagues Of Votann', '10th', '32mm', 'leagues_of_votann__einhyr_hearthguard.jpg', '2026-11-10 07:15:12'),
(137, 'Grimnyr', 'Xenos', 'Leagues Of Votann', '10th', '32mm', 'leagues_of_votann__grimnyr.jpg', '2026-11-10 07:15:12'),
(138, 'Hearthkyn Warriors', 'Xenos', 'Leagues Of Votann', '10th', '32mm', 'leagues_of_votann__hearthkyn_warriors.jpg', '2026-11-10 07:15:12'),
(139, 'Hekaton Land Fortress', 'Xenos', 'Leagues Of Votann', '10th', '32mm', 'leagues_of_votann__hekaton_land_fortress.jpg', '2026-11-10 07:15:12'),
(140, 'Hernkyn Pioneers', 'Xenos', 'Leagues Of Votann', '10th', '32mm', 'leagues_of_votann__hernkyn_pioneers.jpg', '2026-11-10 07:15:12'),
(141, 'Hernkyn Yaegirs', 'Xenos', 'Leagues Of Votann', '10th', '32mm', 'leagues_of_votann__hernkyn_yaegirs.jpg', '2026-11-10 07:15:12'),
(142, 'Ironkin Steeljacks', 'Xenos', 'Leagues Of Votann', '10th', '32mm', 'leagues_of_votann__ironkin_steeljacks.jpg', '2026-11-10 07:15:12'),
(143, 'Kahl', 'Xenos', 'Leagues Of Votann', '10th', '32mm', 'leagues_of_votann__kahl.jpg', '2026-11-10 07:15:12'),
(144, 'Memnyr Strategist', 'Xenos', 'Leagues Of Votann', '10th', '32mm', 'leagues_of_votann__memnyr_strategist.jpg', '2026-11-10 07:15:12'),
(145, 'Uthar The Destined', 'Xenos', 'Leagues Of Votann', '10th', '32mm', 'leagues_of_votann__uthar_the_destined.jpg', '2026-11-10 07:15:12'),
(146, 'Canoptek Doomstalker', 'Xenos', 'Necrons', '10th', '32mm', 'necrons__canoptek_doomstalker.jpg', '2026-11-10 07:15:12'),
(147, 'Chronomancer', 'Xenos', 'Necrons', '10th', '32mm', 'necrons__chronomancer.jpg', '2026-11-10 07:15:12'),
(148, 'Convergence Of Dominion', 'Xenos', 'Necrons', '10th', '32mm', 'necrons__convergence_of_dominion.jpg', '2026-11-10 07:15:12'),
(149, 'C Tan Shard Of The Void Dragon', 'Xenos', 'Necrons', '10th', '32mm', 'necrons__c_tan_shard_of_the_void_dragon.jpg', '2026-11-10 07:15:12'),
(150, 'Hexmark Destroyer', 'Xenos', 'Necrons', '10th', '32mm', 'necrons__hexmark_destroyer.jpg', '2026-11-10 07:15:12'),
(151, 'Lokhust Heavy Destroyer', 'Xenos', 'Necrons', '10th', '32mm', 'necrons__lokhust_heavy_destroyer.jpg', '2026-11-10 07:15:12'),
(152, 'Ophydian Destroyers', 'Xenos', 'Necrons', '10th', '32mm', 'necrons__ophydian_destroyers.jpg', '2026-11-10 07:15:12'),
(153, 'Psychomancer', 'Xenos', 'Necrons', '10th', '32mm', 'necrons__psychomancer.jpg', '2026-11-10 07:15:12'),
(154, 'Skorpekh Destroyers', 'Xenos', 'Necrons', '10th', '32mm', 'necrons__skorpekh_destroyers.jpg', '2026-11-10 07:15:12'),
(155, 'Skorpekh Lord', 'Xenos', 'Necrons', '10th', '32mm', 'necrons__skorpekh_lord.jpg', '2026-11-10 07:15:12'),
(156, 'Szarekh The Silent King', 'Xenos', 'Necrons', '10th', '32mm', 'necrons__szarekh_the_silent_king.jpg', '2026-11-10 07:15:12'),
(157, 'Beastboss', 'Xenos', 'Orks', '10th', '32mm', 'orks__beastboss.jpg', '2026-11-10 07:15:12'),
(158, 'Beastboss On Squigosaur', 'Xenos', 'Orks', '10th', '32mm', 'orks__beastboss_on_squigosaur.jpg', '2026-11-10 07:15:12'),
(159, 'Beast Snagga Boyz', 'Xenos', 'Orks', '10th', '32mm', 'orks__beast_snagga_boyz.jpg', '2026-11-10 07:15:12'),
(160, 'Boomdakka Snazzwagon', 'Xenos', 'Orks', '10th', '32mm', 'orks__boomdakka_snazzwagon.jpg', '2026-11-10 07:15:12'),
(161, 'Ghazghkull Thraka 2020', 'Xenos', 'Orks', '10th', '32mm', 'orks__ghazghkull_thraka_2020.jpg', '2026-11-10 07:15:12'),
(162, 'Kill Rig', 'Xenos', 'Orks', '10th', '32mm', 'orks__kill_rig.jpg', '2026-11-10 07:15:12'),
(163, 'Kustom Boosta Blasta', 'Xenos', 'Orks', '10th', '32mm', 'orks__kustom_boosta_blasta.jpg', '2026-11-10 07:15:12'),
(164, 'Mozrog Skragbad', 'Xenos', 'Orks', '10th', '32mm', 'orks__mozrog_skragbad.jpg', '2026-11-10 07:15:12'),
(165, 'Painboss', 'Xenos', 'Orks', '10th', '32mm', 'orks__painboss.jpg', '2026-11-10 07:15:12'),
(166, 'Rukkatrukk Squigbuggy', 'Xenos', 'Orks', '10th', '32mm', 'orks__rukkatrukk_squigbuggy.jpg', '2026-11-10 07:15:12'),
(167, 'Warboss In Mega Armour', 'Xenos', 'Orks', '10th', '32mm', 'orks__warboss_in_mega_armour.jpg', '2026-11-10 07:15:12'),
(168, 'Assault Intercessors', 'Imperium', 'Space Marines', '10th', '32mm', 'space_marines__assault_intercessors.jpg', '2026-11-10 07:15:12'),
(169, 'Bladeguard Ancient', 'Imperium', 'Space Marines', '10th', '32mm', 'space_marines__bladeguard_ancient.jpg', '2026-11-10 07:15:12'),
(170, 'Bladeguard Veterans', 'Imperium', 'Space Marines', '10th', '32mm', 'space_marines__bladeguard_veterans.jpg', '2026-11-10 07:15:12'),
(171, 'Captain In Terminator Armour', 'Imperium', 'Space Marines', '10th', '32mm', 'space_marines__captain_in_terminator_armour.jpg', '2026-11-10 07:15:12'),
(172, 'Captain With Relic Shield', 'Imperium', 'Space Marines', '10th', '32mm', 'space_marines__captain_with_relic_shield.jpg', '2026-11-10 07:15:12'),
(173, 'Chaplain On Bike', 'Imperium', 'Space Marines', '10th', '32mm', 'space_marines__chaplain_on_bike.jpg', '2026-11-10 07:15:12'),
(174, 'Company Heroes', 'Imperium', 'Space Marines', '10th', '32mm', 'space_marines__company_heroes.jpg', '2026-11-10 07:15:12'),
(175, 'Drop Pod', 'Imperium', 'Space Marines', '10th', '32mm', 'space_marines__drop_pod.jpg', '2026-11-10 07:15:12'),
(176, 'Eradicators', 'Imperium', 'Space Marines', '10th', '32mm', 'space_marines__eradicators.jpg', '2026-11-10 07:15:12'),
(177, 'Firestrike Servo Turret', 'Imperium', 'Space Marines', '10th', '32mm', 'space_marines__firestrike_servo_turret.jpg', '2026-11-10 07:15:12'),
(178, 'Gladiator Battle Tank', 'Imperium', 'Space Marines', '10th', '32mm', 'space_marines__gladiator_battle_tank.jpg', '2026-11-10 07:15:12'),
(179, 'Hammerfall Bunker', 'Imperium', 'Space Marines', '10th', '32mm', 'space_marines__hammerfall_bunker.jpg', '2026-11-10 07:15:12'),
(180, 'Heavy Intercessors', 'Imperium', 'Space Marines', '10th', '32mm', 'space_marines__heavy_intercessors.jpg', '2026-11-10 07:15:12'),
(181, 'Invader Atv', 'Imperium', 'Space Marines', '10th', '32mm', 'space_marines__invader_atv.jpg', '2026-11-10 07:15:12'),
(182, 'Judiciar', 'Imperium', 'Space Marines', '10th', '32mm', 'space_marines__judiciar.jpg', '2026-11-10 07:15:12'),
(183, 'Primaris Outriders', 'Imperium', 'Space Marines', '10th', '32mm', 'space_marines__primaris_outriders.jpg', '2026-11-10 07:15:12'),
(184, 'Primaris Techmarine', 'Imperium', 'Space Marines', '10th', '32mm', 'space_marines__primaris_techmarine.jpg', '2026-11-10 07:15:12'),
(185, 'Storm Speeder', 'Imperium', 'Space Marines', '10th', '32mm', 'space_marines__storm_speeder.jpg', '2026-11-10 07:15:12'),
(186, 'Exalted Sorcerers', 'Chaos', 'Thousand Sons', '10th', '32mm', 'thousand_sons__exalted_sorcerers.jpg', '2026-11-10 07:15:12'),
(187, 'Infernal Master', 'Chaos', 'Thousand Sons', '10th', '32mm', 'thousand_sons__infernal_master.jpg', '2026-11-10 07:15:12'),
(188, 'Magnus The Red 2016', 'Chaos', 'Thousand Sons', '10th', '32mm', 'thousand_sons__magnus_the_red_2016.jpg', '2026-11-10 07:15:12'),
(189, 'Rubric Marines 2016', 'Chaos', 'Thousand Sons', '10th', '32mm', 'thousand_sons__rubric_marines_2016.jpg', '2026-11-10 07:15:12'),
(190, 'Scarab Occult Terminators', 'Chaos', 'Thousand Sons', '10th', '32mm', 'thousand_sons__scarab_occult_terminators.jpg', '2026-11-10 07:15:12'),
(191, 'Sekhetar Robots', 'Chaos', 'Thousand Sons', '10th', '32mm', 'thousand_sons__sekhetar_robots.jpg', '2026-11-10 07:15:12'),
(192, 'Tzaangor Shaman', 'Chaos', 'Thousand Sons', '10th', '32mm', 'thousand_sons__tzaangor_shaman.jpg', '2026-11-10 07:15:12'),
(193, 'Neurogaunts', 'Xenos', 'Tyranids', '10th', '32mm', 'tyranids__neurogaunts.jpg', '2026-11-10 07:15:12'),
(194, 'Neurolictor', 'Xenos', 'Tyranids', '10th', '32mm', 'tyranids__neurolictor.jpg', '2026-11-10 07:15:12'),
(195, 'Norn Emissary', 'Xenos', 'Tyranids', '10th', '32mm', 'tyranids__norn_emissary.jpg', '2026-11-10 07:15:12'),
(196, 'Psychophage', 'Xenos', 'Tyranids', '10th', '32mm', 'tyranids__psychophage.jpg', '2026-11-10 07:15:12'),
(197, 'Von Ryan S Leapers', 'Xenos', 'Tyranids', '10th', '32mm', 'tyranids__von_ryan_s_leapers.jpg', '2026-11-10 07:15:12'),
(198, 'Cadre Fireblade', 'Xenos', 'T Au Empire', '10th', '32mm', 't_au_empire__cadre_fireblade.jpg', '2026-11-10 07:15:12'),
(199, 'Commander Farsight 2023', 'Xenos', 'T Au Empire', '10th', '32mm', 't_au_empire__commander_farsight_2023.jpg', '2026-11-10 07:15:12'),
(200, 'Flesh Shaper', 'Xenos', 'T Au Empire', '10th', '32mm', 't_au_empire__flesh_shaper.jpg', '2026-11-10 07:15:12'),
(201, 'Krootox Rampagers', 'Xenos', 'T Au Empire', '10th', '32mm', 't_au_empire__krootox_rampagers.jpg', '2026-11-10 07:15:12'),
(202, 'Kv128 Stormsurge', 'Xenos', 'T Au Empire', '10th', '32mm', 't_au_empire__kv128_stormsurge.jpg', '2026-11-10 07:15:12'),
(203, 'Razorshark Strike Fighter', 'Xenos', 'T Au Empire', '10th', '32mm', 't_au_empire__razorshark_strike_fighter.jpg', '2026-11-10 07:15:12'),
(204, 'Sun Shark Bomber', 'Xenos', 'T Au Empire', '10th', '32mm', 't_au_empire__sun_shark_bomber.jpg', '2026-11-10 07:15:12'),
(205, 'Tau Pathfinders', 'Xenos', 'T Au Empire', '10th', '32mm', 't_au_empire__tau_pathfinders.jpg', '2026-11-10 07:15:12'),
(206, 'Trail Shaper', 'Xenos', 'T Au Empire', '10th', '32mm', 't_au_empire__trail_shaper.jpg', '2026-11-10 07:15:12'),
(207, 'War Shaper', 'Xenos', 'T Au Empire', '10th', '32mm', 't_au_empire__war_shaper.jpg', '2026-11-10 07:15:12'),
(208, 'Xv104 Riptide', 'Xenos', 'T Au Empire', '10th', '32mm', 't_au_empire__xv104_riptide.jpg', '2026-11-10 07:15:12'),
(209, 'Xv88 Broadside Battlesuit', 'Xenos', 'T Au Empire', '10th', '32mm', 't_au_empire__xv88_broadside_battlesuit.jpg', '2026-11-10 07:15:12'),
(210, 'Xv95 Ghostkeel', 'Xenos', 'T Au Empire', '10th', '32mm', 't_au_empire__xv95_ghostkeel.jpg', '2026-11-10 07:15:12'),
(211, 'Brass Scorpion', 'Xenos', 'World Eaters', '10th', '32mm', 'world_eaters__brass_scorpion.jpg', '2026-11-10 07:15:12'),
(212, 'Exalted Eightbound', 'Xenos', 'World Eaters', '10th', '32mm', 'world_eaters__exalted_eightbound.jpg', '2026-11-10 07:15:12'),
(213, 'Jakhals', 'Xenos', 'World Eaters', '10th', '32mm', 'world_eaters__jakhals.jpg', '2026-11-10 07:15:12'),
(214, 'Lord Invocatus 2023', 'Xenos', 'World Eaters', '10th', '32mm', 'world_eaters__lord_invocatus_2023.jpg', '2026-11-10 07:15:12'),
(215, 'Lord Of Skulls', 'Xenos', 'World Eaters', '10th', '32mm', 'world_eaters__lord_of_skulls.jpg', '2026-11-10 07:15:12'),
(216, 'Slaughterbound', 'Xenos', 'World Eaters', '10th', '32mm', 'world_eaters__slaughterbound.jpg', '2026-11-10 07:15:12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` enum('admin','usuario') DEFAULT 'usuario'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `email`, `password`, `rol`) VALUES
(1, 'gabo', 'gabo@gmail.com', '$2b$10$0PlE2.tw8BU.LRUqPTZR2eQmwhmJ/RN7ct7s/BiQ0zZKRqjGhbgwK', 'admin'),
(2, 'jero ', 'jero@gmail.com', '$2b$10$Jmz/1GBiAfvNnwEqFDBYNubqFXofsZR05j.ax1xVXM8qXRrTiUT2a', 'usuario');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `miniaturas`
--
ALTER TABLE `miniaturas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `miniaturas`
--
ALTER TABLE `miniaturas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=219;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
