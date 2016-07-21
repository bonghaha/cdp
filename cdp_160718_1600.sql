-- --------------------------------------------------------
-- Host:                         bongha825.cafe24.com
-- Server version:               5.5.17-log - MySQL Community Server (GPL)
-- Server OS:                    Linux
-- HeidiSQL Version:             8.0.0.4396
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for bongha825
DROP DATABASE IF EXISTS `bongha825`;
CREATE DATABASE IF NOT EXISTS `bongha825` /*!40100 DEFAULT CHARACTER SET euckr */;
USE `bongha825`;


-- Dumping structure for table bongha825.act_book
DROP TABLE IF EXISTS `act_book`;
CREATE TABLE IF NOT EXISTS `act_book` (
  `act_book_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_unite_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_book_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_book_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_book_condition` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_book_content` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_book_count` int(11) NOT NULL,
  `act_book_registerdate` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_book_startdate` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_book_enddate` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_mento_id` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`act_book_code`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='실천_도서';

-- Dumping data for table bongha825.act_book: 0 rows
DELETE FROM `act_book`;
/*!40000 ALTER TABLE `act_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_book` ENABLE KEYS */;


-- Dumping structure for table bongha825.act_cert
DROP TABLE IF EXISTS `act_cert`;
CREATE TABLE IF NOT EXISTS `act_cert` (
  `act_cert_code` varchar(50) NOT NULL,
  `act_unite_code` varchar(50) NOT NULL,
  `info_member_code` varchar(50) NOT NULL,
  `plan_cert_code` varchar(50) NOT NULL,
  `act_cert_condition` varchar(50) NOT NULL,
  `act_cert_content` varchar(50) NOT NULL,
  `act_cert_count` int(11) NOT NULL,
  `act_cert_registerdate` varchar(50) NOT NULL,
  `act_cert_startdate` varchar(50) NOT NULL,
  `act_cert_enddate` varchar(50) NOT NULL,
  `act_mento_id` varchar(50) NOT NULL,
  PRIMARY KEY (`act_cert_code`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='실천_자격증';

-- Dumping data for table bongha825.act_cert: 0 rows
DELETE FROM `act_cert`;
/*!40000 ALTER TABLE `act_cert` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_cert` ENABLE KEYS */;


-- Dumping structure for table bongha825.act_contest
DROP TABLE IF EXISTS `act_contest`;
CREATE TABLE IF NOT EXISTS `act_contest` (
  `act_contest_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_unite_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_member_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_contest_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_contest_condition` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_contest_content` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_contest_count` int(11) NOT NULL,
  `act_contest_registerdate` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_contest_startdate` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_contest_enddate` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_mento_id` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`act_contest_code`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='실천_공모전/수상';

-- Dumping data for table bongha825.act_contest: 0 rows
DELETE FROM `act_contest`;
/*!40000 ALTER TABLE `act_contest` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_contest` ENABLE KEYS */;


-- Dumping structure for table bongha825.act_dept
DROP TABLE IF EXISTS `act_dept`;
CREATE TABLE IF NOT EXISTS `act_dept` (
  `act_dept_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_unite_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_member_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_dept_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_dept_condition` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_dept_content` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_dept_count` int(10) NOT NULL,
  `act_dept_registerdate` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_dept_startdate` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_dept_enddate` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_mento_id` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`act_dept_code`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='실천_학과';

-- Dumping data for table bongha825.act_dept: 0 rows
DELETE FROM `act_dept`;
/*!40000 ALTER TABLE `act_dept` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_dept` ENABLE KEYS */;


-- Dumping structure for table bongha825.act_jobt
DROP TABLE IF EXISTS `act_jobt`;
CREATE TABLE IF NOT EXISTS `act_jobt` (
  `act_jobt_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_unite_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_member_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_jobt_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_jobt_condition` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_jobt_content` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_jobt_count` int(10) NOT NULL,
  `act_jobt_registerdate` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_jobt_startdate` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_jobt_enddate` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_mento_id` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`act_jobt_code`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='실천_직업교육';

-- Dumping data for table bongha825.act_jobt: 0 rows
DELETE FROM `act_jobt`;
/*!40000 ALTER TABLE `act_jobt` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_jobt` ENABLE KEYS */;


-- Dumping structure for table bongha825.act_lang
DROP TABLE IF EXISTS `act_lang`;
CREATE TABLE IF NOT EXISTS `act_lang` (
  `act_lang_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_unite_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_member_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_lang_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_lang_condition` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_lang_content` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_lang_count` int(11) NOT NULL,
  `act_lang_registerdate` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_lang_startdate` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_lang_enddate` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_mento_id` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`act_lang_code`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='실천_언어';

-- Dumping data for table bongha825.act_lang: 0 rows
DELETE FROM `act_lang`;
/*!40000 ALTER TABLE `act_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_lang` ENABLE KEYS */;


-- Dumping structure for table bongha825.act_mento
DROP TABLE IF EXISTS `act_mento`;
CREATE TABLE IF NOT EXISTS `act_mento` (
  `act_mento_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_mento_id` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_mento_checkcondition` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_mento_checkcontent` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`act_mento_code`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='실천_멘토';

-- Dumping data for table bongha825.act_mento: 0 rows
DELETE FROM `act_mento`;
/*!40000 ALTER TABLE `act_mento` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_mento` ENABLE KEYS */;


-- Dumping structure for table bongha825.act_school
DROP TABLE IF EXISTS `act_school`;
CREATE TABLE IF NOT EXISTS `act_school` (
  `act_school_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_unite_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_member_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_school_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_school_condition` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_school_content` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_school_count` int(10) NOT NULL,
  `act_school_registerdate` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_school_startdate` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_school_enddate` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_mento_id` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`act_school_code`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='실천_학교';

-- Dumping data for table bongha825.act_school: 0 rows
DELETE FROM `act_school`;
/*!40000 ALTER TABLE `act_school` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_school` ENABLE KEYS */;


-- Dumping structure for table bongha825.act_studyab
DROP TABLE IF EXISTS `act_studyab`;
CREATE TABLE IF NOT EXISTS `act_studyab` (
  `act_studyab_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_unite_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_member_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_studyab_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_studyab_condition` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_studyab_content` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_studyab_count` int(10) NOT NULL,
  `act_studyab_registerdate` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_studyab_startdate` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_studyab_enddate` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_mento_id` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`act_studyab_code`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='실천_학과';

-- Dumping data for table bongha825.act_studyab: 0 rows
DELETE FROM `act_studyab`;
/*!40000 ALTER TABLE `act_studyab` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_studyab` ENABLE KEYS */;


-- Dumping structure for table bongha825.act_unite
DROP TABLE IF EXISTS `act_unite`;
CREATE TABLE IF NOT EXISTS `act_unite` (
  `act_unite_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_member_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_job_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_unite_title` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_unite_content` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_unite_registerdate` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_mento_id` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`act_unite_code`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='실천_통합';

-- Dumping data for table bongha825.act_unite: 0 rows
DELETE FROM `act_unite`;
/*!40000 ALTER TABLE `act_unite` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_unite` ENABLE KEYS */;


-- Dumping structure for table bongha825.act_volun
DROP TABLE IF EXISTS `act_volun`;
CREATE TABLE IF NOT EXISTS `act_volun` (
  `act_volun_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_unite_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_member_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_volun_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_volun_condition` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_volun_content` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_volun_count` int(10) NOT NULL,
  `act_volun_registerdate` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_volun_startdate` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_volun_enddate` varchar(50) CHARACTER SET utf8 NOT NULL,
  `act_mento_id` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`act_volun_code`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='실천_봉사활동';

-- Dumping data for table bongha825.act_volun: 0 rows
DELETE FROM `act_volun`;
/*!40000 ALTER TABLE `act_volun` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_volun` ENABLE KEYS */;


-- Dumping structure for table bongha825.article
DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `article_no` int(10) NOT NULL AUTO_INCREMENT,
  `article_title` varchar(250) NOT NULL,
  `article_content` text NOT NULL,
  `article_writer` varchar(50) NOT NULL,
  `article_date` datetime NOT NULL,
  `article_pw` varchar(50) NOT NULL,
  PRIMARY KEY (`article_no`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=euckr;

-- Dumping data for table bongha825.article: 26 rows
DELETE FROM `article`;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` (`article_no`, `article_title`, `article_content`, `article_writer`, `article_date`, `article_pw`) VALUES
	(1, '123', '123', 'ddd', '2016-07-04 14:02:31', '1234'),
	(2, '2', '2', '2', '2016-07-06 09:21:31', '2'),
	(3, '3', '3', '3', '2016-07-06 09:21:34', '3'),
	(4, '4', '4', '4', '2016-07-06 09:21:38', '4'),
	(5, '5', '5', '5', '2016-07-06 09:21:42', '5'),
	(6, '6', '6', '6', '2016-07-06 09:21:45', '6'),
	(7, '7', '7', '7', '2016-07-06 09:21:49', '7'),
	(8, '8', '8', '8', '2016-07-06 09:21:53', '8'),
	(9, '9', '9', '9', '2016-07-06 09:21:57', '9'),
	(10, '10', '10', '10', '2016-07-06 09:28:28', '10'),
	(11, '11', '11', '11', '2016-07-06 09:22:07', '11'),
	(12, '12', '12', '12', '2016-07-06 09:22:13', '12'),
	(13, '13', '13', '13', '2016-07-06 09:22:17', '13'),
	(16, 'writing', 'content', 'writer1', '2016-07-06 10:31:39', '1234'),
	(17, 'writing2', 'content2', 'writer2', '2016-07-06 10:31:52', '1234'),
	(18, 'www', '1234', 'gg', '2016-07-06 10:32:08', '1234'),
	(25, '테스트', '1234', '한글', '2016-07-06 11:17:52', '1234'),
	(26, '', '', '', '2016-07-06 11:18:07', ''),
	(27, '복', '줘', '복받는사람', '2016-07-15 15:25:52', '1234'),
	(28, 'dog', 'jasik', 'dog', '2016-07-15 15:38:00', 'cat'),
	(29, '서지연', '저리가', '마늘냄새나', '2016-07-15 15:51:53', '1234'),
	(30, '신시가지', '저희 클럽 VIP이신 황봉하님 을\r\n저희 파티에 초대합니다', '☆파격세일☆', '2016-07-15 15:52:45', '1212'),
	(31, '봉하형...', '저좀그만드세요..', '갈릭', '2016-07-15 15:53:19', '1212'),
	(32, '봉하야....', '너...멋있다..', '오성현', '2016-07-15 15:54:22', '1212'),
	(33, '형내일 결혼하신다면서요??', '축하드려요 ㅎㅎ', '박효민', '2016-07-15 16:06:10', '1234'),
	(34, '내밑으로 다조용히해라', '아무도 글쓰지마라', '황봉하', '2016-07-15 16:06:44', '');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;


-- Dumping structure for table bongha825.info_atest
DROP TABLE IF EXISTS `info_atest`;
CREATE TABLE IF NOT EXISTS `info_atest` (
  `info_atest_code` varchar(50) NOT NULL,
  `mypage_code` varchar(50) NOT NULL,
  `info_member_code` varchar(50) NOT NULL,
  `info_job_code` varchar(50) NOT NULL,
  PRIMARY KEY (`info_atest_code`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='기본정보_적성검사결과';

-- Dumping data for table bongha825.info_atest: 0 rows
DELETE FROM `info_atest`;
/*!40000 ALTER TABLE `info_atest` DISABLE KEYS */;
/*!40000 ALTER TABLE `info_atest` ENABLE KEYS */;


-- Dumping structure for table bongha825.info_book
DROP TABLE IF EXISTS `info_book`;
CREATE TABLE IF NOT EXISTS `info_book` (
  `info_book_code` varchar(50) NOT NULL,
  `info_book_bigcode` varchar(50) NOT NULL,
  `info_book_middlecode` varchar(50) NOT NULL,
  `info_book_smallcode` varchar(50) NOT NULL,
  `info_book_name` varchar(50) NOT NULL,
  PRIMARY KEY (`info_book_code`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='기본정보_도서';

-- Dumping data for table bongha825.info_book: 26 rows
DELETE FROM `info_book`;
/*!40000 ALTER TABLE `info_book` DISABLE KEYS */;
INSERT INTO `info_book` (`info_book_code`, `info_book_bigcode`, `info_book_middlecode`, `info_book_smallcode`, `info_book_name`) VALUES
	('info_book_1', '소설', '케이스마트', '김성겸', '논리적글쓰기'),
	('info_book_2', '에세이', '케이스마트', '황봉하', '대살개문'),
	('info_book_3', '전문서적', '케이스마트', '김범준', '소프트웨어'),
	('info_book_4', '소설', '케이스마트', '고민세', '하드웨어'),
	('info_book_5', '문학', '케이스마트', '김민재', 'ajax'),
	('info_book_6', '자기계발서', '케이마트', '신복기', 'jquery'),
	('info_book_7', '문학', '케이마트', '감자참', '자바야놀자'),
	('info_book_8', '3', '3', '3', '3'),
	('info_book_9', '4', '4', '4', '4'),
	('info_book_10', '5', '5', '5', '5'),
	('info_book_11', '6', '6', '6', '6'),
	('info_book_12', '7', '7', '7', '7'),
	('info_book_13', '1', '1', '1', '1'),
	('info_book_14', '2', '2', '2', '2'),
	('info_book_15', '3', '3', '3', '3'),
	('info_book_16', '3', '3', '3', '3'),
	('info_book_17', '3', '3', '3', '3'),
	('info_book_18', '3', '3', '3', '3'),
	('info_book_19', '3', '3', '3', '3'),
	('info_book_20', '3', '3', '3', '3'),
	('info_book_21', '3', '3', '3', '3'),
	('info_book_22', '3', '3', '3', '3'),
	('info_book_23', '3', '3', '3', '3'),
	('info_book_24', '3', '3', '3', '3'),
	('info_book_25', '3', '3', '3', '3'),
	('info_book_26', '3', '3', '3', '3');
/*!40000 ALTER TABLE `info_book` ENABLE KEYS */;


-- Dumping structure for table bongha825.info_book_middlecode
DROP TABLE IF EXISTS `info_book_middlecode`;
CREATE TABLE IF NOT EXISTS `info_book_middlecode` (
  `info_book_middlecode` int(10) NOT NULL AUTO_INCREMENT,
  `info_book_middlecode_name` varchar(50) NOT NULL,
  PRIMARY KEY (`info_book_middlecode`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='기본정보_도서_중분류';

-- Dumping data for table bongha825.info_book_middlecode: 0 rows
DELETE FROM `info_book_middlecode`;
/*!40000 ALTER TABLE `info_book_middlecode` DISABLE KEYS */;
/*!40000 ALTER TABLE `info_book_middlecode` ENABLE KEYS */;


-- Dumping structure for table bongha825.info_book_smallcode
DROP TABLE IF EXISTS `info_book_smallcode`;
CREATE TABLE IF NOT EXISTS `info_book_smallcode` (
  `info_book_smallcode` int(10) NOT NULL AUTO_INCREMENT,
  `info_book_smallcode_name` varchar(50) NOT NULL,
  PRIMARY KEY (`info_book_smallcode`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='기본정보_도서_소분류';

-- Dumping data for table bongha825.info_book_smallcode: 0 rows
DELETE FROM `info_book_smallcode`;
/*!40000 ALTER TABLE `info_book_smallcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `info_book_smallcode` ENABLE KEYS */;


-- Dumping structure for table bongha825.info_cert
DROP TABLE IF EXISTS `info_cert`;
CREATE TABLE IF NOT EXISTS `info_cert` (
  `info_cert_code` varchar(50) NOT NULL,
  `info_cert_bigcode` varchar(50) NOT NULL,
  `info_cert_middlecode` varchar(50) NOT NULL,
  `info_cert_name` varchar(50) NOT NULL,
  PRIMARY KEY (`info_cert_code`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='기본정보_자격증';

-- Dumping data for table bongha825.info_cert: 12 rows
DELETE FROM `info_cert`;
/*!40000 ALTER TABLE `info_cert` DISABLE KEYS */;
INSERT INTO `info_cert` (`info_cert_code`, `info_cert_bigcode`, `info_cert_middlecode`, `info_cert_name`) VALUES
	('info_cert_1', '국가기술', '성현이형', '바보'),
	('info_cert_2', '검색', '검색', '검색'),
	('info_cert_3', '바보', '바보', '바보'),
	('info_cert_4', '바보바보', '바보', '바보'),
	('info_cert_5', '바보', '바보', '바보'),
	('info_cert_6', '바보', '바보', '바보'),
	('info_cert_7', '바보', '바보', '바보'),
	('info_cert_8', '바보', '바보', '바보'),
	('info_cert_9', '바보', '바보', '바보'),
	('info_cert_10', '바보', '바보', '바보'),
	('info_cert_11', '바보', '바보', '바보'),
	('info_cert_12', '바보', '바보', '바보');
/*!40000 ALTER TABLE `info_cert` ENABLE KEYS */;


-- Dumping structure for table bongha825.info_cert_bigcode
DROP TABLE IF EXISTS `info_cert_bigcode`;
CREATE TABLE IF NOT EXISTS `info_cert_bigcode` (
  `info_cert_bigcode` int(10) NOT NULL AUTO_INCREMENT,
  `info_cert_bigcode_name` varchar(50) NOT NULL,
  PRIMARY KEY (`info_cert_bigcode`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='기본정보_자격증_대분류';

-- Dumping data for table bongha825.info_cert_bigcode: 0 rows
DELETE FROM `info_cert_bigcode`;
/*!40000 ALTER TABLE `info_cert_bigcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `info_cert_bigcode` ENABLE KEYS */;


-- Dumping structure for table bongha825.info_cert_middlecode
DROP TABLE IF EXISTS `info_cert_middlecode`;
CREATE TABLE IF NOT EXISTS `info_cert_middlecode` (
  `info_cert_middlecode` int(10) NOT NULL AUTO_INCREMENT,
  `info_cert_middlecode_name` varchar(50) NOT NULL,
  PRIMARY KEY (`info_cert_middlecode`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='기본정보_자격증_중분류';

-- Dumping data for table bongha825.info_cert_middlecode: 0 rows
DELETE FROM `info_cert_middlecode`;
/*!40000 ALTER TABLE `info_cert_middlecode` DISABLE KEYS */;
/*!40000 ALTER TABLE `info_cert_middlecode` ENABLE KEYS */;


-- Dumping structure for table bongha825.info_contest
DROP TABLE IF EXISTS `info_contest`;
CREATE TABLE IF NOT EXISTS `info_contest` (
  `info_contest_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_contest_bigcode` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_contest_middlecode` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_contest_smallcode` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_contest_name` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`info_contest_code`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='기본정보_공모전/수상';

-- Dumping data for table bongha825.info_contest: 4 rows
DELETE FROM `info_contest`;
/*!40000 ALTER TABLE `info_contest` DISABLE KEYS */;
INSERT INTO `info_contest` (`info_contest_code`, `info_contest_bigcode`, `info_contest_middlecode`, `info_contest_smallcode`, `info_contest_name`) VALUES
	('info_contest_1', '321', '321', '321', '321'),
	('info_contest_2', '123', '123', '123', '123'),
	('info_contest_3', '', '', '', ''),
	('info_contest_4', '', '', '', '');
/*!40000 ALTER TABLE `info_contest` ENABLE KEYS */;


-- Dumping structure for table bongha825.info_contest_bigcode
DROP TABLE IF EXISTS `info_contest_bigcode`;
CREATE TABLE IF NOT EXISTS `info_contest_bigcode` (
  `info_contest_bigcode` int(10) NOT NULL AUTO_INCREMENT,
  `info_contest_bigcode_name` varchar(50) NOT NULL,
  PRIMARY KEY (`info_contest_bigcode`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='기본정보_공모전/수상_대분류';

-- Dumping data for table bongha825.info_contest_bigcode: 0 rows
DELETE FROM `info_contest_bigcode`;
/*!40000 ALTER TABLE `info_contest_bigcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `info_contest_bigcode` ENABLE KEYS */;


-- Dumping structure for table bongha825.info_contest_middlecode
DROP TABLE IF EXISTS `info_contest_middlecode`;
CREATE TABLE IF NOT EXISTS `info_contest_middlecode` (
  `info_contest_middlecode` int(10) NOT NULL AUTO_INCREMENT,
  `info_contest_middlecode_name` varchar(50) NOT NULL,
  PRIMARY KEY (`info_contest_middlecode`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='기본정보_공모전/수상_중분류';

-- Dumping data for table bongha825.info_contest_middlecode: 0 rows
DELETE FROM `info_contest_middlecode`;
/*!40000 ALTER TABLE `info_contest_middlecode` DISABLE KEYS */;
/*!40000 ALTER TABLE `info_contest_middlecode` ENABLE KEYS */;


-- Dumping structure for table bongha825.info_contest_smallcode
DROP TABLE IF EXISTS `info_contest_smallcode`;
CREATE TABLE IF NOT EXISTS `info_contest_smallcode` (
  `info_contest_smallcode` int(10) NOT NULL AUTO_INCREMENT,
  `info_contest_smallcode_name` varchar(50) NOT NULL,
  PRIMARY KEY (`info_contest_smallcode`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='기본정보_공모전/수상_소분류';

-- Dumping data for table bongha825.info_contest_smallcode: 0 rows
DELETE FROM `info_contest_smallcode`;
/*!40000 ALTER TABLE `info_contest_smallcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `info_contest_smallcode` ENABLE KEYS */;


-- Dumping structure for table bongha825.info_dept
DROP TABLE IF EXISTS `info_dept`;
CREATE TABLE IF NOT EXISTS `info_dept` (
  `info_dept_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_dept_bigcode` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_dept_middlecode` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_dept_smallcode` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_school_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`info_dept_code`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='기본정보_학과';

-- Dumping data for table bongha825.info_dept: 9 rows
DELETE FROM `info_dept`;
/*!40000 ALTER TABLE `info_dept` DISABLE KEYS */;
INSERT INTO `info_dept` (`info_dept_code`, `info_dept_bigcode`, `info_dept_middlecode`, `info_dept_smallcode`, `info_school_code`) VALUES
	('info_dept_1', '사회', '사회', '사회', 'info_school_1'),
	('info_dept_2', '사회', '사회', '사회', 'info_school_2'),
	('info_dept_3', '과학', '과학', '과학', 'info_school_1'),
	('info_dept_4', '과학', '과학', '과학', 'info_school_2'),
	('info_dept_5', '과학', '과학', '과학', 'info_school_3'),
	('info_dept_6', '한문', '한문', '한문', 'info_school_1'),
	('info_dept_7', '1', '1', '2', 'info_school_1'),
	('info_dept_8', '1', '1', '3', 'info_school_1'),
	('info_dept_9', '1', '2', '1', 'info_school_1');
/*!40000 ALTER TABLE `info_dept` ENABLE KEYS */;


-- Dumping structure for table bongha825.info_dept_bigcode
DROP TABLE IF EXISTS `info_dept_bigcode`;
CREATE TABLE IF NOT EXISTS `info_dept_bigcode` (
  `info_dept_bigcode` int(10) NOT NULL AUTO_INCREMENT,
  `info_dept_bigcode_name` varchar(50) NOT NULL,
  PRIMARY KEY (`info_dept_bigcode`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='기본정보_학과_대분류';

-- Dumping data for table bongha825.info_dept_bigcode: 0 rows
DELETE FROM `info_dept_bigcode`;
/*!40000 ALTER TABLE `info_dept_bigcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `info_dept_bigcode` ENABLE KEYS */;


-- Dumping structure for table bongha825.info_dept_middlecode
DROP TABLE IF EXISTS `info_dept_middlecode`;
CREATE TABLE IF NOT EXISTS `info_dept_middlecode` (
  `info_dept_middlecode` int(10) NOT NULL AUTO_INCREMENT,
  `info_dept_middlecode_name` varchar(50) NOT NULL,
  PRIMARY KEY (`info_dept_middlecode`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='기본정보_학과_중분류';

-- Dumping data for table bongha825.info_dept_middlecode: 0 rows
DELETE FROM `info_dept_middlecode`;
/*!40000 ALTER TABLE `info_dept_middlecode` DISABLE KEYS */;
/*!40000 ALTER TABLE `info_dept_middlecode` ENABLE KEYS */;


-- Dumping structure for table bongha825.info_dept_smallcode
DROP TABLE IF EXISTS `info_dept_smallcode`;
CREATE TABLE IF NOT EXISTS `info_dept_smallcode` (
  `info_dept_smallcode` int(10) NOT NULL AUTO_INCREMENT,
  `info_dept_smallcode_name` varchar(50) NOT NULL,
  PRIMARY KEY (`info_dept_smallcode`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='기본정보_학과_소분류';

-- Dumping data for table bongha825.info_dept_smallcode: 0 rows
DELETE FROM `info_dept_smallcode`;
/*!40000 ALTER TABLE `info_dept_smallcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `info_dept_smallcode` ENABLE KEYS */;


-- Dumping structure for table bongha825.info_job
DROP TABLE IF EXISTS `info_job`;
CREATE TABLE IF NOT EXISTS `info_job` (
  `info_job_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_job_bigcode` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_job_middlecode` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_job_smallcode` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_job_detailcode` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_job_unitname` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_job_detailinfo` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_job_info` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_job_condition` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_job_applyyear` varchar(50) NOT NULL,
  `info_job_changecount` int(10) NOT NULL,
  `info_job_registerdate` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_job_registername` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`info_job_code`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='기본정보_직업';

-- Dumping data for table bongha825.info_job: 10 rows
DELETE FROM `info_job`;
/*!40000 ALTER TABLE `info_job` DISABLE KEYS */;
INSERT INTO `info_job` (`info_job_code`, `info_job_bigcode`, `info_job_middlecode`, `info_job_smallcode`, `info_job_detailcode`, `info_job_unitname`, `info_job_detailinfo`, `info_job_info`, `info_job_condition`, `info_job_applyyear`, `info_job_changecount`, `info_job_registerdate`, `info_job_registername`) VALUES
	('info_job_1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 0, '1', '1'),
	('info_job_2', '2', '2', '2', '2', '2', '2', '2', '2', '2', 2, '2', '2'),
	('info_job_3', '3', '3', '3', '3', '3', '3', '3', '3', '3', 3, '2016-07-11 21:44:42', '3'),
	('info_job_4', '4', '4', '4', '4', '4', '4', '4', '4', '4', 4, '2016-07-12 11:40:05', '4'),
	('info_job_5', '5', '5', '5', '5', '5', '5', '5', '5', '5', 5, '2016-07-12 12:19:39', '5'),
	('info_job_6', '6', '6', '6', '6', '6', '6', '6', '6', '6', 6, '2016-07-12 12:22:47', '6'),
	('info_job_7', '7', '7', '7', '7', '7', '7', '7', '7', '7', 7, '2016-07-12 12:35:28', '7'),
	('info_job_8', '9', '9', '9', '9', '9', '9', '9', '9', '9', 9, '2016-07-12 15:05:11', '9'),
	('info_job_9', '1', '1', '1', '1', '1', '1', '1', '1', '1', 1, '2016-07-18 12:14:41', '1'),
	('info_job_10', '대분류', '중분류', '소분류', '세분류', '능력단위', '분류정보', '직업정보', '구분', '적용년도', 1, '2016-07-18 12:15:43', '등록자');
/*!40000 ALTER TABLE `info_job` ENABLE KEYS */;


-- Dumping structure for table bongha825.info_jobt
DROP TABLE IF EXISTS `info_jobt`;
CREATE TABLE IF NOT EXISTS `info_jobt` (
  `info_jobt_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_jobt_bigcode` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_jobt_middlecode` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_jobt_smallcode` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_jobt_detailcode` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_jobt_startdate` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_jobt_enddate` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`info_jobt_code`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='기본정보_직업훈련';

-- Dumping data for table bongha825.info_jobt: 4 rows
DELETE FROM `info_jobt`;
/*!40000 ALTER TABLE `info_jobt` DISABLE KEYS */;
INSERT INTO `info_jobt` (`info_jobt_code`, `info_jobt_bigcode`, `info_jobt_middlecode`, `info_jobt_smallcode`, `info_jobt_detailcode`, `info_jobt_startdate`, `info_jobt_enddate`) VALUES
	('1', '1', '1', '1', '1', '1', '1'),
	('info_jobt_2', '1', '1', '1', '1', '1', '1'),
	('info_jobt_3', '2', '2', '2', '2', '2', '2'),
	('info_jobt_4', '8', '8', '8', '8', '8', '8');
/*!40000 ALTER TABLE `info_jobt` ENABLE KEYS */;


-- Dumping structure for table bongha825.info_jobt_bigcode
DROP TABLE IF EXISTS `info_jobt_bigcode`;
CREATE TABLE IF NOT EXISTS `info_jobt_bigcode` (
  `info_jobt_bigcode` int(10) NOT NULL AUTO_INCREMENT,
  `info_jobt_bigcode_name` varchar(50) NOT NULL,
  PRIMARY KEY (`info_jobt_bigcode`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='기본정보_직업훈련_대분류';

-- Dumping data for table bongha825.info_jobt_bigcode: 0 rows
DELETE FROM `info_jobt_bigcode`;
/*!40000 ALTER TABLE `info_jobt_bigcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `info_jobt_bigcode` ENABLE KEYS */;


-- Dumping structure for table bongha825.info_jobt_detailcode
DROP TABLE IF EXISTS `info_jobt_detailcode`;
CREATE TABLE IF NOT EXISTS `info_jobt_detailcode` (
  `info_jobt_detailcode` int(10) NOT NULL AUTO_INCREMENT,
  `info_jobt_detailcode_name` varchar(50) NOT NULL,
  PRIMARY KEY (`info_jobt_detailcode`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='기본정보_직업훈련_세분류';

-- Dumping data for table bongha825.info_jobt_detailcode: 0 rows
DELETE FROM `info_jobt_detailcode`;
/*!40000 ALTER TABLE `info_jobt_detailcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `info_jobt_detailcode` ENABLE KEYS */;


-- Dumping structure for table bongha825.info_jobt_middlecode
DROP TABLE IF EXISTS `info_jobt_middlecode`;
CREATE TABLE IF NOT EXISTS `info_jobt_middlecode` (
  `info_jobt_middlecode` int(10) NOT NULL AUTO_INCREMENT,
  `info_jobt_middlecode_name` varchar(50) NOT NULL,
  PRIMARY KEY (`info_jobt_middlecode`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='기본정보_직업훈련_중분류';

-- Dumping data for table bongha825.info_jobt_middlecode: 0 rows
DELETE FROM `info_jobt_middlecode`;
/*!40000 ALTER TABLE `info_jobt_middlecode` DISABLE KEYS */;
/*!40000 ALTER TABLE `info_jobt_middlecode` ENABLE KEYS */;


-- Dumping structure for table bongha825.info_jobt_smallcode
DROP TABLE IF EXISTS `info_jobt_smallcode`;
CREATE TABLE IF NOT EXISTS `info_jobt_smallcode` (
  `info_jobt_smallcode` int(10) NOT NULL AUTO_INCREMENT,
  `info_jobt_smallcode_name` varchar(50) NOT NULL,
  PRIMARY KEY (`info_jobt_smallcode`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='기본정보_직업훈련_소분류';

-- Dumping data for table bongha825.info_jobt_smallcode: 0 rows
DELETE FROM `info_jobt_smallcode`;
/*!40000 ALTER TABLE `info_jobt_smallcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `info_jobt_smallcode` ENABLE KEYS */;


-- Dumping structure for table bongha825.info_job_bigcode
DROP TABLE IF EXISTS `info_job_bigcode`;
CREATE TABLE IF NOT EXISTS `info_job_bigcode` (
  `info_job_bigcode` int(10) NOT NULL AUTO_INCREMENT,
  `info_job_bigcode_name` varchar(50) NOT NULL,
  PRIMARY KEY (`info_job_bigcode`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='기본정보_직업_대분류';

-- Dumping data for table bongha825.info_job_bigcode: 0 rows
DELETE FROM `info_job_bigcode`;
/*!40000 ALTER TABLE `info_job_bigcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `info_job_bigcode` ENABLE KEYS */;


-- Dumping structure for table bongha825.info_job_detailcode
DROP TABLE IF EXISTS `info_job_detailcode`;
CREATE TABLE IF NOT EXISTS `info_job_detailcode` (
  `info_job_detailcode` int(10) NOT NULL AUTO_INCREMENT,
  `info_job_detailcode_name` varchar(50) NOT NULL,
  PRIMARY KEY (`info_job_detailcode`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='기본정보_직업_세분류';

-- Dumping data for table bongha825.info_job_detailcode: 0 rows
DELETE FROM `info_job_detailcode`;
/*!40000 ALTER TABLE `info_job_detailcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `info_job_detailcode` ENABLE KEYS */;


-- Dumping structure for table bongha825.info_job_middlecode
DROP TABLE IF EXISTS `info_job_middlecode`;
CREATE TABLE IF NOT EXISTS `info_job_middlecode` (
  `info_job_middlecode` int(10) NOT NULL AUTO_INCREMENT,
  `info_job_middlecode_name` varchar(50) NOT NULL,
  PRIMARY KEY (`info_job_middlecode`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='기본정보_직업_중분류';

-- Dumping data for table bongha825.info_job_middlecode: 0 rows
DELETE FROM `info_job_middlecode`;
/*!40000 ALTER TABLE `info_job_middlecode` DISABLE KEYS */;
/*!40000 ALTER TABLE `info_job_middlecode` ENABLE KEYS */;


-- Dumping structure for table bongha825.info_job_smallcode
DROP TABLE IF EXISTS `info_job_smallcode`;
CREATE TABLE IF NOT EXISTS `info_job_smallcode` (
  `info_job_smallcode` int(10) NOT NULL AUTO_INCREMENT,
  `info_job_smallcode_name` varchar(50) NOT NULL,
  PRIMARY KEY (`info_job_smallcode`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='기본정보_직업_소분류';

-- Dumping data for table bongha825.info_job_smallcode: 0 rows
DELETE FROM `info_job_smallcode`;
/*!40000 ALTER TABLE `info_job_smallcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `info_job_smallcode` ENABLE KEYS */;


-- Dumping structure for table bongha825.info_lang
DROP TABLE IF EXISTS `info_lang`;
CREATE TABLE IF NOT EXISTS `info_lang` (
  `info_lang_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_lang_bigcode` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_lang_middlecode` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`info_lang_code`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='기본정보_언어';

-- Dumping data for table bongha825.info_lang: 3 rows
DELETE FROM `info_lang`;
/*!40000 ALTER TABLE `info_lang` DISABLE KEYS */;
INSERT INTO `info_lang` (`info_lang_code`, `info_lang_bigcode`, `info_lang_middlecode`) VALUES
	('info_lang_1', '1', '1'),
	('info_lang_2', '2', '2'),
	('info_lang_3', '3', '3');
/*!40000 ALTER TABLE `info_lang` ENABLE KEYS */;


-- Dumping structure for table bongha825.info_lang_bigcode
DROP TABLE IF EXISTS `info_lang_bigcode`;
CREATE TABLE IF NOT EXISTS `info_lang_bigcode` (
  `info_lang_bigcode` int(10) NOT NULL AUTO_INCREMENT,
  `info_lang_bigcode_name` varchar(50) NOT NULL,
  PRIMARY KEY (`info_lang_bigcode`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='기본정보_언어_대분류';

-- Dumping data for table bongha825.info_lang_bigcode: 0 rows
DELETE FROM `info_lang_bigcode`;
/*!40000 ALTER TABLE `info_lang_bigcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `info_lang_bigcode` ENABLE KEYS */;


-- Dumping structure for table bongha825.info_lang_middlecode
DROP TABLE IF EXISTS `info_lang_middlecode`;
CREATE TABLE IF NOT EXISTS `info_lang_middlecode` (
  `info_lang_middlecode` int(10) NOT NULL AUTO_INCREMENT,
  `info_lang_middlecode_name` varchar(50) NOT NULL,
  PRIMARY KEY (`info_lang_middlecode`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='기본정보_언어_중분류';

-- Dumping data for table bongha825.info_lang_middlecode: 0 rows
DELETE FROM `info_lang_middlecode`;
/*!40000 ALTER TABLE `info_lang_middlecode` DISABLE KEYS */;
/*!40000 ALTER TABLE `info_lang_middlecode` ENABLE KEYS */;


-- Dumping structure for table bongha825.info_member
DROP TABLE IF EXISTS `info_member`;
CREATE TABLE IF NOT EXISTS `info_member` (
  `info_member_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_member_id` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_member_pw` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_member_name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_member_phone` int(11) NOT NULL,
  `info_member_email` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_member_birth` int(11) NOT NULL,
  `info_member_level` int(11) NOT NULL,
  `info_member_joindate` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`info_member_code`),
  UNIQUE KEY `info_member_id` (`info_member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='기본정보_회원';

-- Dumping data for table bongha825.info_member: 115 rows
DELETE FROM `info_member`;
/*!40000 ALTER TABLE `info_member` DISABLE KEYS */;
INSERT INTO `info_member` (`info_member_code`, `info_member_id`, `info_member_pw`, `info_member_name`, `info_member_phone`, `info_member_email`, `info_member_birth`, `info_member_level`, `info_member_joindate`) VALUES
	('info_member_1', 'admin', '1234', 'bongha', 1011111111, 'qhdgk825@naver.com', 890825, 1, '2016-07-11 10:03:50'),
	('info_member_2', 'admin1', '1234', 'bongha', 1022222222, 'qhdgk825@naver.com', 890825, 1, '2016-07-11 10:10:57'),
	('info_member_3', 'admin2', '1234', 'kbj', 1033333333, 'kbj@gmail.com', 890825, 1, '2016-07-11 10:13:06'),
	('info_member_4', 'admin4', '1234', 'bj', 1012345678, 'bj@gmail.com', 660101, 2, '2016-07-11 10:39:24'),
	('info_member_5', 'id0', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 14:39:47'),
	('info_member_6', 'id6', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 14:39:55'),
	('info_member_7', 'id7', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 14:39:59'),
	('info_member_8', 'id8', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 14:40:05'),
	('info_member_9', 'id9', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 14:40:09'),
	('info_member_10', 'id10', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 14:40:13'),
	('info_member_11', 'id11', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 14:40:16'),
	('info_member_12', 'id12', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 14:40:19'),
	('info_member_13', 'id13', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 14:40:22'),
	('info_member_14', 'id14', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 14:40:26'),
	('info_member_15', 'id15', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 14:40:29'),
	('info_member_16', 'id16', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 14:40:32'),
	('info_member_17', 'id17', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 14:40:36'),
	('info_member_18', 'id18', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 14:40:39'),
	('info_member_19', 'id19', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 14:40:43'),
	('info_member_20', 'id20', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 14:40:55'),
	('info_member_21', 'id21', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 14:40:59'),
	('info_member_22', 'id22', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 14:41:02'),
	('info_member_23', 'id23', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 14:41:05'),
	('info_member_24', 'id24', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 14:41:07'),
	('info_member_25', 'id25', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 14:41:11'),
	('info_member_26', 'id26', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 14:41:15'),
	('info_member_27', 'id27', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 14:41:19'),
	('info_member_28', 'id28', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 14:41:23'),
	('info_member_29', 'id29', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 14:41:27'),
	('info_member_30', 'id30', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 14:41:34'),
	('info_member_31', 'id31', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 14:41:39'),
	('info_member_32', 'id32', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 14:41:42'),
	('info_member_33', 'id33', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 14:41:45'),
	('info_member_34', 'id34', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 14:41:49'),
	('info_member_35', 'id35', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 14:41:51'),
	('info_member_36', 'id36', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 14:41:55'),
	('info_member_37', 'id37', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 14:41:58'),
	('info_member_38', 'id38', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 14:42:01'),
	('info_member_39', 'id39', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 14:42:05'),
	('info_member_40', 'id40', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 14:42:09'),
	('info_member_41', 'id41', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 14:42:12'),
	('info_member_42', 'id42', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 14:42:14'),
	('info_member_43', 'id43', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 14:42:17'),
	('info_member_44', 'id44', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 14:42:20'),
	('info_member_45', 'id45', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 14:42:23'),
	('info_member_46', 'id46', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 14:42:27'),
	('info_member_47', 'id47', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 14:42:30'),
	('info_member_48', 'id48', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 14:42:35'),
	('info_member_49', 'id49', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 14:42:39'),
	('info_member_50', 'id50', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 14:42:43'),
	('info_member_51', 'id51', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 14:42:50'),
	('info_member_52', 'id52', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 14:42:52'),
	('info_member_53', 'id53', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 14:42:55'),
	('info_member_54', 'id54', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 14:42:58'),
	('info_member_55', 'id55', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 14:43:01'),
	('info_member_56', 'id56', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 14:43:04'),
	('info_member_101', 'id101', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 17:21:02'),
	('info_member_100', 'id100', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 16:42:21'),
	('info_member_99', 'id99', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 16:42:14'),
	('info_member_98', 'id98', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 16:42:09'),
	('info_member_97', 'id97', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 16:42:06'),
	('info_member_96', 'id96', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 16:42:02'),
	('info_member_95', 'id95', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 16:41:59'),
	('info_member_94', 'id94', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 16:41:55'),
	('info_member_93', 'id93', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 16:41:52'),
	('info_member_92', 'id92', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 16:41:49'),
	('info_member_91', 'id91', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 16:41:46'),
	('info_member_90', 'id90', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 16:41:43'),
	('info_member_89', 'id89', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 16:41:37'),
	('info_member_88', 'id88', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 16:41:33'),
	('info_member_87', 'id87', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 16:41:30'),
	('info_member_86', 'id86', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 16:41:27'),
	('info_member_85', 'id85', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 16:41:20'),
	('info_member_84', 'id84', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 16:40:30'),
	('info_member_83', 'id83', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 16:40:21'),
	('info_member_82', 'id82', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 16:40:18'),
	('info_member_81', 'id81', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 16:40:16'),
	('info_member_80', 'id80', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 16:40:13'),
	('info_member_79', 'id79', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 16:40:09'),
	('info_member_78', 'id78', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 16:40:05'),
	('info_member_77', 'id77', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 16:40:02'),
	('info_member_76', 'id76', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 16:39:59'),
	('info_member_75', 'id75', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 16:39:55'),
	('info_member_74', 'id74', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 16:39:52'),
	('info_member_73', 'id73', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 16:39:49'),
	('info_member_72', 'id72', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 16:39:46'),
	('info_member_71', 'id71', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 16:39:44'),
	('info_member_70', 'id70', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 16:39:41'),
	('info_member_69', 'id69', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 16:39:36'),
	('info_member_68', 'id68', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 16:39:32'),
	('info_member_67', 'id67', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 16:39:29'),
	('info_member_66', 'id66', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 16:39:26'),
	('info_member_65', 'id65', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 16:39:23'),
	('info_member_64', 'id64', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 16:39:20'),
	('info_member_63', 'id63', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 16:39:17'),
	('info_member_62', 'id62', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 16:39:14'),
	('info_member_61', 'id61', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 16:39:11'),
	('info_member_60', 'id60', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 16:39:07'),
	('info_member_59', 'id59', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 16:39:03'),
	('info_member_58', 'id58', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 16:38:52'),
	('info_member_57', 'id57', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 16:38:48'),
	('info_member_102', 'id102', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 17:21:05'),
	('info_member_103', 'id103', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 17:21:08'),
	('info_member_104', 'id104', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 17:21:11'),
	('info_member_105', 'id105', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 17:21:14'),
	('info_member_106', 'id106', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 17:21:17'),
	('info_member_107', 'id107', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 17:21:21'),
	('info_member_108', 'id108', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 17:21:24'),
	('info_member_109', 'id109', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 17:21:27'),
	('info_member_110', 'id110', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 17:21:37'),
	('info_member_111', 'id111', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 17:21:40'),
	('info_member_112', 'id112', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 17:21:44'),
	('info_member_113', 'id113', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 17:21:47'),
	('info_member_114', 'id114', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 17:21:50'),
	('info_member_115', 'id115', '1234', 'name', 0, 'email', 0, 0, '2016-07-12 17:21:53');
/*!40000 ALTER TABLE `info_member` ENABLE KEYS */;


-- Dumping structure for table bongha825.info_school
DROP TABLE IF EXISTS `info_school`;
CREATE TABLE IF NOT EXISTS `info_school` (
  `info_school_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_school_bigcode` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_school_middlecode` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_school_smallcode` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`info_school_code`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='기본정보_학교';

-- Dumping data for table bongha825.info_school: 27 rows
DELETE FROM `info_school`;
/*!40000 ALTER TABLE `info_school` DISABLE KEYS */;
INSERT INTO `info_school` (`info_school_code`, `info_school_bigcode`, `info_school_middlecode`, `info_school_smallcode`) VALUES
	('info_school_1', '1', '1', '1'),
	('info_school_2', '1', '1', '2'),
	('info_school_3', '1', '1', '3'),
	('info_school_4', '1', '2', '1'),
	('info_school_5', '1', '2', '2'),
	('info_school_6', '1', '2', '3'),
	('info_school_7', '1', '3', '1'),
	('info_school_8', '1', '3', '2'),
	('info_school_9', '1', '3', '3'),
	('info_school_10', '2', '1', '1'),
	('info_school_11', '2', '1', '2'),
	('info_school_12', '2', '1', '3'),
	('info_school_13', '2', '2', '1'),
	('info_school_14', '2', '2', '2'),
	('info_school_15', '2', '2', '3'),
	('info_school_16', '2', '3', '1'),
	('info_school_17', '2', '3', '2'),
	('info_school_18', '2', '3', '3'),
	('info_school_19', '3', '1', '1'),
	('info_school_20', '3', '1', '2'),
	('info_school_21', '3', '1', '3'),
	('info_school_22', '3', '2', '1'),
	('info_school_23', '3', '2', '2'),
	('info_school_24', '3', '2', '3'),
	('info_school_25', '3', '3', '1'),
	('info_school_26', '3', '3', '2'),
	('info_school_27', '3', '3', '3');
/*!40000 ALTER TABLE `info_school` ENABLE KEYS */;


-- Dumping structure for table bongha825.info_school_bigcode
DROP TABLE IF EXISTS `info_school_bigcode`;
CREATE TABLE IF NOT EXISTS `info_school_bigcode` (
  `info_school_bigcode` int(10) NOT NULL AUTO_INCREMENT,
  `info_school_bigcode_name` varchar(50) NOT NULL,
  PRIMARY KEY (`info_school_bigcode`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='기본정보_학교_대분류';

-- Dumping data for table bongha825.info_school_bigcode: 0 rows
DELETE FROM `info_school_bigcode`;
/*!40000 ALTER TABLE `info_school_bigcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `info_school_bigcode` ENABLE KEYS */;


-- Dumping structure for table bongha825.info_school_middlecode
DROP TABLE IF EXISTS `info_school_middlecode`;
CREATE TABLE IF NOT EXISTS `info_school_middlecode` (
  `info_school_middlecode` int(10) NOT NULL AUTO_INCREMENT,
  `info_school_middlecode_name` varchar(50) NOT NULL,
  PRIMARY KEY (`info_school_middlecode`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='기본정보_학교_중분류';

-- Dumping data for table bongha825.info_school_middlecode: 0 rows
DELETE FROM `info_school_middlecode`;
/*!40000 ALTER TABLE `info_school_middlecode` DISABLE KEYS */;
/*!40000 ALTER TABLE `info_school_middlecode` ENABLE KEYS */;


-- Dumping structure for table bongha825.info_school_smallcode
DROP TABLE IF EXISTS `info_school_smallcode`;
CREATE TABLE IF NOT EXISTS `info_school_smallcode` (
  `info_school_smallcode` int(10) NOT NULL AUTO_INCREMENT,
  `info_school_smallcode_name` varchar(50) NOT NULL,
  PRIMARY KEY (`info_school_smallcode`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='기본정보_학교_소분류';

-- Dumping data for table bongha825.info_school_smallcode: 0 rows
DELETE FROM `info_school_smallcode`;
/*!40000 ALTER TABLE `info_school_smallcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `info_school_smallcode` ENABLE KEYS */;


-- Dumping structure for table bongha825.info_studyab
DROP TABLE IF EXISTS `info_studyab`;
CREATE TABLE IF NOT EXISTS `info_studyab` (
  `info_studyab_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_studyab_bigcode` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_studyab_middlecode` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_studyab_smallcode` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`info_studyab_code`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='기본정보_어학연수';

-- Dumping data for table bongha825.info_studyab: 4 rows
DELETE FROM `info_studyab`;
/*!40000 ALTER TABLE `info_studyab` DISABLE KEYS */;
INSERT INTO `info_studyab` (`info_studyab_code`, `info_studyab_bigcode`, `info_studyab_middlecode`, `info_studyab_smallcode`) VALUES
	('info_studyab_1', '1', '1', '1'),
	('info_studyab_2', '1', '1', '1'),
	('info_studyab_3', '2', '2', '2'),
	('info_studyab_4', '3', '3', '3');
/*!40000 ALTER TABLE `info_studyab` ENABLE KEYS */;


-- Dumping structure for table bongha825.info_studyab_bigcode
DROP TABLE IF EXISTS `info_studyab_bigcode`;
CREATE TABLE IF NOT EXISTS `info_studyab_bigcode` (
  `info_studyab_bigcode` int(10) NOT NULL AUTO_INCREMENT,
  `info_studyab_bigcode_name` varchar(50) NOT NULL,
  PRIMARY KEY (`info_studyab_bigcode`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='기본정보_어학연수_대분류';

-- Dumping data for table bongha825.info_studyab_bigcode: 0 rows
DELETE FROM `info_studyab_bigcode`;
/*!40000 ALTER TABLE `info_studyab_bigcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `info_studyab_bigcode` ENABLE KEYS */;


-- Dumping structure for table bongha825.info_studyab_middlecode
DROP TABLE IF EXISTS `info_studyab_middlecode`;
CREATE TABLE IF NOT EXISTS `info_studyab_middlecode` (
  `info_studyab_middlecode` int(10) NOT NULL AUTO_INCREMENT,
  `info_studyab_middlecode_name` varchar(50) NOT NULL,
  PRIMARY KEY (`info_studyab_middlecode`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='기본정보_어학연수_중분류';

-- Dumping data for table bongha825.info_studyab_middlecode: 0 rows
DELETE FROM `info_studyab_middlecode`;
/*!40000 ALTER TABLE `info_studyab_middlecode` DISABLE KEYS */;
/*!40000 ALTER TABLE `info_studyab_middlecode` ENABLE KEYS */;


-- Dumping structure for table bongha825.info_studyab_smallcode
DROP TABLE IF EXISTS `info_studyab_smallcode`;
CREATE TABLE IF NOT EXISTS `info_studyab_smallcode` (
  `info_studyab_smallcode` int(10) NOT NULL AUTO_INCREMENT,
  `info_studyab_smallcode_name` varchar(50) NOT NULL,
  PRIMARY KEY (`info_studyab_smallcode`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='기본정보_어학연수_소분류';

-- Dumping data for table bongha825.info_studyab_smallcode: 0 rows
DELETE FROM `info_studyab_smallcode`;
/*!40000 ALTER TABLE `info_studyab_smallcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `info_studyab_smallcode` ENABLE KEYS */;


-- Dumping structure for table bongha825.info_volun
DROP TABLE IF EXISTS `info_volun`;
CREATE TABLE IF NOT EXISTS `info_volun` (
  `info_volun_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_volun_bigcode` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_volun_middlecode` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_volun_smallcode` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_volun_name` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`info_volun_code`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='기본정보_봉사활동\r\n';

-- Dumping data for table bongha825.info_volun: 6 rows
DELETE FROM `info_volun`;
/*!40000 ALTER TABLE `info_volun` DISABLE KEYS */;
INSERT INTO `info_volun` (`info_volun_code`, `info_volun_bigcode`, `info_volun_middlecode`, `info_volun_smallcode`, `info_volun_name`) VALUES
	('info_volun_1', '2', '2', '2', '봉사활동2'),
	('info_volun_2', '1', '1', '1', '봉사활동1'),
	('info_volun_3', '3', '2', '1', '봉사활동3'),
	('info_volun_4', '4', '1', '1', '봉사활동4'),
	('info_volun_5', '3', '3', '3', '봉사'),
	('info_volun_6', '1', '1', '1', '흐히');
/*!40000 ALTER TABLE `info_volun` ENABLE KEYS */;


-- Dumping structure for table bongha825.info_volun_bigcode
DROP TABLE IF EXISTS `info_volun_bigcode`;
CREATE TABLE IF NOT EXISTS `info_volun_bigcode` (
  `info_volun_bigcode` int(10) NOT NULL AUTO_INCREMENT,
  `info_volun_bigcode_name` varchar(50) NOT NULL,
  PRIMARY KEY (`info_volun_bigcode`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='기본정보_봉사활동_대분류';

-- Dumping data for table bongha825.info_volun_bigcode: 0 rows
DELETE FROM `info_volun_bigcode`;
/*!40000 ALTER TABLE `info_volun_bigcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `info_volun_bigcode` ENABLE KEYS */;


-- Dumping structure for table bongha825.info_volun_middlecode
DROP TABLE IF EXISTS `info_volun_middlecode`;
CREATE TABLE IF NOT EXISTS `info_volun_middlecode` (
  `info_volun_middlecode` int(10) NOT NULL AUTO_INCREMENT,
  `info_volun_middlecode_name` varchar(50) NOT NULL,
  PRIMARY KEY (`info_volun_middlecode`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='기본정보_봉사활동_중분류';

-- Dumping data for table bongha825.info_volun_middlecode: 0 rows
DELETE FROM `info_volun_middlecode`;
/*!40000 ALTER TABLE `info_volun_middlecode` DISABLE KEYS */;
/*!40000 ALTER TABLE `info_volun_middlecode` ENABLE KEYS */;


-- Dumping structure for table bongha825.info_volun_smallcode
DROP TABLE IF EXISTS `info_volun_smallcode`;
CREATE TABLE IF NOT EXISTS `info_volun_smallcode` (
  `info_volun_smallcode` int(10) NOT NULL AUTO_INCREMENT,
  `info_volun_smallcode_name` varchar(50) NOT NULL,
  PRIMARY KEY (`info_volun_smallcode`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='기본정보_봉사활동_소분류';

-- Dumping data for table bongha825.info_volun_smallcode: 0 rows
DELETE FROM `info_volun_smallcode`;
/*!40000 ALTER TABLE `info_volun_smallcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `info_volun_smallcode` ENABLE KEYS */;


-- Dumping structure for table bongha825.plan_book
DROP TABLE IF EXISTS `plan_book`;
CREATE TABLE IF NOT EXISTS `plan_book` (
  `plan_book_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_unite_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_member_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rec_book_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_book_condition` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_book_content` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_book_count` int(11) NOT NULL,
  `plan_book_registerdate` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_book_startdate` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_book_enddate` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`plan_book_code`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='계획_도서';

-- Dumping data for table bongha825.plan_book: 0 rows
DELETE FROM `plan_book`;
/*!40000 ALTER TABLE `plan_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `plan_book` ENABLE KEYS */;


-- Dumping structure for table bongha825.plan_cert
DROP TABLE IF EXISTS `plan_cert`;
CREATE TABLE IF NOT EXISTS `plan_cert` (
  `plan_cert_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_unite_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_member_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rec_cert_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_cert_condition` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_cert_content` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_cert_count` int(11) NOT NULL,
  `plan_cert_registerdate` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_cert_startdate` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_cert_enddate` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`plan_cert_code`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='계획_자격증';

-- Dumping data for table bongha825.plan_cert: 0 rows
DELETE FROM `plan_cert`;
/*!40000 ALTER TABLE `plan_cert` DISABLE KEYS */;
/*!40000 ALTER TABLE `plan_cert` ENABLE KEYS */;


-- Dumping structure for table bongha825.plan_contest
DROP TABLE IF EXISTS `plan_contest`;
CREATE TABLE IF NOT EXISTS `plan_contest` (
  `plan_contest_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_unite_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_member_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rec_contest_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_contest_condition` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_contest_content` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_contest_count` int(11) NOT NULL,
  `plan_contest_registerdate` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_contest_startdate` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_contest_enddate` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`plan_contest_code`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='계획_공모전/수상';

-- Dumping data for table bongha825.plan_contest: 0 rows
DELETE FROM `plan_contest`;
/*!40000 ALTER TABLE `plan_contest` DISABLE KEYS */;
/*!40000 ALTER TABLE `plan_contest` ENABLE KEYS */;


-- Dumping structure for table bongha825.plan_dept
DROP TABLE IF EXISTS `plan_dept`;
CREATE TABLE IF NOT EXISTS `plan_dept` (
  `plan_dept_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_unite_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_member_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rec_dept_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_dept_condition` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_dept_content` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_dept_count` int(11) NOT NULL,
  `plan_dept_registerdate` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_dept_startdate` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_dept_enddate` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`plan_dept_code`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='계획_학과';

-- Dumping data for table bongha825.plan_dept: 0 rows
DELETE FROM `plan_dept`;
/*!40000 ALTER TABLE `plan_dept` DISABLE KEYS */;
/*!40000 ALTER TABLE `plan_dept` ENABLE KEYS */;


-- Dumping structure for table bongha825.plan_jobt
DROP TABLE IF EXISTS `plan_jobt`;
CREATE TABLE IF NOT EXISTS `plan_jobt` (
  `plan_jobt_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_unite_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_member_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rec_jobt_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_jobt_condition` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_jobt_content` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_jobt_count` int(11) NOT NULL,
  `plan_jobt_registerdate` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_jobt_startdate` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_jobt_enddate` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`plan_jobt_code`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='계획_직업훈련';

-- Dumping data for table bongha825.plan_jobt: 0 rows
DELETE FROM `plan_jobt`;
/*!40000 ALTER TABLE `plan_jobt` DISABLE KEYS */;
/*!40000 ALTER TABLE `plan_jobt` ENABLE KEYS */;


-- Dumping structure for table bongha825.plan_lang
DROP TABLE IF EXISTS `plan_lang`;
CREATE TABLE IF NOT EXISTS `plan_lang` (
  `plan_lang_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `paln_unite_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_member_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rec_lang_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_lang_condition` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_lang_content` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_lang_count` int(11) NOT NULL,
  `plan_lang_registerdate` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_lang_startdate` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_lang_enddate` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`plan_lang_code`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='계획_언어';

-- Dumping data for table bongha825.plan_lang: 0 rows
DELETE FROM `plan_lang`;
/*!40000 ALTER TABLE `plan_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `plan_lang` ENABLE KEYS */;


-- Dumping structure for table bongha825.plan_mento
DROP TABLE IF EXISTS `plan_mento`;
CREATE TABLE IF NOT EXISTS `plan_mento` (
  `plan_mento_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_mento_id` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_mento_checkcondition` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_mento_checkcontent` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`plan_mento_code`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='계획_멘토';

-- Dumping data for table bongha825.plan_mento: 0 rows
DELETE FROM `plan_mento`;
/*!40000 ALTER TABLE `plan_mento` DISABLE KEYS */;
/*!40000 ALTER TABLE `plan_mento` ENABLE KEYS */;


-- Dumping structure for table bongha825.plan_school
DROP TABLE IF EXISTS `plan_school`;
CREATE TABLE IF NOT EXISTS `plan_school` (
  `plan_school_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_unite_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_member_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rec_school_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_school_condition` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_school_content` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_school_count` int(10) NOT NULL,
  `plan_school_registerdate` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_school_startdate` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_school_enddate` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`plan_school_code`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='계획_학교';

-- Dumping data for table bongha825.plan_school: 0 rows
DELETE FROM `plan_school`;
/*!40000 ALTER TABLE `plan_school` DISABLE KEYS */;
/*!40000 ALTER TABLE `plan_school` ENABLE KEYS */;


-- Dumping structure for table bongha825.plan_studyab
DROP TABLE IF EXISTS `plan_studyab`;
CREATE TABLE IF NOT EXISTS `plan_studyab` (
  `plan_studyab_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_unite_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_member_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rec_studyab_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_studyab_condition` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_studyab_content` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_studyab_count` int(11) NOT NULL,
  `plan_studyab_registerdate` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_studyab_startdate` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_studyab_enddate` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`plan_studyab_code`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='계획_어학연수';

-- Dumping data for table bongha825.plan_studyab: 0 rows
DELETE FROM `plan_studyab`;
/*!40000 ALTER TABLE `plan_studyab` DISABLE KEYS */;
/*!40000 ALTER TABLE `plan_studyab` ENABLE KEYS */;


-- Dumping structure for table bongha825.plan_unite
DROP TABLE IF EXISTS `plan_unite`;
CREATE TABLE IF NOT EXISTS `plan_unite` (
  `plan_unite_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_member_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_unite_title` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_unite_content` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_unite_registerdate` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_job_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_mento_id` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`plan_unite_code`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='계획_통합';

-- Dumping data for table bongha825.plan_unite: 0 rows
DELETE FROM `plan_unite`;
/*!40000 ALTER TABLE `plan_unite` DISABLE KEYS */;
/*!40000 ALTER TABLE `plan_unite` ENABLE KEYS */;


-- Dumping structure for table bongha825.plan_volun
DROP TABLE IF EXISTS `plan_volun`;
CREATE TABLE IF NOT EXISTS `plan_volun` (
  `plan_volun_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_unite_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_member_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rec_volun_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_volun_condition` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_volun_content` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_volun_count` int(10) NOT NULL,
  `plan_volun_registerdate` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_volun_startdate` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plan_volun_enddate` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`plan_volun_code`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='계획_봉사활동';

-- Dumping data for table bongha825.plan_volun: 0 rows
DELETE FROM `plan_volun`;
/*!40000 ALTER TABLE `plan_volun` DISABLE KEYS */;
/*!40000 ALTER TABLE `plan_volun` ENABLE KEYS */;


-- Dumping structure for table bongha825.rec_book
DROP TABLE IF EXISTS `rec_book`;
CREATE TABLE IF NOT EXISTS `rec_book` (
  `rec_book_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rec_unite_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_book_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rec_book_reason` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rec_book_content` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rec_book_condition` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rec_book_registerdate` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`rec_book_code`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='추천_도서';

-- Dumping data for table bongha825.rec_book: 0 rows
DELETE FROM `rec_book`;
/*!40000 ALTER TABLE `rec_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `rec_book` ENABLE KEYS */;


-- Dumping structure for table bongha825.rec_cert
DROP TABLE IF EXISTS `rec_cert`;
CREATE TABLE IF NOT EXISTS `rec_cert` (
  `rec_cert_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rec_unite_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_cert_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rec_cert_reason` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rec_cert_content` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rec_cert_condition` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rec_cert_registerdate` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`rec_cert_code`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='추천_자격증';

-- Dumping data for table bongha825.rec_cert: 0 rows
DELETE FROM `rec_cert`;
/*!40000 ALTER TABLE `rec_cert` DISABLE KEYS */;
/*!40000 ALTER TABLE `rec_cert` ENABLE KEYS */;


-- Dumping structure for table bongha825.rec_contest
DROP TABLE IF EXISTS `rec_contest`;
CREATE TABLE IF NOT EXISTS `rec_contest` (
  `rec_contest_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rec_unite_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_contest_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rec_contest_reason` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rec_contest_content` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rec_contest_condition` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rec_contest_registerdate` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`rec_contest_code`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='추천_공모전/수상';

-- Dumping data for table bongha825.rec_contest: 0 rows
DELETE FROM `rec_contest`;
/*!40000 ALTER TABLE `rec_contest` DISABLE KEYS */;
/*!40000 ALTER TABLE `rec_contest` ENABLE KEYS */;


-- Dumping structure for table bongha825.rec_dept
DROP TABLE IF EXISTS `rec_dept`;
CREATE TABLE IF NOT EXISTS `rec_dept` (
  `rec_dept_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rec_unite_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_dept_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rec_dept_reason` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rec_dept_content` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rec_dept_condition` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rec_dept_registerdate` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`rec_dept_code`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='추천_학과';

-- Dumping data for table bongha825.rec_dept: 0 rows
DELETE FROM `rec_dept`;
/*!40000 ALTER TABLE `rec_dept` DISABLE KEYS */;
/*!40000 ALTER TABLE `rec_dept` ENABLE KEYS */;


-- Dumping structure for table bongha825.rec_jobt
DROP TABLE IF EXISTS `rec_jobt`;
CREATE TABLE IF NOT EXISTS `rec_jobt` (
  `rec_jobt_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rec_unite_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_jobt_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rec_jobt_reason` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rec_jobt_content` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rec_jobt_condition` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rec_jobt_registerdate` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`rec_jobt_code`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='추천_직업훈련';

-- Dumping data for table bongha825.rec_jobt: 0 rows
DELETE FROM `rec_jobt`;
/*!40000 ALTER TABLE `rec_jobt` DISABLE KEYS */;
/*!40000 ALTER TABLE `rec_jobt` ENABLE KEYS */;


-- Dumping structure for table bongha825.rec_lang
DROP TABLE IF EXISTS `rec_lang`;
CREATE TABLE IF NOT EXISTS `rec_lang` (
  `rec_lang_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rec_unite_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_lang_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rec_lang_score` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rec_lang_reason` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rec_lang_content` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rec_lang_condition` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rec_lang_registerdate` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`rec_lang_code`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='추천_언어';

-- Dumping data for table bongha825.rec_lang: 0 rows
DELETE FROM `rec_lang`;
/*!40000 ALTER TABLE `rec_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `rec_lang` ENABLE KEYS */;


-- Dumping structure for table bongha825.rec_school
DROP TABLE IF EXISTS `rec_school`;
CREATE TABLE IF NOT EXISTS `rec_school` (
  `rec_school_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rec_unite_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_school_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rec_school_reason` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rec_school_content` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rec_school_condition` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rec_school_registerdate` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`rec_school_code`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='추천_학교';

-- Dumping data for table bongha825.rec_school: 0 rows
DELETE FROM `rec_school`;
/*!40000 ALTER TABLE `rec_school` DISABLE KEYS */;
/*!40000 ALTER TABLE `rec_school` ENABLE KEYS */;


-- Dumping structure for table bongha825.rec_studyab
DROP TABLE IF EXISTS `rec_studyab`;
CREATE TABLE IF NOT EXISTS `rec_studyab` (
  `rec_studyab_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rec_unite_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_studyab_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rec_studyab_reason` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rec_studyab_content` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rec_studyab_condition` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rec_studyab_registerdate` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`rec_studyab_code`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='추천_어학연수';

-- Dumping data for table bongha825.rec_studyab: 0 rows
DELETE FROM `rec_studyab`;
/*!40000 ALTER TABLE `rec_studyab` DISABLE KEYS */;
/*!40000 ALTER TABLE `rec_studyab` ENABLE KEYS */;


-- Dumping structure for table bongha825.rec_unite
DROP TABLE IF EXISTS `rec_unite`;
CREATE TABLE IF NOT EXISTS `rec_unite` (
  `rec_unite_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_member_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_job_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rec_unite_title` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rec_unite_content` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rec_unite_registerdate` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`rec_unite_code`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='추천_통합';

-- Dumping data for table bongha825.rec_unite: 0 rows
DELETE FROM `rec_unite`;
/*!40000 ALTER TABLE `rec_unite` DISABLE KEYS */;
/*!40000 ALTER TABLE `rec_unite` ENABLE KEYS */;


-- Dumping structure for table bongha825.rec_volun
DROP TABLE IF EXISTS `rec_volun`;
CREATE TABLE IF NOT EXISTS `rec_volun` (
  `rec_volun_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rec_unite_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `info_volun_code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rec_volun_reason` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rec_volun_content` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rec_volun_condition` varchar(50) CHARACTER SET utf8 NOT NULL,
  `rec_volun_registerdate` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`rec_volun_code`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr COMMENT='추천_봉사활동';

-- Dumping data for table bongha825.rec_volun: 0 rows
DELETE FROM `rec_volun`;
/*!40000 ALTER TABLE `rec_volun` DISABLE KEYS */;
/*!40000 ALTER TABLE `rec_volun` ENABLE KEYS */;


-- Dumping structure for table bongha825.reply
DROP TABLE IF EXISTS `reply`;
CREATE TABLE IF NOT EXISTS `reply` (
  `reply_no` int(10) NOT NULL AUTO_INCREMENT,
  `article_no` int(10) NOT NULL DEFAULT '0',
  `reply_content` varchar(250) NOT NULL,
  `reply_writer` varchar(50) NOT NULL,
  `reply_pw` varchar(50) NOT NULL,
  PRIMARY KEY (`reply_no`),
  KEY `FK_comment_article` (`article_no`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=euckr;

-- Dumping data for table bongha825.reply: 10 rows
DELETE FROM `reply`;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
INSERT INTO `reply` (`reply_no`, `article_no`, `reply_content`, `reply_writer`, `reply_pw`) VALUES
	(1, 10, '1234', '1234', '1234'),
	(2, 10, '123', '123', '123'),
	(3, 10, '12', '12', '12'),
	(4, 10, '', '', ''),
	(7, 25, '댓글', '되겠지', '1234'),
	(8, 30, 'ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ', 'ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ', '123'),
	(9, 34, 'ㅎㄷㄷ', '김성겸', '2314134'),
	(11, 34, '봉하쌔네', '감자참', '1212'),
	(12, 34, '누구야', '주인장', '1234'),
	(13, 29, '땡큐', '황봉하', '1234');
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;


-- Dumping structure for table bongha825.user
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_no` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL,
  `user_pw` varchar(50) NOT NULL,
  PRIMARY KEY (`user_no`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=euckr;

-- Dumping data for table bongha825.user: 51 rows
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`user_no`, `user_id`, `user_pw`) VALUES
	(1, 'id001', 'pw001'),
	(2, 'id002', 'pw002'),
	(3, 'id003', 'pw003'),
	(4, 'id004', 'pw004'),
	(5, 'id005', 'pw005'),
	(6, 'id006', 'pw006'),
	(7, 'id007', 'pw007'),
	(8, 'id008', 'pw008'),
	(9, 'id009', 'pw009'),
	(10, 'id010', 'pw010'),
	(11, 'id011', 'pw011'),
	(12, 'id012', 'pw012'),
	(13, 'id013', 'pw013'),
	(14, 'id014', 'pw014'),
	(15, 'id015', 'pw015'),
	(16, 'id016', 'pw016'),
	(17, 'id017', 'pw017'),
	(18, 'id018', 'pw018'),
	(19, 'id019', 'pw019'),
	(20, 'id020', 'pw020'),
	(21, 'id021', 'pw021'),
	(22, 'id022', 'pw022'),
	(23, 'id023', 'pw023'),
	(24, 'id024', 'pw024'),
	(25, 'id025', 'pw025'),
	(26, 'id026', 'pw026'),
	(27, 'id027', 'pw027'),
	(28, 'id028', 'pw028'),
	(29, 'id029', 'pw029'),
	(30, 'id030', 'pw030'),
	(31, 'id031', 'pw031'),
	(32, 'id032', 'pw032'),
	(33, 'id033', 'pw033'),
	(34, 'id034', 'pw034'),
	(35, 'id035', 'pw035'),
	(36, 'id036', 'pw036'),
	(37, 'id037', 'pw037'),
	(38, 'id038', 'pw038'),
	(39, 'id039', 'pw039'),
	(40, 'id040', 'pw040'),
	(41, 'id041', 'pw041'),
	(42, 'id042', 'pw042'),
	(43, 'id043', 'pw043'),
	(44, 'id044', 'pw044'),
	(45, 'id045', 'pw045'),
	(46, 'id046', 'pw046'),
	(47, 'id047', 'pw047'),
	(48, 'id048', 'pw048'),
	(49, 'id049', 'pw049'),
	(50, 'id050', 'pw050'),
	(53, 'test3', '1234');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
