-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : mer. 27 mars 2024 à 12:10
-- Version du serveur : 5.7.39
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `recette_api`
--

-- --------------------------------------------------------

--
-- Structure de la table `recettes`
--

CREATE TABLE `recettes` (
  `id` int(11) NOT NULL,
  `recette_name` varchar(50) NOT NULL,
  `recette_origine` varchar(50) NOT NULL,
  `recette_difficulter` tinyint(4) NOT NULL,
  `recette_decription` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `recettes`
--

INSERT INTO `recettes` (`id`, `recette_name`, `recette_origine`, `recette_difficulter`, `recette_decription`) VALUES
(1, 'couscous', 'algérie', 3, 'Le couscous (en berbère : ⵙⴽⵙⵓ seksu ou ⴽⵙⴽⵙⵓ keskesu1, en arabe maghrébin : الطعام، كسكسي، كسكس، سكسو, seksu, kuskus, kusksi, kesksu, t’am) est d\'une part une semoule de blé dur préparée à l\'huile d\'olive (un des aliments de base traditionnel de la cuisine des pays du Maghreb) et d\'autre part, une spécialité culinaire issue de la cuisine berbère, à base de couscous, de légumes, d\'épices, d\'huile d\'olive et de viande (rouge ou de volaille) ou de poisson.Il est, avec le tajine, l\'un des plats emblématiques de la cuisine traditionnelle du Maghreb et, plus largement, des cuisines juives d\'Afrique du Nord, de la cuisine africaine et du régime méditerranéen, cuisiné selon de multiples déclinaisons régionales et culturelles locales. Les plus anciennes traces connues de couscoussiers sont retrouvées dans des sépultures du IIIe siècle av. J.-C., de l\'époque du roi berbère Massinissa de Numidie (dans l\'actuel nord de l\'Algérie)2, un des berceaux de la culture du blé. Connu en France depuis le XVIe siècle, il est intégré dans la cuisine française au début du XXe siècle, via l\'Empire colonial français et les pieds-noirs d\'Algérie.Les savoirs, savoir-faire et pratiques liés à la production et à la consommation du couscous sont inscrits sur la liste représentative du patrimoine culturel immatériel de l’humanité.'),
(2, 'couscous', 'algérie', 3, 'Le couscous (en berbère : ⵙⴽⵙⵓ seksu ou ⴽⵙⴽⵙⵓ keskesu1, en arabe maghrébin : الطعام، كسكسي، كسكس، سكسو, seksu, kuskus, kusksi, kesksu, t’am) est d\'une part une semoule de blé dur préparée à l\'huile d\'olive (un des aliments de base traditionnel de la cuisine des pays du Maghreb) et d\'autre part, une spécialité culinaire issue de la cuisine berbère, à base de couscous, de légumes, d\'épices, d\'huile d\'olive et de viande (rouge ou de volaille) ou de poisson.Il est, avec le tajine, l\'un des plats emblématiques de la cuisine traditionnelle du Maghreb et, plus largement, des cuisines juives d\'Afrique du Nord, de la cuisine africaine et du régime méditerranéen, cuisiné selon de multiples déclinaisons régionales et culturelles locales. Les plus anciennes traces connues de couscoussiers sont retrouvées dans des sépultures du IIIe siècle av. J.-C., de l\'époque du roi berbère Massinissa de Numidie (dans l\'actuel nord de l\'Algérie)2, un des berceaux de la culture du blé. Connu en France depuis le XVIe siècle, il est intégré dans la cuisine française au début du XXe siècle, via l\'Empire colonial français et les pieds-noirs d\'Algérie.Les savoirs, savoir-faire et pratiques liés à la production et à la consommation du couscous sont inscrits sur la liste représentative du patrimoine culturel immatériel de l’humanité.'),
(3, 'couscous', 'algérie', 3, 'Le couscous (en berbère : ⵙⴽⵙⵓ seksu ou ⴽⵙⴽⵙⵓ keskesu1, en arabe maghrébin : الطعام، كسكسي، كسكس، سكسو, seksu, kuskus, kusksi, kesksu, t’am) est d\'une part une semoule de blé dur préparée à l\'huile d\'olive (un des aliments de base traditionnel de la cuisine des pays du Maghreb) et d\'autre part, une spécialité culinaire issue de la cuisine berbère, à base de couscous, de légumes, d\'épices, d\'huile d\'olive et de viande (rouge ou de volaille) ou de poisson.Il est, avec le tajine, l\'un des plats emblématiques de la cuisine traditionnelle du Maghreb et, plus largement, des cuisines juives d\'Afrique du Nord, de la cuisine africaine et du régime méditerranéen, cuisiné selon de multiples déclinaisons régionales et culturelles locales. Les plus anciennes traces connues de couscoussiers sont retrouvées dans des sépultures du IIIe siècle av. J.-C., de l\'époque du roi berbère Massinissa de Numidie (dans l\'actuel nord de l\'Algérie)2, un des berceaux de la culture du blé. Connu en France depuis le XVIe siècle, il est intégré dans la cuisine française au début du XXe siècle, via l\'Empire colonial français et les pieds-noirs d\'Algérie.Les savoirs, savoir-faire et pratiques liés à la production et à la consommation du couscous sont inscrits sur la liste représentative du patrimoine culturel immatériel de l’humanité.');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `recettes`
--
ALTER TABLE `recettes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `recettes`
--
ALTER TABLE `recettes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
