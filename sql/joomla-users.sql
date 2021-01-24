-- ID:             joomla-users
-- DESCRIPTION:    Return data about users registred on the site and information
--                 about created/modified content by each account.
--
-- AUTHOR:         Emerson Rocha <emerson[at]alligo.com.br>
-- COMPANY:        Alligo
-- LICENSE:        "SPDX-License-Identifier: MIT"
-- VERSION:        1.1
-- CREATED:        2021-01-18 22:57 BRT
-- REVISION:       2021-01-23 06:50 UTC v1.1 Added user_modified_content_count,
--                                     user_created_content_count,
--                                     user_modified_content_hits_avg,
--                                     user_created_content_hits_avg,
--                                     user_modified_content_hits,
--                                     user_created_content_hits

-- @see https://teskalabs.com/blog/data-privacy-pseudonymization-anonymization-encryption
-- @see https://towardsdatascience.com/anonymizing-data-sets-c4602e581a35
-- @see https://www.w3resource.com/mysql/string-functions/mysql-left-function.php

SELECT
    `user`.`id` AS `user_id`
    -- , `user`.`name` AS `user_name`
    , `user`.`username` AS `user_username`
    , `user`.`email` AS `user_email`
    , `user`.`block` AS `user_block`
    , `user`.`sendEmail` AS `user_sendEmail`
    , `user`.`registerDate` AS `user_registerDate`
    , `user`.`lastvisitDate` AS `user_lastvisitDate`
    , `user`.`activation` AS `user_activation`
    , COUNT(`modified_content`.`id`) AS `user_modified_content_count`
    , COUNT(`created_content`.`id`) AS `user_created_content_count`
    , AVG(`modified_content`.`hits`) AS `user_modified_content_hits_avg`
    , AVG(`created_content`.`hits`) AS `user_created_content_hits_avg`
    , SUM(`modified_content`.`hits`) AS `user_modified_content_hits`
    , SUM(`created_content`.`hits`) AS `user_created_content_hits`
FROM
    `JOSTABLEPREFIX_users` AS `user`
LEFT JOIN `JOSTABLEPREFIX_content` AS `created_content` ON
    `user`.`id` = `created_content`.`created_by`
LEFT JOIN `JOSTABLEPREFIX_content` AS `modified_content` ON
    `user`.`id` = `modified_content`.`modified_by`
GROUP BY `user`.`id`