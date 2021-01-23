-- ID:             joomla-tags
-- DESCRIPTION:    Return information about each tag and related general result
--                 of tagged articles via `content_count` and `content_hits`
--
-- AUTHOR:         Emerson Rocha <emerson[at]alligo.com.br>
-- COMPANY:        Alligo
-- LICENSE:        "SPDX-License-Identifier: MIT"
-- VERSION:        1.1
-- CREATED:        2021-01-18 22:00 BRT
-- REVISION:       2021-01-23 06:19 UTC 1.1 Added tag_hits and content_hits

SELECT
    `tag`.`id` AS `tag_id`
    , `tag`.`published` AS `tag_published`
    , `tag`.`parent_id` AS `tag_parent_id`
    -- , `tag`.`lft` AS `tag_lft`
    -- , `tag`.`rgt` AS `tag_rgt`
    , `tag`.`level` AS `tag_level`
    , `tag`.`path` AS `tag_path`
    -- , `tag`.`title` AS `tag_title`
    , `tag`.`alias` AS `tag_alias`
    -- , `tag`.`note` AS `tag_note`
    , `tag`.`created_user_id` AS `tag_created_user_id`
    , `tag`.`created_time` AS `tag_created_time`
    , `tag`.`modified_user_id` AS `tag_modified_user_id`
    , `tag`.`modified_time` AS `tag_modified_time`
    , COUNT(`content`.`id`) AS `content_count`
    -- Since Weka, by defailt, will consider last item as Class/Target, we choose to leave tags_hits and content_hits last
    , `tag`.`hits` AS `tag_hits`
    , SUM(`content`.`hits`) AS `content_hits`
FROM
    `JOSTABLEPREFIX_tags` AS `tag`
LEFT JOIN `JOSTABLEPREFIX_contentitem_tag_map` AS `contentitem_tag_map` ON
    `contentitem_tag_map`.`type_alias` = "com_content.article" 
    AND `contentitem_tag_map`.`tag_id` = `tag`.`id`
LEFT JOIN `JOSTABLEPREFIX_content` AS `content` ON
    `contentitem_tag_map`.`content_item_id` = `content`.`id`
GROUP BY `tag`.`id`