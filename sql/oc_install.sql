--
-- Table structure for table `active_users`
--

CREATE TABLE `<DB_PREFIX>active_users` (
  `identifier` varchar(255) UNIQUE KEY NOT NULL,
  `callsign` varchar(255) UNIQUE KEY NOT NULL COMMENT 'Unit Callsign',
  `status` int(11) NOT NULL COMMENT 'Unit status, 0=busy/unavailable, 1=available, 2=dispatcher',
  `status_detail` int(11) NOT NULL COMMENT 'Paired to Statuses table',
  `id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `aop`
--

CREATE TABLE `<DB_PREFIX>aop` (
  `aop` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `bolos_persons`
--

CREATE TABLE `<DB_PREFIX>bolos_persons` (
  `id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL COMMENT 'First name of BOLO suspect.',
  `last_name` varchar(255) NOT NULL COMMENT 'Last name of BOLO suspect.',
  `gender` varchar(255) NOT NULL COMMENT 'Gender of BOLO suspect.',
  `physical_description` varchar(255) NOT NULL COMMENT 'Physical description of BOLO suspect.',
  `reason_wanted` varchar(255) NOT NULL COMMENT 'Reason BOLO suspect is wanted.',
  `last_seen` varchar(255) NOT NULL COMMENT 'Last observed location of BOLO suspect.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `bolos_vehicles`
--

CREATE TABLE `<DB_PREFIX>bolos_vehicles` (
  `id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `vehicle_make` varchar(255) NOT NULL COMMENT 'Make of BOLO vehicle.',
  `vehicle_model` varchar(255) NOT NULL COMMENT 'Model of BOLO vehicle.',
  `vehicle_plate` varchar(255) NOT NULL COMMENT 'License of BOLO vehicle.',
  `primary_color` varchar(255) NOT NULL COMMENT 'Primary color of BOLO vehicle.',
  `secondary_color` varchar(255) NOT NULL COMMENT 'Secondary color of BOLO vehicle.',
  `reason_wanted` varchar(255) NOT NULL COMMENT 'Reason BOLO suspect is wanted.',
  `last_seen` varchar(255) NOT NULL COMMENT 'Last observed location of BOLO vehicle.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `calls`
--

CREATE TABLE `<DB_PREFIX>calls` (
  `call_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `call_type` text NOT NULL,
  `call_primary` text,
  `call_street1` text NOT NULL,
  `call_street2` text,
  `call_street3` text,
  `call_narrative` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `calls_users`
--

CREATE TABLE `<DB_PREFIX>calls_users` (
  `call_id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `callsign` varchar(255) NOT NULL,
  `id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `call_history`
--

CREATE TABLE `<DB_PREFIX>call_history` (
  `call_id` int(11) NOT NULL,
  `call_type` text NOT NULL,
  `call_primary` text,
  `call_street1` text NOT NULL,
  `call_street2` text,
  `call_street3` text,
  `call_narrative` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `call_list`
--

CREATE TABLE `<DB_PREFIX>call_list` (
  `call_id` int(11) UNIQUE KEY NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `citations`
--

CREATE TABLE `<DB_PREFIX>citations` (
  `id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `citation_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `civilian_names`
--

CREATE TABLE `<DB_PREFIX>civilian_names` (
  `user_id` int(11) NOT NULL COMMENT 'Links to users table',
  `names_id` int(11) NOT NULL COMMENT 'Links to names table'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `<DB_PREFIX>colors` (
  `id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `color_group` varchar(255) DEFAULT NULL,
  `color_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `<DB_PREFIX>departments` (
  `department_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `department_name` varchar(255) DEFAULT NULL COMMENT 'The functional name of the department. (eg. Police, Fire, EMS)',
  `department_short_name` varchar(10) NOT NULL COMMENT 'The name of the department. (eg. Los Angeles Police Department, Blaine County Sheriffs` Office',
  `department_long_name` varchar(255) NOT NULL COMMENT 'The acronym of the department name. (eg. BCSO, LAPD, LAFD)',
  `allow_department` int(11) NOT NULL COMMENT 'If 0 then department is disabled, if 1 then department is enabled.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `dispatchers`
--

CREATE TABLE `<DB_PREFIX>dispatchers` (
  `identifier` varchar(255) UNIQUE KEY NOT NULL,
  `callsign` varchar(255) NOT NULL COMMENT 'Unit Callsign',
  `status` int(11) NOT NULL COMMENT 'Unit status, 0=offline, 1=online'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `genders`
--

CREATE TABLE `<DB_PREFIX>genders` (
  `id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `genders` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `incident_type`
--

CREATE TABLE `<DB_PREFIX>incident_type` (
  `code_id` varchar(255) NOT NULL DEFAULT '',
  `code_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ncic_arrests`
--

CREATE TABLE `<DB_PREFIX>ncic_arrests` (
  `id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name_id` int(11) NOT NULL COMMENT 'Paired to ID of ncic_names table',
  `arrest_reason` varchar(255) NOT NULL,
  `arrest_fine` int(11) NOT NULL,
  `issued_date` date DEFAULT NULL,
  `issued_by` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ncic_citations`
--

CREATE TABLE `<DB_PREFIX>ncic_citations` (
  `id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0 = Pending, 1 = Approved/Active',
  `name_id` int(11) NOT NULL COMMENT 'Paired to ID of ncic_names table',
  `citation_name` varchar(255) NOT NULL,
  `citation_fine` int(11) NOT NULL,
  `issued_date` date DEFAULT NULL,
  `issued_by` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ncic_names`
--

CREATE TABLE `<DB_PREFIX>ncic_names` (
  `id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `submittedByName` varchar(255) NOT NULL,
  `submittedById` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dob` date NOT NULL COMMENT 'Date of birth',
  `address` text NOT NULL,
  `gender` varchar(255) NOT NULL,
  `race` text NOT NULL,
  `dl_status` set('Unobtained','Valid','Suspended','Expired') NOT NULL,
  `hair_color` text NOT NULL,
  `build` text NOT NULL,
  `weapon_permit` varchar(255) NOT NULL,
  `deceased` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `ncic_plates`
--

CREATE TABLE `<DB_PREFIX>ncic_plates` (
  `id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name_id` int(11) NOT NULL COMMENT 'Links to ncic_names db for driver information',
  `veh_plate` text NOT NULL,
  `veh_make` text NOT NULL,
  `veh_model` text NOT NULL,
  `veh_pcolor` text NOT NULL,
  `veh_scolor` text NOT NULL,
  `veh_insurance` set('VALID','EXPIRED') NOT NULL DEFAULT 'VALID',
  `flags` set('NONE','STOLEN','WANTED','SUSPENDED REGISTRATION','UC FLAG','HPIU FLAG') NOT NULL DEFAULT 'NONE',
  `veh_reg_state` text NOT NULL,
  `notes` text COMMENT 'Any special flags visible to dispatchers',
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `ncic_warnings`
--

CREATE TABLE `<DB_PREFIX>ncic_warnings` (
  `id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0 = Pending, 1 = Approved/Active',
  `name_id` int(11) NOT NULL COMMENT 'Paired to ID of ncic_names table',
  `warning_name` varchar(255) NOT NULL,
  `issued_date` date DEFAULT NULL,
  `issued_by` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ncic_warrants`
--

CREATE TABLE `<DB_PREFIX>ncic_warrants` (
  `id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `expiration_date` date DEFAULT NULL,
  `warrant_name` varchar(255) NOT NULL,
  `issuing_agency` varchar(255) NOT NULL,
  `name_id` int(11) NOT NULL COMMENT 'Key that pairs to the ncic_name id',
  `issued_date` date DEFAULT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ncic_weapons`
--

CREATE TABLE `<DB_PREFIX>ncic_weapons` (
  `id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name_id` int(11) NOT NULL COMMENT 'Links to ncic_names db for driver information',
  `weapon_type` varchar(255) NOT NULL,
  `weapon_name` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `<DB_PREFIX>statuses` (
  `status_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `status_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `streets`
--

CREATE TABLE `<DB_PREFIX>streets` (
  `id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT 'Primary key for each street',
  `name` text NOT NULL COMMENT 'Street name',
  `county` text NOT NULL COMMENT 'County name'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `tones`
--

CREATE TABLE `<DB_PREFIX>tones` (
  `id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `active` set('0','1') NOT NULL DEFAULT '0' COMMENT '0 = inactive, 1 = active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tones table. DO NOT ADD ROWS TO THIS TABLE' ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `<DB_PREFIX>users` (
  `id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` text,
  `identifier` varchar(255) DEFAULT NULL,
  `admin_privilege` int(1) NOT NULL DEFAULT '0' COMMENT 'If 1 then user does not possess any administrative permissions, else if 2 then user possess Moderator privileges, else if 3 then user possess Administrator privileges.',
  `supervisor_privilege` int(1) NOT NULL DEFAULT '0' COMMENT 'If 0 then user does not possess any supervisor privileges, else 1 then user possess supervisor privileges.',
  `password_reset` int(1) NOT NULL DEFAULT '0' COMMENT '1 means password reset required. 0 means it''s not.',
  `approved` int(1) NOT NULL DEFAULT '0' COMMENT 'Three main statuses: 0 means pending approval. 1 means has access. 2 means suspended',
  `suspend_reason` tinytext COMMENT 'Stores the reason why a user is Suspended',
  `suspend_duration` date DEFAULT NULL COMMENT 'Stores the duration a user is Suspended for'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='User table' ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `user_departments`
--

CREATE TABLE `<DB_PREFIX>user_departments` (
  `user_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `user_departments_temp`
--

CREATE TABLE `<DB_PREFIX>user_departments_temp` (
  `user_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Temporary table - stores user departments for non-approved users' ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `<DB_PREFIX>vehicles` (
  `id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `Make` varchar(100) NOT NULL,
  `Model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `weapons`
--

CREATE TABLE `<DB_PREFIX>weapons` (
  `id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `weapon_type` varchar(255) NOT NULL,
  `weapon_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `config`
--

CREATE TABLE `<DB_PREFIX>config` (
  `key` varchar(80) NOT NULL,
  `value` varchar(80)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `<DB_PREFIX>users` (`id`, `name`, `email`, `password`, `identifier`, `admin_privilege`, `supervisor_privilege`, `password_reset`, `approved`, `suspend_reason`, `suspend_duration`) VALUES
(1, '<NAME>', '<EMAIL>', '<PASSWORD>', '1A-1', 3, 1, 0, 1, NULL, NULL);

COMMIT;