--
-- CREATE DATABASE TINGYUN DATAS
--
DROP DATABASE IF EXISTS `tingyun`;
CREATE DATABASE tingyun;
use tingyun;
DROP TABLE IF EXISTS `api`;
CREATE TABLE `api` (
  `api_id` int(10) NOT NULL AUTO_INCREMENT,
  `method` char(100) NOT NULL,
  `version` char(20) NOT NULL,
  `des` char(100) NOT NULL,
  PRIMARY KEY (`api_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 auto_increment=1;

DROP TABLE IF EXISTS `ty_host`;
CREATE TABLE `ty_host` (
  `host_id` int(10) NOT NULL,
  `des` char(100) NOT NULL,
  PRIMARY KEY (`host_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- 创建响应时间表
DROP TABLE IF EXISTS `ty_s`;
CREATE TABLE `ty_s` (
  `s_id` int(10) NOT NULL AUTO_INCREMENT,
  `host_id` int(10) NOT NULL,
  `method` char(100) NOT NULL,
  `version` char(10) NOT NULL,
  `lvversion` char(10) NOT NULL,
  `http` char(10) NOT NULL,
  `get` char(10) NOT NULL,
  `value` char(10) NOT NULL,
  `des` char(100) NOT NULL,
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 auto_increment=1;

-- 创建吞吐量表
DROP TABLE IF EXISTS `ty_r`;
CREATE TABLE `ty_r` (
  `r_id` int(10) NOT NULL AUTO_INCREMENT,
  `host_id` int(10) NOT NULL,
  `method` char(100) NOT NULL,
  `version` char(10) NOT NULL,
  `lvversion` char(10) NOT NULL,
  `http` char(10) NOT NULL,
  `get` char(10) NOT NULL,
  `value` char(10) NOT NULL,
  `des` char(100) NOT NULL,
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 auto_increment=1;


