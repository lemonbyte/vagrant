/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.5.35-0+wheezy1 : Database - intranet
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`intranet` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `intranet`;

/*Table structure for table `admin_users` */

DROP TABLE IF EXISTS `admin_users`;

CREATE TABLE `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '5',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `admin_users` */

insert  into `admin_users`(`id`,`user_id`,`status`) values (2,38,5),(3,39,0),(11,8,5),(12,34,5),(13,41,5);

/*Table structure for table `agenda` */

DROP TABLE IF EXISTS `agenda`;

CREATE TABLE `agenda` (
  `id` tinyint(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `startdatum` date DEFAULT NULL,
  `einddatum` date DEFAULT NULL,
  `afdeling` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT 'algemeen',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

/*Data for the table `agenda` */

insert  into `agenda`(`id`,`content`,`startdatum`,`einddatum`,`afdeling`) values (51,'test','2014-01-08','2014-01-10','algemeen');

/*Table structure for table `pages` */

DROP TABLE IF EXISTS `pages`;

CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permalink` varchar(255) NOT NULL,
  `title_menu` varchar(100) DEFAULT NULL,
  `content` text,
  `positie` tinyint(4) NOT NULL,
  `parent_id` int(10) DEFAULT NULL,
  `meta_title` varchar(100) DEFAULT NULL,
  `meta_description` text,
  `meta_keywords` text,
  `status` tinyint(1) unsigned NOT NULL COMMENT '1 = actief, 2 = gepubliceerd, 0 = verwijderd',
  PRIMARY KEY (`id`),
  UNIQUE KEY `permalink` (`permalink`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `pages` */

insert  into `pages`(`id`,`permalink`,`title_menu`,`content`,`positie`,`parent_id`,`meta_title`,`meta_description`,`meta_keywords`,`status`) values (9,'test1','testpagina','<p>Dit is een test</p>\r\n\r\n<p>Hallo</p>\r\n',4,0,'dsdfsg','sgsgdgf','sdgsdf',2),(10,'test2','nieuwe pagina','<p>test</p>\r\n',6,0,'','','',0),(19,'test','Nieuws','<p><input alt=\"test image button\" src=\"http://daskapital.nl/images/picas/GoudenEiKlein.jpg\" style=\"height:75px; width:125px\" type=\"image\" /></p>\r\n',2,0,'','','',0),(20,'nieuwe-pagina-1','nieuwe pagina 1','',2,0,'','','',2),(21,'nieuwe-pagina-2','nieuwe pagina 2','',0,0,'','','',0),(22,'nieuwe-pagina-3','nieuwe pagina 3','',0,0,'','','',0);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(125) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(35) CHARACTER SET latin1 DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `password` varchar(255) CHARACTER SET latin1 NOT NULL,
  `salt` varchar(255) CHARACTER SET latin1 NOT NULL,
  `email` varchar(125) CHARACTER SET latin1 NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login` datetime DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`id`,`first_name`,`last_name`,`password`,`salt`,`email`,`created`,`last_login`,`active`) values (6,'tester','','sha256:1000:3kZQCSePu+02p74N9UJZUkUPvECd81qK:U/X17DwmCO+bKJl4hcltl9uOQBIkgqGV','3kZQCSePu+02p74N9UJZUkUPvECd81qK','test@test.nl','2013-09-11 13:29:18','2013-12-19 12:37:19',0),(8,'Niek','te Grootenhuis','sha256:1000:IpoDz90vTZeN8KFd1fSepjXlxnZ2vLuc:FyH9kPifmoqZy9IUs58LHK0OkWBU6PNo','IpoDz90vTZeN8KFd1fSepjXlxnZ2vLuc','n.tegrootenhuis@readview.nl','2013-09-12 07:43:15','2014-01-21 13:26:06',0),(34,'Jordy','Rosendahl','sha256:1000:LQJLJO7IfOOqQvKnTtdTCVcVihZ1eTkC:bL7/R0FFpoDCHBVLKdDuvUuSggdMO+4c','LQJLJO7IfOOqQvKnTtdTCVcVihZ1eTkC','j.rosendahl@readview.nl','2013-12-04 14:26:33','2013-12-17 09:35:50',1),(38,'Radek','Dolewa','sha256:1000:iaE4Ec5g9K43JGHCnMf6WM8Jh0mwCIES:wlkkDiqsb6mIS2GV00nqS6f9v6cLmyAF','iaE4Ec5g9K43JGHCnMf6WM8Jh0mwCIES','r.dolewa@readview.nl','2013-12-05 08:43:08','2013-12-17 09:16:22',1),(39,'test','tester','sha256:1000:i43aZOxgljTcawvA4GaEbJV6lfXojQGT:Fi4Iwc0XB5WeT2dTdblg/0jauBE/rZ6v','i43aZOxgljTcawvA4GaEbJV6lfXojQGT','test@test.nlasd','2013-12-05 09:19:27',NULL,0),(40,'Kevin','Plasmans','sha256:1000:NuRMh6RLVHampZ4dOfu68kLM+gyF9f1C:ecjE1KKh63Elp0XQReXhDvBPS1L7oEw6','NuRMh6RLVHampZ4dOfu68kLM+gyF9f1C','k.plasmans@readview.nl','2013-12-09 15:53:12',NULL,0),(41,'test 2323','te Grootenhuis 32','sha256:1000:QeNVgEhmZ9AqecuZY6R3CNJPMS7BH2Jr:1+/5uQOYMo5igQnND8/IvEkpE7N1yzOP','QeNVgEhmZ9AqecuZY6R3CNJPMS7BH2Jr','test4@test.nl','2013-12-13 14:36:00',NULL,0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
