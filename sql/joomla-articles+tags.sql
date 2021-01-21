
-- ID:             joomla-articles+tags
-- DESCRIPTION:    This query 'explode' each article by tag, e.g. for each
--                 article, if have more than 1 tags, the entire line will
--                 be duplicated. This can be used by tools to agregate other
--                 data.
--
-- AUTHOR:         Emerson Rocha <emerson[at]alligo.com.br>
-- COMPANY:        Alligo
-- LICENSE:        "SPDX-License-Identifier: MIT"
-- CREATED:        2021-01-18 22:44 BRT
-- REVISION:       ---

SELECT
    `content`.`id` AS `content_id`,
    `content`.`state` AS `content_state`,
    `category`.`id` AS `category_id`,
    -- `category`.`state` AS `category_state`, -- don't exist
    `category`.`path` AS `category_path`,
    -- `category`.`title` AS `category_title`,
    CONCAT(`tag`.`id`) AS `tag_id`,
    `tag`.`path` AS `tag_path`,
    -- GROUP_CONCAT(`tag`.`id`) AS `tag_ids`,
    `content`.`created_by` AS `content_created_by_user_id`,
    `user_created`.`username` AS `content_created_by_user_username`,
    `content`.`modified_by` AS `content_modified_by_user_id`,
    -- `user_modified`.`username` AS `content_modified_by_user_username`,
    `content`.`created_by_alias` AS `content_created_by_alias`,
    `content`.`created` AS `content_created_date`,
    `content`.`modified` AS `content_modified_date`,
    `content`.`hits` AS `content_hits`,
    -- , `content`.`featured` AS `content_featured`
    -- , `content`.`title` AS `content_title`
    `content`.`alias` AS `content_alias`
    -- , `content`.`alias` AS `content_alias`
    -- , `content`.`introtext` AS `content_introtext`
    -- , `content`.`fulltext` AS `content_fulltext`
    -- , `content`.`metadata` AS `content_metadata`
    -- , `content`.`note` AS `content_note`
FROM
    `JOSTABLEPREFIX_content` AS `content`
LEFT JOIN `JOSTABLEPREFIX_categories` AS `category` ON
    `category`.`id` = `content`.`catid`
LEFT JOIN `JOSTABLEPREFIX_users` AS `user_created` ON
    `user_created`.`id` = `content`.`created_by`
LEFT JOIN `JOSTABLEPREFIX_users` AS `user_modified` ON
    `user_modified`.`id` = `content`.`modified_by`
LEFT JOIN `JOSTABLEPREFIX_contentitem_tag_map` AS `contentitem_tag_map` ON
    `contentitem_tag_map`.`type_alias` = "com_content.article" 
    AND `contentitem_tag_map`.`content_item_id` = `content`.`id`
LEFT JOIN `JOSTABLEPREFIX_tags` AS `tag` ON
    `contentitem_tag_map`.`tag_id` = `tag`.`id`
GROUP BY `content`.`id`
