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

-- 导出  表 movierecommder.trust 结构
CREATE TABLE IF NOT EXISTS `trust` (
  `uid1` int(11) NOT NULL,
  `uid2` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`uid1`,`uid2`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 正在导出表  movierecommder.trust 的数据：~51 rows (大约)
/*!40000 ALTER TABLE `trust` DISABLE KEYS */;
INSERT INTO `trust` (`uid1`, `uid2`, `value`) VALUES
	(1, 5, 4),
	(1, 8, 3),
	(1, 10, 5),
	(1, 16, 3),
	(2, 3, 5),
	(2, 9, 4),
	(2, 11, 3),
	(3, 1, 2),
	(3, 13, 4),
	(3, 17, 2),
	(4, 7, 3),
	(4, 12, 5),
	(5, 2, 4),
	(5, 10, 3),
	(5, 14, 4),
	(6, 3, 2),
	(6, 4, 3),
	(6, 17, 5),
	(7, 5, 3),
	(7, 12, 1),
	(7, 16, 4),
	(8, 2, 4),
	(8, 9, 3),
	(9, 1, 5),
	(9, 6, 4),
	(9, 12, 3),
	(10, 2, 3),
	(10, 7, 5),
	(10, 13, 3),
	(11, 5, 3),
	(11, 8, 5),
	(11, 10, 2),
	(12, 3, 4),
	(12, 6, 5),
	(13, 4, 3),
	(13, 6, 2),
	(14, 9, 3),
	(14, 20, 5),
	(15, 1, 5),
	(15, 3, 2),
	(15, 18, 4),
	(16, 20, 4),
	(17, 8, 4),
	(17, 15, 4),
	(18, 2, 4),
	(18, 3, 5),
	(19, 10, 4),
	(19, 15, 3),
	(20, 7, 3),
	(20, 8, 4),
	(20, 11, 5);
/*!40000 ALTER TABLE `trust` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
