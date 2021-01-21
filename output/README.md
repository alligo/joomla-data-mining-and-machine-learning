# joomla-data-mining-sql-queries/output
This directory contains sample output of some of the queries for selected projects.

Note that for real projects, you would probably have at least a few thousand
entries. If you are not 100% sure, run the queries on a test server with backup
of the data in production, because the queries in sql/ are complex.

## Example projects

### project-joomla-3
- [output/project-joomla-3/](project-joomla-3)
- http://joomla-3.test.localhost/
- Uses Joomla 3.9.24 (or newer)
- Prefix: `JOSTABLEPREFIX_`
- Sample data:
  - when installing, use `None`
  - Manually import the sample_testing.sql `#__` with `JOSTABLEPREFIX_`.
    (see <https://github.com/joomla/joomla-cms/blob/staging/installation/sql/mysql/sample_testing.sql>)

<!-- user and password: joomleiro/joomleiropassword -->

### project-joomla-4
- [output/project-joomla-4-beta/](project-joomla-4-beta)
- http://joomla-4-beta.test.localhost/
- Uses Joomla 4 beta 6 (or newer)
- Prefix: `JOSTABLEPREFIX_`
- Sample data: when installing, use `Blog Sample Data`

<!-- user and password: joomleiro/joomleiropassword -->