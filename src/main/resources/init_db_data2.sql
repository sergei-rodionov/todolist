-- --------------------------------------
-- Setting for Tomcat
-- JAVA_OPTS = -Dfile.encoding=UTF-8
-- --------------------------------------


-- DROP TABLE IF EXISTS 'todo';
-- CREATE TABLE 'todo' ('id' int(11) NOT NULL AUTO_INCREMENT,'createDate' datetime NOT NULL,'fire' bit(1) DEFAULT NULL,'status' int(11) DEFAULT NULL,'todoText' text, PRIMARY KEY ('id')) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
SET NAMES utf8;
INSERT INTO `todo` (`id`, `createDate`, `fire`, `status`, `todoText`) VALUES ('1', '2015-08-08 20:58:35', b'0', '1', 'Получить задание');
INSERT INTO `todo` (`id`, `createDate`, `fire`, `status`, `todoText`) VALUES ('2', '2015-08-08 20:58:52', b'0', '1', 'Разработать модель данных');
INSERT INTO `todo` (`id`, `createDate`, `fire`, `status`, `todoText`) VALUES ('3', '2015-08-08 20:59:10', b'0', '2', 'Продумать прототип и взаимосвязь с данными');
INSERT INTO `todo` (`id`, `createDate`, `fire`, `status`, `todoText`) VALUES ('4', '2015-08-08 20:59:11', b'0', '2', 'Реализовать модель данных в Java');
INSERT INTO `todo` (`id`, `createDate`, `fire`, `status`, `todoText`) VALUES ('5', '2015-08-08 20:59:12', b'0', '0', 'Сконфигурировать и настроить сервер (spring+hibernate)');
INSERT INTO `todo` (`id`, `createDate`, `fire`, `status`, `todoText`) VALUES ('6', '2015-08-08 20:59:13', b'0', '1', 'Подключить и настроить сервер MySQL');
INSERT INTO `todo` (`id`, `createDate`, `fire`, `status`, `todoText`) VALUES ('7', '2015-08-08 20:59:14', b'1', '1', 'Создать и написать DAO интерфейсы/классы в Java');
INSERT INTO `todo` (`id`, `createDate`, `fire`, `status`, `todoText`) VALUES ('8', '2015-08-08 20:59:15', b'0', '0', 'Создать интерфесы/классы сервисов для WEB сервера');
INSERT INTO `todo` (`id`, `createDate`, `fire`, `status`, `todoText`) VALUES ('9', '2015-08-08 20:59:16', b'0', '2', 'Создать контроллер(ы) для обработки запросов и выдачи результатов пользователям');
INSERT INTO `todo` (`id`, `createDate`, `fire`, `status`, `todoText`) VALUES ('10', '2015-08-08 20:59:17', b'1', '1', 'Разработка макета HTML/AngulaJS/JSP страницы - Список зщадач');
INSERT INTO `todo` (`id`, `createDate`, `fire`, `status`, `todoText`) VALUES ('11', '2015-08-08 20:59:18', b'0', '2', 'Проверка работоспособности вывода листинга демо данных из базы');
INSERT INTO `todo` (`id`, `createDate`, `fire`, `status`, `todoText`) VALUES ('12', '2015-08-08 20:59:19', b'1', '1', 'Разработка макета HTML/AngulaJS/JSP страницы - Редактирование/Создание зщадач');
INSERT INTO `todo` (`id`, `createDate`, `fire`, `status`, `todoText`) VALUES ('13', '2015-08-08 20:59:20', b'0', '2', 'Проверка создания новых задачи и редактирование существующих');
INSERT INTO `todo` (`id`, `createDate`, `fire`, `status`, `todoText`) VALUES ('14', '2015-08-08 20:59:21', b'0', '2', 'Полная проверка все сервисов и запросов на ошибки');
INSERT INTO `todo` (`id`, `createDate`, `fire`, `status`, `todoText`) VALUES ('15', '2015-08-08 20:59:22', b'0', '0', 'Добавление модуля валидации данных');
INSERT INTO `todo` (`id`, `createDate`, `fire`, `status`, `todoText`) VALUES ('16', '2015-08-08 20:59:23', b'0', '1', 'Тестирование приложения');
INSERT INTO `todo` (`id`, `createDate`, `fire`, `status`, `todoText`) VALUES ('17', '2015-08-08 20:59:24', b'1', '1', 'Публикация приложения для пользователей');
INSERT INTO `todo` (`id`, `createDate`, `fire`, `status`, `todoText`) VALUES ('18', '2015-08-08 20:59:25', b'0', '1', 'Вообщем все работает!!! Ура!!!');
INSERT INTO `todo` (`id`, `createDate`, `fire`, `status`, `todoText`) VALUES ('19', '2015-08-08 20:59:26', b'1', '1', 'Использованные технологии Java 7, Spring 4, Hibernate 4, MySql 5, HTML/JSP, AngularJS/JavaScript, BootstrapUI/CSS');

