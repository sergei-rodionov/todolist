-- --------------------------------------
-- Setting for Tomcat
-- JAVA_OPTS = -Dfile.encoding=UTF-8
-- --------------------------------------


-- DROP TABLE IF EXISTS 'todo';
-- CREATE TABLE 'todo' ('id' int(11) NOT NULL AUTO_INCREMENT,'createDate' datetime NOT NULL,'fire' bit(1) DEFAULT NULL,'status' int(11) DEFAULT NULL,'todoText' text, PRIMARY KEY ('id')) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
SET NAMES utf8;
INSERT INTO `todo` (`id`, `createDate`, `fire`, `status`, `todoText`) VALUES ('1', '2015-08-08 20:58:35', b'1', '0', 'Получить задание');

INSERT INTO `todo` (`id`, `createDate`, `fire`, `status`, `todoText`) VALUES ('2', '2015-08-08 20:58:52', b'0', '1', 'тест');

INSERT INTO `todo` (`id`, `createDate`, `fire`, `status`, `todoText`) VALUES ('3', '2015-08-08 20:59:10', b'0', '2', 'тест2');
INSERT INTO `todo` (`id`, `createDate`, `fire`, `status`, `todoText`) VALUES ('4', '2015-08-08 20:59:10', b'0', '2', 'тест3');
INSERT INTO `todo` (`id`, `createDate`, `fire`, `status`, `todoText`) VALUES ('5', '2015-08-08 20:59:10', b'0', '0', 'тест3');
INSERT INTO `todo` (`id`, `createDate`, `fire`, `status`, `todoText`) VALUES ('6', '2015-08-08 20:59:10', b'0', '1', 'тест4');
INSERT INTO `todo` (`id`, `createDate`, `fire`, `status`, `todoText`) VALUES ('7', '2015-08-08 20:59:10', b'1', '1', 'тест5');
INSERT INTO `todo` (`id`, `createDate`, `fire`, `status`, `todoText`) VALUES ('8', '2015-08-08 20:59:10', b'0', '0', 'тест6');
INSERT INTO `todo` (`id`, `createDate`, `fire`, `status`, `todoText`) VALUES ('9', '2015-08-08 20:59:10', b'0', '2', 'тест AngularJS');
INSERT INTO `todo` (`id`, `createDate`, `fire`, `status`, `todoText`) VALUES ('10', '2015-08-08 20:59:10', b'1', '0', 'тест');
INSERT INTO `todo` (`id`, `createDate`, `fire`, `status`, `todoText`) VALUES ('11', '2015-08-08 20:59:10', b'0', '2', 'тест');
INSERT INTO `todo` (`id`, `createDate`, `fire`, `status`, `todoText`) VALUES ('12', '2015-08-08 20:59:10', b'1', '1', 'тест');

INSERT INTO `todo` (`id`, `createDate`, `fire`, `status`, `todoText`) VALUES ('13', '2015-08-08 20:59:10', b'0', '2', 'тест2');
INSERT INTO `todo` (`id`, `createDate`, `fire`, `status`, `todoText`) VALUES ('14', '2015-08-08 20:59:10', b'0', '2', 'тест3');
INSERT INTO `todo` (`id`, `createDate`, `fire`, `status`, `todoText`) VALUES ('15', '2015-08-08 20:59:10', b'0', '0', 'тест3');
INSERT INTO `todo` (`id`, `createDate`, `fire`, `status`, `todoText`) VALUES ('16', '2015-08-08 20:59:10', b'0', '1', 'тест4');
INSERT INTO `todo` (`id`, `createDate`, `fire`, `status`, `todoText`) VALUES ('17', '2015-08-08 20:59:10', b'1', '1', 'тест5');
INSERT INTO `todo` (`id`, `createDate`, `fire`, `status`, `todoText`) VALUES ('18', '2015-08-08 20:59:10', b'0', '0', 'тест6');
INSERT INTO `todo` (`id`, `createDate`, `fire`, `status`, `todoText`) VALUES ('19', '2015-08-08 20:59:10', b'0', '2', 'тест AngularJS');
INSERT INTO `todo` (`id`, `createDate`, `fire`, `status`, `todoText`) VALUES ('20', '2015-08-08 20:59:10', b'1', '0', 'тест');
INSERT INTO `todo` (`id`, `createDate`, `fire`, `status`, `todoText`) VALUES ('21', '2015-08-08 20:59:10', b'0', '2', 'тест');
INSERT INTO `todo` (`id`, `createDate`, `fire`, `status`, `todoText`) VALUES ('22', '2015-08-08 20:59:10', b'1', '1', 'тест');
