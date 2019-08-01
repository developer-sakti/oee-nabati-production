-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 01, 2019 at 10:31 PM
-- Server version: 5.7.27-0ubuntu0.18.04.1
-- PHP Version: 7.2.19-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ooe_nabati`
--

-- --------------------------------------------------------

--
-- Table structure for table `badstock_category`
--

CREATE TABLE `badstock_category` (
  `id` int(11) NOT NULL,
  `category` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `badstock_category`
--

INSERT INTO `badstock_category` (`id`, `category`) VALUES
(1, 'BS Adonan MIXING'),
(2, 'BS Bubble BAKING '),
(3, 'BS Sheet BAKING'),
(4, 'BS Kue CREAMING'),
(5, 'BS Kue COOLING'),
(6, 'BS Kue Cutting'),
(7, 'BS Kue PACKAGING'),
(8, 'BS Roll PACKAGING (Carton)');

-- --------------------------------------------------------

--
-- Table structure for table `badstock_timbangan`
--

CREATE TABLE `badstock_timbangan` (
  `id` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `rencanaProduksiId` int(11) DEFAULT NULL,
  `machineId` int(11) DEFAULT NULL,
  `badstockCategoryId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `downtime`
--

CREATE TABLE `downtime` (
  `id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `rencanaProduksiId` int(11) DEFAULT NULL,
  `machineId` int(11) DEFAULT NULL,
  `downtimeCategoryId` int(11) DEFAULT NULL,
  `downtimeReasonId` int(11) DEFAULT NULL,
  `duration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `downtime_category`
--

CREATE TABLE `downtime_category` (
  `id` int(11) NOT NULL,
  `category` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `downtime_category`
--

INSERT INTO `downtime_category` (`id`, `category`) VALUES
(1, 'Planned Downtime'),
(2, 'Unplanned Downtime'),
(3, 'Performance Losses / Minorstopage');

-- --------------------------------------------------------

--
-- Table structure for table `downtime_reason`
--

CREATE TABLE `downtime_reason` (
  `id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `downtime_reason`
--

INSERT INTO `downtime_reason` (`id`, `reason`) VALUES
(1, 'Cleaning Baking Plate'),
(2, 'Preventive Maintenance'),
(3, 'Stock Opname'),
(4, 'National Holiday'),
(5, 'New Installation'),
(6, 'Deep Cleaning'),
(7, 'Trial R&D'),
(8, 'Reduce Speed'),
(9, 'Gas Shortage'),
(10, 'Cleaning Gang-way Baking Plate'),
(11, '4M / Manpower Losses'),
(12, 'Shortage Material'),
(13, 'Sheet Menempel / Menumpuk'),
(14, 'Idle'),
(15, 'Cream & Coating'),
(16, 'Ganti Pipa Deposit'),
(17, 'Water Shortage'),
(18, 'RM & PM'),
(19, 'Minor Stoppages Losses'),
(20, 'Sensor Flame Detector Error'),
(21, ' Pipa Deposit Tersumbat'),
(22, 'Temperature Oven Tidak Stabil'),
(23, 'Cleaning Hopper Adonan'),
(24, 'Heating/burner Off'),
(25, 'Sensor Hopper Adonan Error'),
(26, 'Pressure Gas Turun'),
(27, 'Rantai Scrapper Rusak'),
(28, 'Locking Baking Plate Macet'),
(29, 'Pressure Angin Blower Turun'),
(30, 'Start-up Oven Lama'),
(31, 'Nozzle Burner Tidak Menyala'),
(32, 'Baut Sirip Cooling Box Longgar'),
(33, 'Sensor Cooling Box Error'),
(34, 'Pergantian Sensor Proximity'),
(35, 'Motor Archooler Korslet'),
(36, 'Roundbelt Putus'),
(37, 'Frame Cutting Putus'),
(38, 'Magazine Unsmooth'),
(39, 'Coding Tidak Sempurna'),
(40, 'Sensor Gate Conveyor Error'),
(41, 'Pusher Gate Error'),
(42, 'Temperature Seal Tidak Stabil'),
(43, 'Pisau Seal Tumpul'),
(44, 'Wire Cutting Putus'),
(45, 'Belt Conveyor Sobek'),
(46, 'Bearing Conveyor Rusak');

-- --------------------------------------------------------

--
-- Table structure for table `downtime_reason_machine`
--

CREATE TABLE `downtime_reason_machine` (
  `id` int(11) NOT NULL,
  `machineId` int(11) DEFAULT NULL,
  `downtimeCategoryId` int(11) DEFAULT NULL,
  `downtimeReasonId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `downtime_reason_machine`
--

INSERT INTO `downtime_reason_machine` (`id`, `machineId`, `downtimeCategoryId`, `downtimeReasonId`) VALUES
(1, 1, 1, 1),
(3, 1, 1, 2),
(4, 1, 1, 3),
(5, 1, 1, 4),
(6, 1, 1, 5),
(7, 1, 1, 6),
(8, 1, 1, 7),
(9, 1, 2, 20),
(10, 1, 2, 21),
(11, 1, 2, 22),
(12, 1, 2, 23),
(13, 1, 2, 24),
(14, 1, 2, 25),
(15, 1, 2, 26),
(16, 1, 2, 27),
(17, 1, 2, 28),
(18, 1, 2, 29),
(19, 1, 2, 30),
(20, 1, 2, 31);

-- --------------------------------------------------------

--
-- Table structure for table `hmi`
--

CREATE TABLE `hmi` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hmi`
--

INSERT INTO `hmi` (`id`, `name`) VALUES
(1, 'HMI A'),
(2, 'HMI B'),
(3, 'HMI C'),
(4, 'HMI D');

-- --------------------------------------------------------

--
-- Table structure for table `hmi_lines_line`
--

CREATE TABLE `hmi_lines_line` (
  `hmiId` int(11) NOT NULL,
  `lineId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hmi_lines_line`
--

INSERT INTO `hmi_lines_line` (`hmiId`, `lineId`) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 1),
(3, 2),
(4, 3),
(4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `hmi_machines_machine`
--

CREATE TABLE `hmi_machines_machine` (
  `hmiId` int(11) NOT NULL,
  `machineId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hmi_machines_machine`
--

INSERT INTO `hmi_machines_machine` (`hmiId`, `machineId`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(2, 3),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(3, 8),
(3, 9),
(4, 4),
(4, 5),
(4, 6),
(4, 7),
(4, 8),
(4, 9);

-- --------------------------------------------------------

--
-- Table structure for table `initial_shift`
--

CREATE TABLE `initial_shift` (
  `id` int(11) NOT NULL,
  `shift_name` varchar(255) NOT NULL,
  `shift_operated` int(11) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `initial_shift`
--

INSERT INTO `initial_shift` (`id`, `shift_name`, `shift_operated`, `start_time`, `end_time`) VALUES
(1, 'Shift 1', 8, '06:00:00', '14:00:00'),
(2, 'Shift 2', 8, '14:00:00', '22:00:00'),
(3, 'Shift 3', 8, '22:00:00', '06:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `initial_sku`
--

CREATE TABLE `initial_sku` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `initial_sku`
--

INSERT INTO `initial_sku` (`id`, `name`, `code`) VALUES
(1, 'SKU000001', 'Wafer Coklat'),
(2, 'SKU000002', 'Wafer Stoberi');

-- --------------------------------------------------------

--
-- Table structure for table `lakban_finishgood`
--

CREATE TABLE `lakban_finishgood` (
  `id` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `rencanaProduksiId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lakban_rework`
--

CREATE TABLE `lakban_rework` (
  `id` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `rencanaProduksiId` int(11) DEFAULT NULL,
  `machineId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `line`
--

CREATE TABLE `line` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `line`
--

INSERT INTO `line` (`id`, `name`) VALUES
(1, 'Line 13'),
(2, 'Line 14'),
(3, 'Line 15'),
(4, 'Line 16');

-- --------------------------------------------------------

--
-- Table structure for table `machine`
--

CREATE TABLE `machine` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `hmi_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `machine`
--

INSERT INTO `machine` (`id`, `name`, `hmi_id`) VALUES
(1, 'Baking', 0),
(2, 'Creaming', 0),
(3, 'Mixing', 0),
(4, 'Cooling', 0),
(5, 'Cutting', 0),
(6, 'Packaging 1', 0),
(7, 'Packaging 2', 0),
(8, 'Packaging 3', 0),
(9, 'Packaging 4', 0);

-- --------------------------------------------------------

--
-- Table structure for table `rencana_produksi`
--

CREATE TABLE `rencana_produksi` (
  `id` int(11) NOT NULL,
  `po_number` varchar(255) NOT NULL,
  `standart_ct` int(11) NOT NULL,
  `bottleneck_ct` int(11) NOT NULL,
  `target_produksi` int(11) NOT NULL,
  `date` date NOT NULL,
  `start_sku` time NOT NULL,
  `end_sku` time NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `shiftId` int(11) DEFAULT NULL,
  `lineId` int(11) DEFAULT NULL,
  `skuId` int(11) DEFAULT NULL,
  `supervisorId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rencana_produksi`
--

INSERT INTO `rencana_produksi` (`id`, `po_number`, `standart_ct`, `bottleneck_ct`, `target_produksi`, `date`, `start_sku`, `end_sku`, `created_at`, `updated_at`, `deleted_at`, `shiftId`, `lineId`, `skuId`, `supervisorId`) VALUES
(4, 'string', 0, 0, 0, '2019-07-31', '07:00:00', '10:00:00', '2019-07-31 13:55:47', NULL, NULL, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `rules`
--

CREATE TABLE `rules` (
  `id` int(11) NOT NULL,
  `rule` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rules`
--

INSERT INTO `rules` (`id`, `rule`) VALUES
(1, 'Admin'),
(2, 'Supervisor');

-- --------------------------------------------------------

--
-- Table structure for table `rules_users_user`
--

CREATE TABLE `rules_users_user` (
  `rulesId` int(11) NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `firstname`, `lastname`, `username`, `password`, `role`, `status`) VALUES
(1, 'Admin', 'Satu', 'admin', '$2b$10$lECoC3bq80tLP6TsFL1NPug/lmtuxePbGo7ILysI30xe3Gjt3QNl6', 'user', 'pending'),
(4, 'string', 'string', 'string', '$2b$10$IzQXipoPqq5Qwsxh3oSAJ.oJvCjVlD27Qutx4EVbxKBSzTiS0Q6Ee', 'user', 'pending');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `badstock_category`
--
ALTER TABLE `badstock_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `badstock_timbangan`
--
ALTER TABLE `badstock_timbangan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_34a7156a171277cad541f91dd36` (`rencanaProduksiId`),
  ADD KEY `FK_f7ea4ff052e15afe16c8cedc2a0` (`machineId`),
  ADD KEY `FK_c49bbef14b9dfe80e36532ae9e0` (`badstockCategoryId`);

--
-- Indexes for table `downtime`
--
ALTER TABLE `downtime`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_3e7f7a2364bae120fd113cd7df6` (`rencanaProduksiId`),
  ADD KEY `FK_9da602f83260623be2d4aac03af` (`machineId`),
  ADD KEY `FK_3afc23e29e1cbc395cb35f1cbfa` (`downtimeCategoryId`),
  ADD KEY `FK_6e7d58ff9db4cb4302a2d761976` (`downtimeReasonId`);

--
-- Indexes for table `downtime_category`
--
ALTER TABLE `downtime_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `downtime_reason`
--
ALTER TABLE `downtime_reason`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `downtime_reason_machine`
--
ALTER TABLE `downtime_reason_machine`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_bf4d751959445b22da9e825fc80` (`machineId`),
  ADD KEY `FK_b313168610fd3ac7d3826b5e424` (`downtimeCategoryId`),
  ADD KEY `FK_eaf7bbefc9c6ee25bbf5856bbfd` (`downtimeReasonId`);

--
-- Indexes for table `hmi`
--
ALTER TABLE `hmi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hmi_lines_line`
--
ALTER TABLE `hmi_lines_line`
  ADD PRIMARY KEY (`hmiId`,`lineId`),
  ADD KEY `IDX_9e338365c9f5c52172bfa5f200` (`hmiId`),
  ADD KEY `IDX_b9aa871549570e4bddf6478bf6` (`lineId`);

--
-- Indexes for table `hmi_machines_machine`
--
ALTER TABLE `hmi_machines_machine`
  ADD PRIMARY KEY (`hmiId`,`machineId`),
  ADD KEY `IDX_4d0ccef7c1ca9a155cd89829db` (`hmiId`),
  ADD KEY `IDX_a39aa28fd4662357f051cc287a` (`machineId`);

--
-- Indexes for table `initial_shift`
--
ALTER TABLE `initial_shift`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `initial_sku`
--
ALTER TABLE `initial_sku`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lakban_finishgood`
--
ALTER TABLE `lakban_finishgood`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_cd2ac7aca0f3965e2aee7438618` (`rencanaProduksiId`);

--
-- Indexes for table `lakban_rework`
--
ALTER TABLE `lakban_rework`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_81915da2643e5e375bf64580886` (`rencanaProduksiId`);

--
-- Indexes for table `line`
--
ALTER TABLE `line`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `machine`
--
ALTER TABLE `machine`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rencana_produksi`
--
ALTER TABLE `rencana_produksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_b793fdb0c9cfee1742288ca45f5` (`shiftId`),
  ADD KEY `FK_14210e32793e4e2b31b34ea3b01` (`lineId`),
  ADD KEY `FK_4b97066918166022557931e90d5` (`skuId`),
  ADD KEY `FK_ce8fbdb7f4256eac5d7cd8004ee` (`supervisorId`);

--
-- Indexes for table `rules`
--
ALTER TABLE `rules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rules_users_user`
--
ALTER TABLE `rules_users_user`
  ADD PRIMARY KEY (`rulesId`,`userId`),
  ADD KEY `IDX_977de892127cb62cf12a1877e8` (`rulesId`),
  ADD KEY `IDX_0b47ece3d263e3a8bed3164c20` (`userId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `badstock_category`
--
ALTER TABLE `badstock_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `badstock_timbangan`
--
ALTER TABLE `badstock_timbangan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `downtime`
--
ALTER TABLE `downtime`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `downtime_category`
--
ALTER TABLE `downtime_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `downtime_reason`
--
ALTER TABLE `downtime_reason`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `downtime_reason_machine`
--
ALTER TABLE `downtime_reason_machine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `hmi`
--
ALTER TABLE `hmi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `initial_shift`
--
ALTER TABLE `initial_shift`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `initial_sku`
--
ALTER TABLE `initial_sku`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `lakban_finishgood`
--
ALTER TABLE `lakban_finishgood`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lakban_rework`
--
ALTER TABLE `lakban_rework`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `line`
--
ALTER TABLE `line`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `machine`
--
ALTER TABLE `machine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `rencana_produksi`
--
ALTER TABLE `rencana_produksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `rules`
--
ALTER TABLE `rules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `badstock_timbangan`
--
ALTER TABLE `badstock_timbangan`
  ADD CONSTRAINT `FK_34a7156a171277cad541f91dd36` FOREIGN KEY (`rencanaProduksiId`) REFERENCES `rencana_produksi` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_c49bbef14b9dfe80e36532ae9e0` FOREIGN KEY (`badstockCategoryId`) REFERENCES `badstock_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_f7ea4ff052e15afe16c8cedc2a0` FOREIGN KEY (`machineId`) REFERENCES `machine` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `downtime`
--
ALTER TABLE `downtime`
  ADD CONSTRAINT `FK_3afc23e29e1cbc395cb35f1cbfa` FOREIGN KEY (`downtimeCategoryId`) REFERENCES `downtime_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_3e7f7a2364bae120fd113cd7df6` FOREIGN KEY (`rencanaProduksiId`) REFERENCES `rencana_produksi` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_6e7d58ff9db4cb4302a2d761976` FOREIGN KEY (`downtimeReasonId`) REFERENCES `downtime_reason` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_9da602f83260623be2d4aac03af` FOREIGN KEY (`machineId`) REFERENCES `machine` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `downtime_reason_machine`
--
ALTER TABLE `downtime_reason_machine`
  ADD CONSTRAINT `FK_b313168610fd3ac7d3826b5e424` FOREIGN KEY (`downtimeCategoryId`) REFERENCES `downtime_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_bf4d751959445b22da9e825fc80` FOREIGN KEY (`machineId`) REFERENCES `machine` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_eaf7bbefc9c6ee25bbf5856bbfd` FOREIGN KEY (`downtimeReasonId`) REFERENCES `downtime_reason` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hmi_lines_line`
--
ALTER TABLE `hmi_lines_line`
  ADD CONSTRAINT `FK_9e338365c9f5c52172bfa5f2002` FOREIGN KEY (`hmiId`) REFERENCES `hmi` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_b9aa871549570e4bddf6478bf65` FOREIGN KEY (`lineId`) REFERENCES `line` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `hmi_machines_machine`
--
ALTER TABLE `hmi_machines_machine`
  ADD CONSTRAINT `FK_4d0ccef7c1ca9a155cd89829db0` FOREIGN KEY (`hmiId`) REFERENCES `hmi` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_a39aa28fd4662357f051cc287a3` FOREIGN KEY (`machineId`) REFERENCES `machine` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `lakban_finishgood`
--
ALTER TABLE `lakban_finishgood`
  ADD CONSTRAINT `FK_cd2ac7aca0f3965e2aee7438618` FOREIGN KEY (`rencanaProduksiId`) REFERENCES `rencana_produksi` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `lakban_rework`
--
ALTER TABLE `lakban_rework`
  ADD CONSTRAINT `FK_81915da2643e5e375bf64580886` FOREIGN KEY (`rencanaProduksiId`) REFERENCES `rencana_produksi` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `rencana_produksi`
--
ALTER TABLE `rencana_produksi`
  ADD CONSTRAINT `FK_14210e32793e4e2b31b34ea3b01` FOREIGN KEY (`lineId`) REFERENCES `line` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_4b97066918166022557931e90d5` FOREIGN KEY (`skuId`) REFERENCES `initial_sku` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_b793fdb0c9cfee1742288ca45f5` FOREIGN KEY (`shiftId`) REFERENCES `initial_shift` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_ce8fbdb7f4256eac5d7cd8004ee` FOREIGN KEY (`supervisorId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `rules_users_user`
--
ALTER TABLE `rules_users_user`
  ADD CONSTRAINT `FK_0b47ece3d263e3a8bed3164c20e` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_977de892127cb62cf12a1877e8f` FOREIGN KEY (`rulesId`) REFERENCES `rules` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
