-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Máquina: localhost
-- Data de Criação: 26-Mai-2011 às 12:06
-- Versão do servidor: 5.1.41
-- versão do PHP: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de Dados: `datumo`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `access`
--

CREATE TABLE IF NOT EXISTS `access` (
  `access_id` int(11) NOT NULL,
  `access_permission` varchar(50) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`access_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `access`
--

INSERT INTO `access` (`access_id`, `access_permission`) VALUES
(0, 'View'),
(1, 'Update'),
(2, 'Delete'),
(3, 'Update, Delete'),
(4, 'Add'),
(5, 'Add, Update'),
(6, 'Add, Delete'),
(7, 'Add, Update, Delete'),
(8, 'Request'),
(9, 'Request, Update'),
(10, 'Request, Delete'),
(11, 'Request, Update, Delete'),
(12, 'Request. Add'),
(13, 'Request, Add, Update'),
(14, 'Request, Add, Delete'),
(15, 'Request, Add, Update, Delete');

-- --------------------------------------------------------

--
-- Estrutura da tabela `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_user` int(11) NOT NULL,
  `admin_table` varchar(20) CHARACTER SET latin1 NOT NULL,
  `admin_permission` int(11) NOT NULL,
  PRIMARY KEY (`admin_id`),
  KEY `admin_user` (`admin_user`),
  KEY `admin_permission` (`admin_permission`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='With this table you can give access to specific tables' AUTO_INCREMENT=20 ;

--
-- Extraindo dados da tabela `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_user`, `admin_table`, `admin_permission`) VALUES
(1, 1, 'user', 5),
(9, 1, 'admin', 7),
(10, 1, 'department', 1),
(11, 1, 'report', 7),
(12, 1, 'mask', 7),
(17, 1, 'mail', 0),
(18, 1, 'treeview', 7),
(19, 1, 'restree', 7);

-- --------------------------------------------------------

--
-- Estrutura da tabela `alert`
--

CREATE TABLE IF NOT EXISTS `alert` (
  `alert_id` int(11) NOT NULL AUTO_INCREMENT,
  `alert_name` varchar(45) NOT NULL,
  PRIMARY KEY (`alert_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `alert`
--

INSERT INTO `alert` (`alert_id`, `alert_name`) VALUES
(1, 'alert by email'),
(2, 'alert by sms');

-- --------------------------------------------------------

--
-- Estrutura da tabela `announcement`
--

CREATE TABLE IF NOT EXISTS `announcement` (
  `announcement_id` int(11) NOT NULL AUTO_INCREMENT,
  `announcement_title` varchar(100) COLLATE utf8_bin NOT NULL,
  `announcement_message` text COLLATE utf8_bin,
  `announcement_date` date NOT NULL COMMENT 'Announcement date.',
  `announcement_end_date` date DEFAULT NULL COMMENT 'The announcement will no longer be available after the end date.',
  PRIMARY KEY (`announcement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Announcements and promotions' AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `announcement`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `bool`
--

CREATE TABLE IF NOT EXISTS `bool` (
  `bool_id` int(11) NOT NULL,
  `bool_type` varchar(6) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`bool_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `bool`
--

INSERT INTO `bool` (`bool_id`, `bool_type`) VALUES
(0, 'FALSE'),
(1, 'TRUE');

-- --------------------------------------------------------

--
-- Estrutura da tabela `confidentiality`
--

CREATE TABLE IF NOT EXISTS `confidentiality` (
  `confidentiality_id` int(11) NOT NULL AUTO_INCREMENT,
  `confidentiality_name` varchar(10) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`confidentiality_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `confidentiality`
--

INSERT INTO `confidentiality` (`confidentiality_id`, `confidentiality_name`) VALUES
(1, 'Public'),
(2, 'Private'),
(3, 'Undefined');

-- --------------------------------------------------------

--
-- Estrutura da tabela `country`
--

CREATE TABLE IF NOT EXISTS `country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `country_tel_id` char(3) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=240 ;

--
-- Extraindo dados da tabela `country`
--

INSERT INTO `country` (`country_id`, `country_name`, `country_tel_id`) VALUES
(1, 'Not Specified', '0'),
(2, 'Albania', '355'),
(3, 'Algeria', '213'),
(4, 'American Samoa', '684'),
(5, 'Andorra', '376'),
(6, 'Angola', '244'),
(7, 'Anguilla', '264'),
(8, 'Antarctica', '672'),
(9, 'Antigua', '268'),
(10, 'Argentina', '54'),
(11, 'Armenia', '374'),
(12, 'Aruba', '297'),
(13, 'Ascension Island', '247'),
(14, 'Australia', '61'),
(15, 'Austria', '43'),
(16, 'Austria', '43'),
(17, 'Azberbaijan', '994'),
(18, 'Bahamas', '242'),
(19, 'Bahrain', '973'),
(20, 'Bangladesh', '880'),
(21, 'Barbados', '246'),
(22, 'Barbuda', '268'),
(23, 'Belarus', '375'),
(24, 'Belgium', '32'),
(25, 'Belize', '501'),
(26, 'Benin', '229'),
(27, 'Bermuda', '441'),
(28, 'Bhutan', '975'),
(29, 'Bolivia', '591'),
(30, 'Bosnia', '387'),
(31, 'Botswana', '267'),
(32, 'Brazil', '55'),
(33, 'British Virgin Islands', '284'),
(34, 'Brunei', '673'),
(35, 'Bulgaria', '359'),
(36, 'Burkina Faso', '226'),
(37, 'Burma (Myanmar)', '95'),
(38, 'Burundi', '257'),
(39, 'Cambodia', '855'),
(40, 'Cameroon', '237'),
(41, 'Canada', '1'),
(42, 'Cape Verde Islands', '238'),
(43, 'Cayman Islands', '345'),
(44, 'Central African Rep.', '236'),
(45, 'Chad', '235'),
(46, 'Chile', '56'),
(47, 'China', '86'),
(48, 'Christmas Island', '61'),
(49, 'Cocos Islands', '61'),
(50, 'Colombia', '57'),
(51, 'Comoros', '269'),
(52, 'Congo', '242'),
(53, 'Congo (Dem.Rep.)', '243'),
(54, 'Cook Islands', '682'),
(55, 'Costa Rica', '506'),
(56, 'Croatia', '385'),
(57, 'Cuba', '53'),
(58, 'Cyprus', '357'),
(59, 'Czech Republic', '420'),
(60, 'Denmark', '45'),
(61, 'Diego Garcia', '246'),
(62, 'Djibouti', '253'),
(63, 'Dominica', '767'),
(64, 'Dominican Rep.', '809'),
(65, 'Ecuador', '593'),
(66, 'Egypt', '20'),
(67, 'El Salvador', '503'),
(68, 'Equatorial Guinea', '240'),
(69, 'Eritrea', '291'),
(70, 'Estonia', '372'),
(71, 'Ethiopia', '251'),
(72, 'Faeroe Islands', '298'),
(73, 'Falkland Islands', '500'),
(74, 'Fiji Islands', '679'),
(75, 'Finland', '358'),
(76, 'France', '33'),
(77, 'French Antilles', '596'),
(78, 'French Guiana', '594'),
(79, 'French Polynesia', '689'),
(80, 'Gabon', '241'),
(81, 'Gambia', '220'),
(82, 'Georgia', '995'),
(83, 'Germany', '49'),
(84, 'Ghana', '233'),
(85, 'Gibraltar', '350'),
(86, 'Greece', '30'),
(87, 'Greenland', '299'),
(88, 'Grenada', '473'),
(89, 'Guadeloupe', '590'),
(90, 'Guam', '671'),
(91, 'Guantanamo Bay', '539'),
(92, 'Guatemala', '502'),
(93, 'Guinea', '224'),
(94, 'Guinea Bissau', '245'),
(95, 'Guyana', '592'),
(96, 'Haiti', '509'),
(97, 'Honduras', '504'),
(98, 'Hong Kong', '852'),
(99, 'Hungary', '36'),
(100, 'Iceland', '354'),
(101, 'India', '91'),
(102, 'Indonesia', '62'),
(103, 'Iran', '98'),
(104, 'Iraq', '964'),
(105, 'Ireland', '353'),
(106, 'Israel', '972'),
(107, 'Italy', '39'),
(108, 'Ivory Coast', '225'),
(109, 'Jamaica', '876'),
(110, 'Japan', '81'),
(111, 'Jordan', '962'),
(112, 'Kazakhstan', '7'),
(113, 'Kenya', '254'),
(114, 'Kiribati', '686'),
(115, 'Korea (North)', '850'),
(116, 'Korea (South)', '82'),
(117, 'Kuwait', '965'),
(118, 'Kyrgyzstan', '996'),
(119, 'Laos', '856'),
(120, 'Latvia', '371'),
(121, 'Lebanon', '961'),
(122, 'Lesotho', '266'),
(123, 'Liberia', '231'),
(124, 'Libya', '218'),
(125, 'Liechtenstein', '423'),
(126, 'Lithuania', '370'),
(127, 'Luxembourg', '352'),
(128, 'Macau', '853'),
(129, 'Macedonia', '389'),
(130, 'Madagascar', '261'),
(131, 'Malawi', '265'),
(132, 'Malaysia', '60'),
(133, 'Maldives', '960'),
(134, 'Mali', '223'),
(135, 'Malta', '356'),
(136, 'Mariana Islands', '670'),
(137, 'Marshall Islands', '692'),
(138, 'Martinique', '596'),
(139, 'Mauritania', '222'),
(140, 'Mauritius', '230'),
(141, 'Mayotte Islands', '269'),
(142, 'Mexico', '52'),
(143, 'Micronesia', '691'),
(144, 'Midway Island', '808'),
(145, 'Moldova', '373'),
(146, 'Monaco', '377'),
(147, 'Mongolia', '976'),
(148, 'Montserrat', '664'),
(149, 'Morocco', '212'),
(150, 'Mozambique', '258'),
(151, 'Myanmar (Burma)', '95'),
(152, 'Namibia', '264'),
(153, 'Nauru', '674'),
(154, 'Nepal', '977'),
(155, 'Netherlands', '31'),
(156, 'Netherlands Antilles', '599'),
(157, 'Nevis', '869'),
(158, 'New Caledonia', '687'),
(159, 'New Zealand', '64'),
(160, 'Nicaragua', '505'),
(161, 'Niger', '227'),
(162, 'Nigeria', '234'),
(163, 'Niue', '683'),
(164, 'Norfolk Island', '672'),
(165, 'Norway', '47'),
(166, 'Oman', '968'),
(167, 'Pakistan', '92'),
(168, 'Palau', '680'),
(169, 'Palestine', '970'),
(170, 'Panama', '507'),
(171, 'Papua New Guinea', '675'),
(172, 'Paraguay', '595'),
(173, 'Peru', '51'),
(174, 'Philippines', '63'),
(175, 'Poland', '48'),
(176, 'Portugal', '351'),
(177, 'Puerto Rico', '787'),
(178, 'Qatar', '974'),
(179, 'Reunion Island', '262'),
(180, 'Romania', '40'),
(181, 'Russia', '7'),
(182, 'Rwanda', '250'),
(183, 'San Marino', '378'),
(184, 'Sao Tome & Principe', '239'),
(185, 'Saudi Arabia', '966'),
(186, 'Senegal', '221'),
(187, 'Serbia', '381'),
(188, 'Seychelles', '248'),
(189, 'Sierra Leone', '232'),
(190, 'Singapore', '65'),
(191, 'Slovakia', '421'),
(192, 'Slovenia', '386'),
(193, 'Solomon Islands', '677'),
(194, 'Somalia', '252'),
(195, 'South Africa', '27'),
(196, 'Spain', '34'),
(197, 'Sri Lanka', '94'),
(198, 'St. Helena', '290'),
(199, 'St. Kitts', '869'),
(200, 'St. Lucia', '758'),
(201, 'St. Perre & Miquelon', '508'),
(202, 'St. Vincent', '784'),
(203, 'Sudan', '249'),
(204, 'Suriname', '597'),
(205, 'Swaziland', '268'),
(206, 'Sweden', '46'),
(207, 'Switzerland', '41'),
(208, 'Syria', '963'),
(209, 'Taiwan', '886'),
(210, 'Tajikistan', '992'),
(211, 'Tanzania', '255'),
(212, 'Thailand', '66'),
(213, 'Togo', '228'),
(214, 'Tonga', '676'),
(215, 'Trinidad & Tobago', '868'),
(216, 'Tunisia', '216'),
(217, 'Turkey', '90'),
(218, 'Turkmenistan', '993'),
(219, 'Turks & Caicos', '649'),
(220, 'Tuvalu', '688'),
(221, 'Uganda', '256'),
(222, 'Ukraine', '380'),
(223, 'United Arab Emirates', '971'),
(224, 'United Kingdom (UK)', '44'),
(225, 'United States (USA)', '1'),
(226, 'Uruguay', '598'),
(227, 'US Virgin Islands', '1'),
(228, 'Uzbekistan', '998'),
(229, 'Vanuatu', '678'),
(230, 'Vatican City', '39'),
(231, 'Venezuela', '58'),
(232, 'Vietnam', '84'),
(233, 'Wake Island', '808'),
(234, 'Wallis & Futuna', '681'),
(235, 'Western Samoa', '685'),
(236, 'Yemen', '967'),
(237, 'Yugoslavia', '381'),
(238, 'Zambia', '260'),
(239, 'Zimbabwe', '263');

-- --------------------------------------------------------

--
-- Estrutura da tabela `department`
--

CREATE TABLE IF NOT EXISTS `department` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `department_inst` smallint(6) NOT NULL,
  `department_manager` int(11) NOT NULL,
  PRIMARY KEY (`department_id`),
  KEY `department_inst` (`department_inst`),
  KEY `department_manager` (`department_manager`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `department`
--

INSERT INTO `department` (`department_id`, `department_name`, `department_inst`, `department_manager`) VALUES
(1, 'Cirklo', 2, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `institute`
--

CREATE TABLE IF NOT EXISTS `institute` (
  `institute_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `institute_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `institute_address` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `institute_phone` int(11) DEFAULT NULL,
  `institute_country` int(11) NOT NULL,
  `institute_vat` int(11) DEFAULT NULL,
  PRIMARY KEY (`institute_id`),
  KEY `institute_country` (`institute_country`),
  KEY `institute_country_2` (`institute_country`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `institute`
--

INSERT INTO `institute` (`institute_id`, `institute_name`, `institute_address`, `institute_phone`, `institute_country`, `institute_vat`) VALUES
(2, 'Instituto Gulbenkian de Ciência', NULL, NULL, 176, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `level`
--

CREATE TABLE IF NOT EXISTS `level` (
  `level_id` int(11) NOT NULL,
  `level_name` varchar(15) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `level`
--

INSERT INTO `level` (`level_id`, `level_name`) VALUES
(0, 'Administrator'),
(1, 'Manager'),
(2, 'Regular User');

-- --------------------------------------------------------

--
-- Estrutura da tabela `mail`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `datumo`.`mail` AS select `datumo`.`user`.`user_id` AS `mail_id`,`datumo`.`user`.`user_login` AS `mail_user`,`datumo`.`user`.`user_email` AS `mail_email` from `datumo`.`user` order by `datumo`.`user`.`user_login`;

--
-- Extraindo dados da tabela `mail`
--

INSERT INTO `mail` (`mail_id`, `mail_user`, `mail_email`) VALUES
(1, 'jlagarto', 'jlagarto@cirklo.org');

-- --------------------------------------------------------

--
-- Estrutura da tabela `mainconfig`
--

CREATE TABLE IF NOT EXISTS `mainconfig` (
  `mainconfig_id` int(11) NOT NULL AUTO_INCREMENT,
  `mainconfig_institute` varchar(100) CHARACTER SET ucs2 COLLATE ucs2_bin NOT NULL,
  `mainconfig_shortname` varchar(10) CHARACTER SET ucs2 COLLATE ucs2_bin NOT NULL,
  `mainconfig_url` varchar(50) CHARACTER SET ucs2 COLLATE ucs2_bin NOT NULL,
  `mainconfig_email` varchar(50) CHARACTER SET ucs2 COLLATE ucs2_bin NOT NULL,
  `mainconfig_password` varchar(50) CHARACTER SET ucs2 COLLATE ucs2_bin NOT NULL,
  `mainconfig_host` varchar(50) CHARACTER SET ucs2 COLLATE ucs2_bin NOT NULL,
  `mainconfig_port` int(11) NOT NULL,
  `mainconfig_SMTPSecure` varchar(10) CHARACTER SET ucs2 COLLATE ucs2_bin NOT NULL,
  `mainconfig_SMTPAuth` tinyint(4) NOT NULL,
  PRIMARY KEY (`mainconfig_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `mainconfig`
--

INSERT INTO `mainconfig` (`mainconfig_id`, `mainconfig_institute`, `mainconfig_shortname`, `mainconfig_url`, `mainconfig_email`, `mainconfig_password`, `mainconfig_host`, `mainconfig_port`, `mainconfig_SMTPSecure`, `mainconfig_SMTPAuth`) VALUES
(1, 'IGC', 'IGC', 'www.igc.gulbenkian.pt', 'uicweb@igc.gulbenkian.pt', 'uicweb!2010', 'mail.igc.gulbenkian.pt', 25, 'none', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `mask`
--

CREATE TABLE IF NOT EXISTS `mask` (
  `mask_id` int(11) NOT NULL AUTO_INCREMENT,
  `mask_table` varchar(20) COLLATE utf8_bin NOT NULL,
  `mask_name` varchar(30) COLLATE utf8_bin NOT NULL,
  `mask_pic` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`mask_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=8 ;

--
-- Extraindo dados da tabela `mask`
--

INSERT INTO `mask` (`mask_id`, `mask_table`, `mask_name`, `mask_pic`) VALUES
(1, 'admin', 'User configuration', NULL),
(2, 'mask', 'Table masks', NULL),
(3, 'report', 'Reports', NULL),
(4, 'treeview', 'Treeview configuration', NULL),
(5, 'restree', 'Treeview permissions', NULL),
(6, 'user', 'Users', NULL),
(7, 'department', 'Departments', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(20) COLLATE utf8_bin NOT NULL,
  `menu_description` varchar(50) COLLATE utf8_bin NOT NULL,
  `menu_plugin` int(11) NOT NULL,
  `menu_url` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`menu_id`),
  KEY `menu_plugin` (`menu_plugin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `menu`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `module`
--

CREATE TABLE IF NOT EXISTS `module` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `module_table` varchar(20) COLLATE utf8_bin NOT NULL,
  `module_name` varchar(20) COLLATE utf8_bin NOT NULL,
  `module_desc` varchar(30) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `module`
--

INSERT INTO `module` (`module_id`, `module_table`, `module_name`, `module_desc`) VALUES
(1, 'admin', 'tables', 'Available tables'),
(2, 'mask', 'tables', 'Available tables');

-- --------------------------------------------------------

--
-- Estrutura da tabela `param`
--

CREATE TABLE IF NOT EXISTS `param` (
  `param_id` int(11) NOT NULL AUTO_INCREMENT,
  `param_report` int(11) NOT NULL,
  `param_name` varchar(25) COLLATE utf8_bin NOT NULL,
  `param_datatype` varchar(25) COLLATE utf8_bin NOT NULL,
  `param_reference` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`param_id`),
  KEY `param_report` (`param_report`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `param`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `plugin`
--

CREATE TABLE IF NOT EXISTS `plugin` (
  `plugin_id` int(11) NOT NULL AUTO_INCREMENT,
  `plugin_name` varchar(20) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`plugin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `plugin`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `report`
--

CREATE TABLE IF NOT EXISTS `report` (
  `report_id` int(11) NOT NULL AUTO_INCREMENT,
  `report_name` varchar(20) COLLATE utf8_bin NOT NULL,
  `report_description` varchar(150) COLLATE utf8_bin NOT NULL,
  `report_query` varchar(1000) COLLATE utf8_bin NOT NULL,
  `report_user` int(11) NOT NULL,
  `report_conf` int(11) NOT NULL,
  PRIMARY KEY (`report_id`),
  KEY `report_user` (`report_user`),
  KEY `report_conf` (`report_conf`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=8 ;

--
-- Extraindo dados da tabela `report`
--

INSERT INTO `report` (`report_id`, `report_name`, `report_description`, `report_query`, `report_user`, `report_conf`) VALUES
(3, 'dfsd', 'fsdfsf', 'SELECT user_login,user_email FROM admin,department,user  WHERE user_dep=department_id AND admin_user=user_id ', 1, 2),
(4, 'test', 'test to break this', 'SELECT department_name FROM admin,department   ', 1, 2),
(5, 'new test', 'order test', 'SELECT user_login,user_email,department_name FROM department,user  WHERE department_manager=user_id AND user_dep=department_id    ', 1, 2),
(6, 'sffsdfs', 'qweqeqeq', 'SELECT user_login,department_name FROM department,user  WHERE department_manager=user_id AND user_dep=department_id  ', 1, 2),
(7, 'werw', 'erwerwrw', 'SELECT user_login,admin_table FROM admin,department,user  WHERE admin_user=user_id  ', 1, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `reprop`
--

CREATE TABLE IF NOT EXISTS `reprop` (
  `reprop_id` int(11) NOT NULL AUTO_INCREMENT,
  `reprop_report` int(11) NOT NULL,
  `reprop_attribute` varchar(25) COLLATE utf8_bin NOT NULL,
  `reprop_mask` varchar(25) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`reprop_id`),
  KEY `reprop_report` (`reprop_report`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=15 ;

--
-- Extraindo dados da tabela `reprop`
--

INSERT INTO `reprop` (`reprop_id`, `reprop_report`, `reprop_attribute`, `reprop_mask`) VALUES
(5, 3, 'user_login', 'user_login'),
(6, 3, 'user_email', 'user_email'),
(7, 4, 'department_name', 'department_name'),
(8, 5, 'user_login', 'user_login'),
(9, 5, 'user_email', 'user_email'),
(10, 5, 'department_name', 'department_name'),
(11, 6, 'user_login', 'user_login'),
(12, 6, 'department_name', 'department_name'),
(13, 7, 'user_login', 'user_login'),
(14, 7, 'admin_table', 'admin_table');

-- --------------------------------------------------------

--
-- Estrutura da tabela `resaccess`
--

CREATE TABLE IF NOT EXISTS `resaccess` (
  `resaccess_id` int(11) NOT NULL AUTO_INCREMENT,
  `resaccess_user` int(11) NOT NULL,
  `resaccess_table` varchar(30) NOT NULL,
  `resaccess_column` varchar(30) NOT NULL,
  `resaccess_value` varchar(30) NOT NULL,
  PRIMARY KEY (`resaccess_id`),
  KEY `resaccess_user` (`resaccess_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `resaccess`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `restree`
--

CREATE TABLE IF NOT EXISTS `restree` (
  `restree_id` int(11) NOT NULL AUTO_INCREMENT,
  `restree_user` int(11) NOT NULL,
  `restree_name` int(11) NOT NULL,
  `restree_access` int(11) NOT NULL,
  PRIMARY KEY (`restree_id`),
  KEY `restree_user` (`restree_user`),
  KEY `restree_name` (`restree_name`),
  KEY `restree_access` (`restree_access`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `restree`
--

INSERT INTO `restree` (`restree_id`, `restree_user`, `restree_name`, `restree_access`) VALUES
(1, 1, 1, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `search`
--

CREATE TABLE IF NOT EXISTS `search` (
  `search_id` int(11) NOT NULL AUTO_INCREMENT,
  `search_table` varchar(20) COLLATE utf8_bin NOT NULL,
  `search_query` varchar(1000) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`search_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `search`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `treeview`
--

CREATE TABLE IF NOT EXISTS `treeview` (
  `treeview_id` int(11) NOT NULL AUTO_INCREMENT,
  `treeview_name` varchar(20) COLLATE utf8_bin NOT NULL,
  `treeview_description` varchar(70) COLLATE utf8_bin NOT NULL,
  `treeview_table1` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `treeview_table2` varchar(30) COLLATE utf8_bin NOT NULL,
  `treeview_table3` varchar(30) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`treeview_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `treeview`
--

INSERT INTO `treeview` (`treeview_id`, `treeview_name`, `treeview_description`, `treeview_table1`, `treeview_table2`, `treeview_table3`) VALUES
(1, 'Users', 'Users per department', 'institute', 'department', 'user');

-- --------------------------------------------------------

--
-- Estrutura da tabela `type`
--

CREATE TABLE IF NOT EXISTS `type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(20) COLLATE utf8_bin NOT NULL,
  `type_query` text COLLATE utf8_bin NOT NULL,
  `type_grouping` varchar(20) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `type`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_login` varchar(32) COLLATE utf8_bin NOT NULL,
  `user_passwd` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'pwd',
  `user_level` int(11) NOT NULL,
  `user_firstname` varchar(16) COLLATE utf8_bin NOT NULL,
  `user_lastname` varchar(16) COLLATE utf8_bin NOT NULL,
  `user_dep` int(11) NOT NULL,
  `user_phone` varchar(32) COLLATE utf8_bin NOT NULL,
  `user_phonext` varchar(8) COLLATE utf8_bin DEFAULT NULL,
  `user_mobile` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `user_email` varchar(64) COLLATE utf8_bin NOT NULL,
  `user_alert` int(11) NOT NULL COMMENT '1 - Alert by email<br />2 - Alert by SMS',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_login` (`user_login`),
  KEY `user_dep` (`user_dep`),
  KEY `user_alert` (`user_alert`),
  KEY `user_level` (`user_level`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users registered. You can change your personal data here' AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `user`
--

INSERT INTO `user` (`user_id`, `user_login`, `user_passwd`, `user_level`, `user_firstname`, `user_lastname`, `user_dep`, `user_phone`, `user_phonext`, `user_mobile`, `user_email`, `user_alert`) VALUES
(1, 'jlagarto', '0ffe1abd1a08215353c233d6e009613e95eec4253832a761af28ff37ac5a150c', 0, 'João', 'Lagarto', 1, '000', '', '', 'jlagarto@cirklo.org', 1);

--
-- Triggers `user`
--
DROP TRIGGER IF EXISTS `newuser`;
DELIMITER //
CREATE TRIGGER `newuser` AFTER INSERT ON `user`
 FOR EACH ROW BEGIN
IF NEW.user_level=0 THEN
INSERT INTO admin (admin_user, admin_table, admin_permission) VALUES (new.user_id,'user',5);
INSERT INTO admin (admin_user, admin_table, admin_permission) VALUES (new.user_id,'vendor',5);
INSERT INTO admin (admin_user, admin_table, admin_permission) VALUES (new.user_id,'manufacturer',5);
INSERT INTO admin (admin_user, admin_table, admin_permission) VALUES (new.user_id,'account',5);
INSERT INTO admin (admin_user, admin_table, admin_permission) VALUES (new.user_id,'product',13);
INSERT INTO admin (admin_user, admin_table, admin_permission) VALUES (new.user_id,'myproduct',15);
INSERT INTO admin (admin_user, admin_table, admin_permission) VALUES (new.user_id,'accountperm',7);
INSERT INTO admin (admin_user, admin_table, admin_permission) VALUES (new.user_id,'statepermission',7);
END IF;
IF new.user_level=1 THEN
INSERT INTO admin (admin_user, admin_table, admin_permission) VALUES (new.user_id,'user',1);
INSERT INTO admin (admin_user, admin_table, admin_permission) VALUES (new.user_id,'vendor',0);
INSERT INTO admin (admin_user, admin_table, admin_permission) VALUES (new.user_id,'manufacturer',0);
INSERT INTO admin (admin_user, admin_table, admin_permission) VALUES (new.user_id,'account',0);
INSERT INTO admin (admin_user, admin_table, admin_permission) VALUES (new.user_id,'product',8);
INSERT INTO admin (admin_user, admin_table, admin_permission) VALUES (new.user_id,'myproduct',14);
INSERT INTO admin (admin_user, admin_table, admin_permission) VALUES (new.user_id,'economato',0);
INSERT INTO admin (admin_user, admin_table, admin_permission) VALUES (new.user_id,'vendors',0);
INSERT INTO admin (admin_user, admin_table, admin_permission) VALUES (new.user_id,'vendor_manufacturer',0);
INSERT INTO resaccess (resaccess_user, resaccess_table, resaccess_column, resaccess_value) VALUES (new.user_id, 'department', 'department_id', new.user_dep);
INSERT INTO resaccess (resaccess_user, resaccess_table, resaccess_column, resaccess_value) VALUES (new.user_id, 'productstate', 'productstate_id', 1);
INSERT INTO statepermission (statepermission_user, statepermission_state) VALUES (new.user_id, 6);
END IF;
IF new.user_level=2 THEN
INSERT INTO admin (admin_user, admin_table, admin_permission) VALUES (new.user_id,'vendor',0);
INSERT INTO admin (admin_user, admin_table, admin_permission) VALUES (new.user_id,'manufacturer',0);
INSERT INTO admin (admin_user, admin_table, admin_permission) VALUES (new.user_id,'product',8);
INSERT INTO admin (admin_user, admin_table, admin_permission) VALUES (new.user_id,'myproduct',12);
INSERT INTO admin (admin_user, admin_table, admin_permission) VALUES (new.user_id,'economato',0);
INSERT INTO admin (admin_user, admin_table, admin_permission) VALUES (new.user_id,'vendors',0);
INSERT INTO admin (admin_user, admin_table, admin_permission) VALUES (new.user_id,'vendor_manufacturer',0);
INSERT INTO resaccess (resaccess_user, resaccess_table, resaccess_column, resaccess_value) VALUES (new.user_id, 'department', 'department_id', new.user_dep);
INSERT INTO resaccess (resaccess_user, resaccess_table, resaccess_column, resaccess_value) VALUES (new.user_id, 'productstate', 'productstate_id', 1);
INSERT INTO statepermission (statepermission_user, statepermission_state) VALUES (new.user_id, 6);
END IF;
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `userupd`;
DELIMITER //
CREATE TRIGGER `userupd` BEFORE UPDATE ON `user`
 FOR EACH ROW BEGIN
IF OLD.user_level<>0 THEN
SET NEW.user_login=OLD.user_login;
SET NEW.user_dep=OLD.user_dep;
SET NEW.user_firstname=OLD.user_firstname;
SET NEW.user_lastname=OLD.user_lastname;
SET NEW.user_alert=OLD.user_alert;
END IF;
END
//
DELIMITER ;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`admin_user`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `admin_ibfk_2` FOREIGN KEY (`admin_permission`) REFERENCES `access` (`access_id`);

--
-- Limitadores para a tabela `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`department_inst`) REFERENCES `institute` (`institute_id`),
  ADD CONSTRAINT `department_ibfk_2` FOREIGN KEY (`department_manager`) REFERENCES `user` (`user_id`);

--
-- Limitadores para a tabela `institute`
--
ALTER TABLE `institute`
  ADD CONSTRAINT `institute_ibfk_1` FOREIGN KEY (`institute_country`) REFERENCES `country` (`country_id`);

--
-- Limitadores para a tabela `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`menu_plugin`) REFERENCES `plugin` (`plugin_id`);

--
-- Limitadores para a tabela `param`
--
ALTER TABLE `param`
  ADD CONSTRAINT `param_ibfk_1` FOREIGN KEY (`param_report`) REFERENCES `report` (`report_id`);

--
-- Limitadores para a tabela `report`
--
ALTER TABLE `report`
  ADD CONSTRAINT `report_ibfk_1` FOREIGN KEY (`report_user`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `report_ibfk_2` FOREIGN KEY (`report_conf`) REFERENCES `confidentiality` (`confidentiality_id`);

--
-- Limitadores para a tabela `reprop`
--
ALTER TABLE `reprop`
  ADD CONSTRAINT `reprop_ibfk_1` FOREIGN KEY (`reprop_report`) REFERENCES `report` (`report_id`);

--
-- Limitadores para a tabela `resaccess`
--
ALTER TABLE `resaccess`
  ADD CONSTRAINT `resaccess_ibfk_1` FOREIGN KEY (`resaccess_user`) REFERENCES `user` (`user_id`);

--
-- Limitadores para a tabela `restree`
--
ALTER TABLE `restree`
  ADD CONSTRAINT `restree_ibfk_1` FOREIGN KEY (`restree_user`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `restree_ibfk_2` FOREIGN KEY (`restree_name`) REFERENCES `treeview` (`treeview_id`),
  ADD CONSTRAINT `restree_ibfk_3` FOREIGN KEY (`restree_access`) REFERENCES `access` (`access_id`);

--
-- Limitadores para a tabela `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`user_level`) REFERENCES `level` (`level_id`),
  ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`user_dep`) REFERENCES `department` (`department_id`),
  ADD CONSTRAINT `user_ibfk_3` FOREIGN KEY (`user_alert`) REFERENCES `alert` (`alert_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
