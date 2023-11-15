-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 15 nov 2023 om 14:30
-- Serverversie: 10.4.27-MariaDB
-- PHP-versie: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `football`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `assist`
--

CREATE TABLE `assist` (
  `AssistID` int(11) NOT NULL,
  `MatchID` int(11) NOT NULL,
  `GoalID` int(11) NOT NULL,
  `PlayerID` int(11) NOT NULL,
  `MinuteAssisted` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `goal`
--

CREATE TABLE `goal` (
  `GoalID` int(11) NOT NULL,
  `MatchID` int(11) NOT NULL,
  `PlayerID` int(11) NOT NULL,
  `MinuteScored` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `match`
--

CREATE TABLE `match` (
  `MatchID` int(11) NOT NULL,
  `HomeTeamID` int(11) NOT NULL,
  `AwayTeamID` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Venue` varchar(255) NOT NULL,
  `Refere` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `player`
--

CREATE TABLE `player` (
  `PlayerID` int(11) NOT NULL,
  `TeamID` int(11) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `DateOfBirth` date NOT NULL,
  `Nationality` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `team`
--

CREATE TABLE `team` (
  `TeamID` int(11) NOT NULL,
  `TeamName` varchar(255) NOT NULL,
  `CoachName` varchar(255) NOT NULL,
  `FoundationYear` year(4) NOT NULL,
  `HomeStadium` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `assist`
--
ALTER TABLE `assist`
  ADD PRIMARY KEY (`AssistID`),
  ADD KEY `GoalID` (`GoalID`),
  ADD KEY `MatchID` (`MatchID`),
  ADD KEY `PlayerID` (`PlayerID`);

--
-- Indexen voor tabel `goal`
--
ALTER TABLE `goal`
  ADD PRIMARY KEY (`GoalID`),
  ADD KEY `MatchID` (`MatchID`),
  ADD KEY `PlayerID` (`PlayerID`);

--
-- Indexen voor tabel `match`
--
ALTER TABLE `match`
  ADD PRIMARY KEY (`MatchID`),
  ADD KEY `AwayTeamID` (`AwayTeamID`),
  ADD KEY `HomeTeamID` (`HomeTeamID`);

--
-- Indexen voor tabel `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`PlayerID`),
  ADD KEY `TeamID` (`TeamID`);

--
-- Indexen voor tabel `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`TeamID`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `assist`
--
ALTER TABLE `assist`
  MODIFY `AssistID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `goal`
--
ALTER TABLE `goal`
  MODIFY `GoalID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `match`
--
ALTER TABLE `match`
  MODIFY `MatchID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `player`
--
ALTER TABLE `player`
  MODIFY `PlayerID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `team`
--
ALTER TABLE `team`
  MODIFY `TeamID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `assist`
--
ALTER TABLE `assist`
  ADD CONSTRAINT `assist_ibfk_1` FOREIGN KEY (`GoalID`) REFERENCES `goal` (`GoalID`),
  ADD CONSTRAINT `assist_ibfk_2` FOREIGN KEY (`MatchID`) REFERENCES `match` (`MatchID`),
  ADD CONSTRAINT `assist_ibfk_3` FOREIGN KEY (`PlayerID`) REFERENCES `player` (`PlayerID`);

--
-- Beperkingen voor tabel `goal`
--
ALTER TABLE `goal`
  ADD CONSTRAINT `goal_ibfk_1` FOREIGN KEY (`MatchID`) REFERENCES `match` (`MatchID`),
  ADD CONSTRAINT `goal_ibfk_2` FOREIGN KEY (`PlayerID`) REFERENCES `player` (`PlayerID`);

--
-- Beperkingen voor tabel `match`
--
ALTER TABLE `match`
  ADD CONSTRAINT `match_ibfk_1` FOREIGN KEY (`AwayTeamID`) REFERENCES `team` (`TeamID`),
  ADD CONSTRAINT `match_ibfk_2` FOREIGN KEY (`HomeTeamID`) REFERENCES `team` (`TeamID`);

--
-- Beperkingen voor tabel `player`
--
ALTER TABLE `player`
  ADD CONSTRAINT `player_ibfk_1` FOREIGN KEY (`TeamID`) REFERENCES `team` (`TeamID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
