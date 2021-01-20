-- ID:             joomla-users
-- DESCRIPTION:    The joomla-users is "the typical" query for when asked to
--                 'just get me users data'.
--
-- USAGE:          Replace 'JOSTABLEPREFIX_' with the prefix table if this query is used
--                 outside Joomla framework (like direct from typical SQL
--                 frontends like PHPMyAdmin or data mining tools)
--
-- AUTHOR:         Emerson Rocha <emerson[at]alligo.com.br>
-- COMPANY:        Alligo
-- LICENSE:        Public Domain
-- CREATED:        2021-01-18 22:57 BRT
-- REVISION:       ---

SELECT
	`user`.`id` AS `user_id`,
	`user`.`name` AS `user_name`,
	`user`.`username` AS `user_username`,
	`user`.`email` AS `user_email`,
	`user`.`block` AS `user_block`,
	`user`.`sendEmail` AS `user_sendEmail`,
	`user`.`registerDate` AS `user_registerDate`,
	`user`.`lastvisitDate` AS `user_lastvisitDate`,
	`user`.`activation` AS `user_activation`
FROM
	`JOSTABLEPREFIX_users` AS `user`
