-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        10.5.4-MariaDB - mariadb.org binary distribution
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出  表 movierecommder.user 结构
CREATE TABLE IF NOT EXISTS `user` (
  `username` varchar(50) NOT NULL,
  `userid` int(11) NOT NULL DEFAULT 0,
  `password` varchar(50) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `uq_name` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 正在导出表  movierecommder.user 的数据：~17 rows (大约)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`username`, `userid`, `password`, `phone`, `email`, `address`) VALUES
	('jack', 1, '789', '4444', '', '天津'),
	('zhangsan', 2, '123', NULL, NULL, NULL),
	('lisi', 3, '123', NULL, NULL, NULL),
	('wangwu', 4, '123', NULL, NULL, NULL),
	('zhaoliu', 5, '123', NULL, NULL, NULL),
	('qianqi', 6, '123', NULL, NULL, NULL),
	('helen', 7, '123', NULL, NULL, NULL),
	('sun', 8, '123', NULL, NULL, NULL),
	('sha', 9, '123', NULL, NULL, NULL),
	('tang', 10, '123', NULL, NULL, NULL),
	('zhu', 11, '123', NULL, NULL, NULL),
	('Tom', 12, '123', NULL, NULL, NULL),
	('otis', 13, '123', NULL, NULL, NULL),
	('Mave', 14, '123', NULL, NULL, NULL),
	('Eric', 15, '123', NULL, NULL, NULL),
	('Adam', 16, '123', NULL, NULL, NULL),
	('judy', 17, '123', NULL, NULL, NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
