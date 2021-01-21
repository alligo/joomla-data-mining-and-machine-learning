

-- ID:             joomla-tags
-- DESCRIPTION:    Return basic generic information about tags
--
-- AUTHOR:         Emerson Rocha <emerson[at]alligo.com.br>
-- COMPANY:        Alligo
-- LICENSE:        "SPDX-License-Identifier: MIT"
-- CREATED:        2021-01-18 22:00 BRT
-- REVISION:       ---

SELECT
    `tag`.`id` AS `tag_id`,
    `tag`.`published` AS `tag_published`,
    `tag`.`parent_id` AS `tag_parent_id`,
    `tag`.`lft` AS `tag_lft`,
    `tag`.`rgt` AS `tag_rgt`,
    `tag`.`level` AS `tag_level`,
    `tag`.`path` AS `tag_path`,
    `tag`.`hits` AS `tag_hits`,
    `tag`.`title` AS `tag_title`,
    `tag`.`alias` AS `tag_alias`,
    `tag`.`note` AS `tag_note`,
    `tag`.`created_user_id` AS `tag_created_user_id`,
    `tag`.`created_time` AS `tag_created_time`,
    `tag`.`modified_user_id` AS `tag_modified_user_id`,
    `tag`.`modified_time` AS `tag_modified_time`,
    COUNT(`content`.`id`) AS `content_count`
FROM
    `JOSTABLEPREFIX_tags` AS `tag`
LEFT JOIN `JOSTABLEPREFIX_contentitem_tag_map` AS `contentitem_tag_map` ON
    `contentitem_tag_map`.`type_alias` = "com_content.article" 
    AND `contentitem_tag_map`.`tag_id` = `tag`.`id`
LEFT JOIN `JOSTABLEPREFIX_content` AS `content` ON
    `contentitem_tag_map`.`content_item_id` = `content`.`id`
GROUP BY `tag`.`id`