# joomla-data-mining-sql-queries v0.2-alpha
**[Working draft] Joomla! Data Mining SQL Queries examples. Useful to
extract data for analysis on external tools**

---

<!-- TOC depthFrom:2 -->

- [Overview](#overview)
- [Implementation](#implementation)
    - [SQL queries](#sql-queries)
    - [Output](#output)
    - [Helper scripts](#helper-scripts)
- [License](#license)

<!-- /TOC -->

---

## Overview

> TL;DR:
> 
> - [Joomla!](https://www.joomla.org/) is an award-winning content management system
  (CMS), which enables you to build web sites and powerful online applications.
> - [Data mining](https://en.wikipedia.org/wiki/Data_mining) (in Portuguese,
  [Mineração de dados](https://pt.wikipedia.org/wiki/Minera%C3%A7%C3%A3o_de_dados))
  is a process of discovering patterns in large data sets involving methods at
  the intersection of [machine learning](https://en.wikipedia.org/wiki/Machine_learning),
  [statistics](https://en.wikipedia.org/wiki/Statistics), and database systems.

## Implementation

### SQL queries
- Directory: **[sql/](sql/)**
- Database engine: **MySQL-like**
  - Replace 'JOSTABLEPREFIX_' with your real database prefix.
  - For Joomla CMS sites using _PostgreSQL_ or _SQL Server_/_SQL Azure_ you
    need some small changes on syntax, but field names are granted to be
    compatible.

### Output
- Directory: **[output/](output/)**

Each data mining project is unique, not just by project per organization, but
by point in time. Yet this project contains examples of data output when
using the implementation with the SQL queries.

### Helper scripts

At the moment the [bin/](bin/), even for an working draft, have no
significant content.

## License

To Be Added