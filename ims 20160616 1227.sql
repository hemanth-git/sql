-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.66-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema ims
--

CREATE DATABASE IF NOT EXISTS ims;
USE ims;

--
-- Definition of table `courses`
--

DROP TABLE IF EXISTS `courses`;
CREATE TABLE `courses` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(20) NOT NULL,
  `fee` int(11) NOT NULL,
  `dur` int(11) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courses`
--

/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` (`cid`,`cname`,`fee`,`dur`) VALUES 
 (11,'java',13000,45),
 (12,'c',3000,5),
 (13,'php',10000,25),
 (14,'c#',13000,45),
 (15,'python',5000,23),
 (16,'hadoop',4560,32);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;


--
-- Definition of table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `eid` int(11) NOT NULL,
  `ename` varchar(20) DEFAULT NULL,
  `sid` int(11) DEFAULT NULL,
  PRIMARY KEY (`eid`),
  KEY `f7` (`sid`),
  CONSTRAINT `f7` FOREIGN KEY (`sid`) REFERENCES `employee` (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` (`eid`,`ename`,`sid`) VALUES 
 (101,'aaa',102),
 (102,'bbb',102),
 (103,'ccc',NULL);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;


--
-- Definition of table `enroll`
--

DROP TABLE IF EXISTS `enroll`;
CREATE TABLE `enroll` (
  `sid` int(11) NOT NULL DEFAULT '0',
  `cid` int(11) NOT NULL DEFAULT '0',
  `doj` date DEFAULT NULL,
  PRIMARY KEY (`sid`,`cid`),
  KEY `f4` (`cid`),
  CONSTRAINT `f3` FOREIGN KEY (`sid`) REFERENCES `students` (`sid`),
  CONSTRAINT `f4` FOREIGN KEY (`cid`) REFERENCES `courses` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enroll`
--

/*!40000 ALTER TABLE `enroll` DISABLE KEYS */;
INSERT INTO `enroll` (`sid`,`cid`,`doj`) VALUES 
 (1,11,'2016-06-12'),
 (1,12,'2016-06-12'),
 (2,14,'2016-06-12'),
 (3,12,'2016-06-14');
/*!40000 ALTER TABLE `enroll` ENABLE KEYS */;


--
-- Definition of table `mobile`
--

DROP TABLE IF EXISTS `mobile`;
CREATE TABLE `mobile` (
  `sid` int(11) NOT NULL DEFAULT '0',
  `mobile1` bigint(20) NOT NULL DEFAULT '0',
  `mobile2` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`sid`,`mobile1`),
  CONSTRAINT `f5` FOREIGN KEY (`sid`) REFERENCES `students` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mobile`
--

/*!40000 ALTER TABLE `mobile` DISABLE KEYS */;
INSERT INTO `mobile` (`sid`,`mobile1`,`mobile2`) VALUES 
 (1,1221123122,12523123343),
 (1,1231123122,123123123343),
 (2,122143122,1252123343),
 (2,1221133122,12523153343),
 (3,1221123122,12523123343),
 (3,1221133122,12523153343);
/*!40000 ALTER TABLE `mobile` ENABLE KEYS */;


--
-- Definition of table `salary`
--

DROP TABLE IF EXISTS `salary`;
CREATE TABLE `salary` (
  `stid` int(11) NOT NULL,
  `bp` float(10,2) DEFAULT NULL,
  `allow` float(8,2) DEFAULT NULL,
  `deduc` float(10,2) DEFAULT '500.00',
  PRIMARY KEY (`stid`),
  CONSTRAINT `f2` FOREIGN KEY (`stid`) REFERENCES `staff` (`stid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `salary`
--

/*!40000 ALTER TABLE `salary` DISABLE KEYS */;
INSERT INTO `salary` (`stid`,`bp`,`allow`,`deduc`) VALUES 
 (1,13000.00,2300.00,500.00),
 (2,12000.00,1000.00,500.00),
 (3,12000.00,500.00,500.00);
/*!40000 ALTER TABLE `salary` ENABLE KEYS */;


--
-- Definition of table `staff`
--

DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff` (
  `stid` int(11) NOT NULL AUTO_INCREMENT,
  `stname` varchar(20) NOT NULL,
  `mobile` bigint(20) DEFAULT NULL,
  `cno` int(11) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`stid`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `mobile` (`mobile`),
  KEY `f1` (`cno`),
  CONSTRAINT `f1` FOREIGN KEY (`cno`) REFERENCES `courses` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` (`stid`,`stname`,`mobile`,`cno`,`email`) VALUES 
 (1,'deepa',9876543211,11,'deepa@gmail.com'),
 (2,'reeshma',1231231231,12,'reshma@gmail.com'),
 (3,'hemanth',3453453453,13,'hemanth@gmail.com');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;


--
-- Definition of table `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE `students` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `sname` varchar(20) NOT NULL,
  `mail` varchar(30) DEFAULT NULL,
  `add1` varchar(20) DEFAULT NULL,
  `add2` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`sid`),
  UNIQUE KEY `sid` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` (`sid`,`sname`,`mail`,`add1`,`add2`) VALUES 
 (1,'uma','uma@gmail.com','morgangate','mangalore'),
 (2,'vidhya','vud@gmail.com','morgangate','mangalore'),
 (3,'anu','anu@yahoo.com','jeepu','mangalore');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
