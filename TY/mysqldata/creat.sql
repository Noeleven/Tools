--
-- CREATE DATABASE TINGYUN DATAS
--
-- DROP DATABASE IF EXISTS `tingyun`;
-- CREATE DATABASE tingyun;
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
  `https` char(10) NOT NULL,
  `post` char(10) NOT NULL,
  `response` char(10) NOT NULL,
  `des` char(100) NOT NULL,
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 auto_increment=1;

-- 创建吞吐量表
DROP TABLE IF EXISTS `ty_r`;
CREATE TABLE `ty_r` (
  `r_id` int(10) NOT NULL AUTO_INCREMENT,
  `method` char(100) NOT NULL,
  `version` char(10) ,
  `post` char(10) ,
  `rpm` char(10) NOT NULL,
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 auto_increment=1;

-- 创建历史响应占比表
DROP TABLE IF EXISTS `ty_rate`;
CREATE TABLE `ty_rate` (
  `rate_id` int(10) NOT NULL AUTO_INCREMENT,
  `des` char(100) NOT NULL,
  `ms_level` char(10) ,
  `one_level` char(10) ,
  `two_level` char(10) ,
  `three_level` char(10) ,
  `four_level` char(10) ,
  `five_level` char(10) ,
  PRIMARY KEY (`rate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 auto_increment=1;

