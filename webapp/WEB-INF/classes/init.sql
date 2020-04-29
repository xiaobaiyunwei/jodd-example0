CREATE TABLE `IVR_MENU_INFO` (
  `IVR_MENU_ID` int(10) DEFAULT NULL,
  `CALLER_NUMBER` varchar(50) DEFAULT NULL,
  `CALLED_NUMBER` varchar(50) DEFAULT NULL,
  `SSP_ID` int(10) DEFAULT NULL,
  `IVR_MENU_TYPE_CODE` varchar(50) DEFAULT NULL,
  `CHANGE_CHOICE` varchar(1) DEFAULT NULL,
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UPDATE_TIME` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 