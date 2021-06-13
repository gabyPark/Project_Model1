CREATE DATABASE  IF NOT EXISTS `jspdb` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `jspdb`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: jspdb
-- ------------------------------------------------------
-- Server version	5.7.32-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `gb_board`
--

DROP TABLE IF EXISTS `gb_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gb_board` (
  `num` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `pass` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `content` varchar(5000) COLLATE utf8_unicode_ci NOT NULL,
  `readcount` int(11) DEFAULT NULL,
  `re_ref` int(11) DEFAULT NULL,
  `re_lev` int(11) DEFAULT NULL,
  `re_seq` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `ip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gb_board`
--

LOCK TABLES `gb_board` WRITE;
/*!40000 ALTER TABLE `gb_board` DISABLE KEYS */;
INSERT INTO `gb_board` VALUES (1,'운영자','1','[공지] 홈페이지 이용안내','잘쓰세요',2,1,0,0,'2021-01-21',NULL,NULL),(2,'운영자','2','[공지] 게시글 작성 방법 안내','잘쓰세요',2,2,0,0,'2021-01-21',NULL,NULL),(3,'운영자','3','자주 묻는 질문 정리','Q & A',7,3,0,0,'2021-01-21',NULL,NULL);
/*!40000 ALTER TABLE `gb_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gb_board_mate`
--

DROP TABLE IF EXISTS `gb_board_mate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gb_board_mate` (
  `num` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `pass` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `content` varchar(5000) COLLATE utf8_unicode_ci NOT NULL,
  `readcount` int(11) DEFAULT NULL,
  `re_ref` int(11) DEFAULT NULL,
  `re_lev` int(11) DEFAULT NULL,
  `re_seq` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `ip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gb_board_mate`
--

LOCK TABLES `gb_board_mate` WRITE;
/*!40000 ALTER TABLE `gb_board_mate` DISABLE KEYS */;
INSERT INTO `gb_board_mate` VALUES (1,'찬이맘','1','푸들 찬이에요~','노견이지만 아직 에너지 넘친답니당\r\n같이 놀아용',13,1,0,0,'2021-02-06','0:0:0:0:0:0:0:1',NULL),(2,'두부','2','[답글]  같이 놀아요~','저희 강아지도 8살이에요 같이놀아요!',9,1,1,1,'2021-02-06',NULL,NULL),(3,'코코','1','활발한 웰시코기에요','^^',0,3,0,0,'2021-02-08','0:0:0:0:0:0:0:1',NULL),(4,'뽀삐','1','상남동 사는 친구 없나요?','ㅎㅎ',6,4,0,0,'2021-02-08','0:0:0:0:0:0:0:1',NULL),(5,'꼬숨','1','[답글]  저희 꼬숨이랑 친구해요!','꼬수미',7,4,1,1,'2021-02-08',NULL,NULL),(6,'1','1','1','1',1,6,0,0,'2021-02-09','0:0:0:0:0:0:0:1',NULL);
/*!40000 ALTER TABLE `gb_board_mate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gb_board_place`
--

DROP TABLE IF EXISTS `gb_board_place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gb_board_place` (
  `num` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `pass` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `content` varchar(5000) COLLATE utf8_unicode_ci NOT NULL,
  `readcount` int(11) DEFAULT NULL,
  `re_ref` int(11) DEFAULT NULL,
  `re_lev` int(11) DEFAULT NULL,
  `re_seq` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `ip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gb_board_place`
--

LOCK TABLES `gb_board_place` WRITE;
/*!40000 ALTER TABLE `gb_board_place` DISABLE KEYS */;
INSERT INTO `gb_board_place` VALUES (1,'운영자','1','[창원] 용지공원','뛰어놀기 좋아요~\r\n1\r\n2\r\n3',5,1,0,0,'2021-02-06','0:0:0:0:0:0:0:1',NULL),(2,'운영자','2','[이천] 설봉공원','좋아요',4,2,0,0,'2021-02-06','0:0:0:0:0:0:0:1',NULL),(3,'운영자','1','[부산] 온천천 수영강','굿',0,3,0,0,'2021-02-08','0:0:0:0:0:0:0:1',NULL),(4,'운영자','1','[부산] 송도 암남공원','1',0,4,0,0,'2021-02-08','0:0:0:0:0:0:0:1',NULL),(5,'운영자','1','[부산] 사하구 고니나루쉼터','1',0,5,0,0,'2021-02-08','0:0:0:0:0:0:0:1',NULL),(6,'두부','1','[부산] 해안누리길 추천해요!',' 1',0,6,0,0,'2021-02-08','0:0:0:0:0:0:0:1',NULL),(7,'꼬숨','1','[부산] 화명생태공원 좋아요','1',0,7,0,0,'2021-02-08','0:0:0:0:0:0:0:1',NULL),(8,'운영자','1','[창원] 가포해안변공원','1',0,8,0,0,'2021-02-08','0:0:0:0:0:0:0:1',NULL),(9,'운영자','1','[창원] 풍호공원','1',0,9,0,0,'2021-02-08','0:0:0:0:0:0:0:1',NULL),(10,'포메','1','[함안] 한별도그파크','1',0,10,0,0,'2021-02-08','0:0:0:0:0:0:0:1',NULL),(11,'운영자','1','[창원] 하네스 만드는 카페 추천해요','1',0,11,0,0,'2021-02-08','0:0:0:0:0:0:0:1',NULL);
/*!40000 ALTER TABLE `gb_board_place` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gb_diary`
--

DROP TABLE IF EXISTS `gb_diary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gb_diary` (
  `num` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `pass` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `content` varchar(5000) COLLATE utf8_unicode_ci NOT NULL,
  `readcount` int(11) DEFAULT NULL,
  `re_ref` int(11) DEFAULT NULL,
  `re_lev` int(11) DEFAULT NULL,
  `re_seq` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `ip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gb_diary`
--

LOCK TABLES `gb_diary` WRITE;
/*!40000 ALTER TABLE `gb_diary` DISABLE KEYS */;
INSERT INTO `gb_diary` VALUES (1,'1','1','21.2.8 일기','오늘은 두부가 밥을 잘 먹었다',0,1,0,0,'2021-02-08',NULL,NULL),(2,'1','1','21.2.9 일기','오늘은 산책을 갔다왔다',0,2,0,0,'2021-02-08','0:0:0:0:0:0:0:1',NULL),(3,'1','1','21.2.10 일기','친구 생일',0,3,0,0,'2021-02-08','0:0:0:0:0:0:0:1',NULL);
/*!40000 ALTER TABLE `gb_diary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gb_member`
--

DROP TABLE IF EXISTS `gb_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gb_member` (
  `id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `pw` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `pw2` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address1` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address2` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address3` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address4` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address5` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `trait` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gb_member`
--

LOCK TABLES `gb_member` WRITE;
/*!40000 ALTER TABLE `gb_member` DISABLE KEYS */;
INSERT INTO `gb_member` VALUES ('2','2','2','2','2@2','06001','서울 강남구 논현로189길 6','서울 강남구 압구정동 390','ff',' (압구정동)',NULL,NULL,'null'),('3','3','3','3','12@1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'null'),('admin','1','1','1','123@12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'null'),('gb','111','111','gb','gg@gg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('t','1','1','1','11@11111','06110','서울 강남구 학동로 지하 102','g','g',' (논현동)',NULL,NULL,'null'),('test','1','1','1','123@21',NULL,NULL,NULL,NULL,NULL,'123',NULL,'겁이많음'),('test0','1','1','테스트','test@test','06035','서울 강남구 가로수길 9','서울 강남구 신사동 536-9','펜트하우스',' (신사동)','055-123-1234','010-1234-1234','정보 수정!'),('TT','1','1','1','1@1','28787','충북 청주시 상당구 1순환로 1202-1','충북 청주시 상당구 방서동 227-11',NULL,' (방서동)',NULL,NULL,'null'),('w','w','w','w','w@w',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'null'),('yes','1','1','오예','1@1','성공',NULL,NULL,NULL,NULL,'했다','오예',NULL);
/*!40000 ALTER TABLE `gb_member` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-13 23:10:44
