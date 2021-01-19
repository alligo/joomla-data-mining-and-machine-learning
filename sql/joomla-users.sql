-- ID:             joomla-users
-- DESCRIPTION:    The joomla-users is "the typical" query for when asked to
--                 'just get me users data'.
--
-- USAGE:          Replace '#__' with the prefix table if this query is used
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
	`user`.`name` AS `user_id`,
	`user`.`username` AS `user_id`,
	`user`.`email` AS `user_id`,
	`user`.`block` AS `user_id`,
	`user`.`sendEmail` AS `user_id`,
	`user`.`registerDate` AS `user_id`,
	`user`.`lastvisitDate` AS `user_id`,
	`user`.`activation` AS `user_activation`
FROM
	`pg2016_users` AS `user`