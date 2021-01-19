-- ID:             joomla-articles-meta
-- DESCRIPTION:    This query focus on return relationships from articles with
--                 users, categories and tags. But, despite title of article,
--                 will not load article content.
--
-- USAGE:          Replace '#__' with the prefix table if this query is used
--                 outside Joomla framework (like direct from typical SQL
--                 frontends like PHPMyAdmin or data mining tools)
--
-- AUTHOR:         Emerson Rocha <emerson[at]alligo.com.br>
-- COMPANY:        Alligo
-- LICENSE:        Public Domain
-- CREATED:        2021-01-18 22:44 BRT
-- REVISION:       ---

SELECT `id`, `state`, `hits`, `created`,`created_by`, `created_by_alias`, `catid`, `title`
FROM pg2016_content AS content
