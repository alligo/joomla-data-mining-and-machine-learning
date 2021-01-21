# Data Mining and Machine Learning references for Joomla! CMS v0.3
**[Working draft] Joomla! Data Mining SQL Queries examples. Useful to
extract data for analysis on external tools.**

The most common use case of this project is that your organization (or clients
of your company) have one or more websites SO BIG they help to understand how
the content is organized. As this project also is focused for data mining /
machine learning tools, as long as you're aware of the limitations without
correction, you can benchmark popularity or outlines out of the box.

---

<!-- TOC depthFrom:2 -->

- [Overview](#overview)
- [Data extraction, preparation and cleaning](#data-extraction-preparation-and-cleaning)
    - [SQL queries](#sql-queries)
        - [Output for the reference SQL queries](#output-for-the-reference-sql-queries)
    - [Helper scripts](#helper-scripts)
- [Data Mining and Machine learning ("understanding the data")](#data-mining-and-machine-learning-understanding-the-data)
    - [Know limitations](#know-limitations)
    - [Softwares](#softwares)
        - [LibreOffice Calc / Microsoft Excel / Google Spreadsheet](#libreoffice-calc--microsoft-excel--google-spreadsheet)
        - [Orange Data Miner](#orange-data-miner)
        - [Weka, "The workbench for machine learning"](#weka-the-workbench-for-machine-learning)
- [License](#license)

<!-- /TOC -->

---

## Overview

**TL;DR of Concepts**

> - [Joomla!](https://www.joomla.org/) is an award-winning content management system
  (CMS), which enables you to build web sites and powerful online applications.
> - [Data mining](https://en.wikipedia.org/wiki/Data_mining) (in Portuguese,
  [Mineração de dados](https://pt.wikipedia.org/wiki/Minera%C3%A7%C3%A3o_de_dados))
  is a process of discovering patterns in large data sets involving methods at
  the intersection of [machine learning](https://en.wikipedia.org/wiki/Machine_learning),
  [statistics](https://en.wikipedia.org/wiki/Statistics), and database systems.

**What this project is not**:

- Do not mistake "data mining" with "web scraping". This project requires
  administrative access (like database access and server access logs)
- Do not mistake this project by something that you "install" on the site
  (like the very useful Google Analytics) or that is planned to run
  automatically. This needs human intervention, as each project is unique. But
  what it does, it's well tested and the more tedious and initially
  time-consuming part.

# joomla-data-mining-and-machine-learning

## Data extraction, preparation and cleaning

### SQL queries
- Directory: **[sql/](sql/)**
- Database engine: **MySQL-like**
  - Replace 'JOSTABLEPREFIX_' with your real database prefix.
  - For Joomla CMS sites using _PostgreSQL_ or _SQL Server_/_SQL Azure_ you
    need some small changes on syntax, but field names are granted to be
    compatible.

#### Output for the reference SQL queries
- Directory: **[output/](output/)**

Each data mining project is unique, not just by project per organization, but
by point in time. Yet this project contains examples of data output when
using the implementation with the SQL queries.

### Helper scripts

At the moment the [bin/](bin/), even for an working draft, have no
significant content.

## Data Mining and Machine learning ("understanding the data")
> At the moment this section is an draft.

### Know limitations

- The `content_hits` , `category_hits` and `tag_hits` (extracted with some of
  the _SQL queries_) while very useful to get an overview without need to
  relate with other sources (like Google Analytics and Apache/Nginx access
  logs) is affected by caching mechanism (both standard Joomla Caching and
  full page caches like Varnish). Do not ask to disable caches as this affects
  performance, in special for big sites. But, as rule of trumb, when you confirm
  that cache do affect these variables:
  - The real value is equal or higher than expoted one (Often much higher)
    - Pages with disproportionate number of access in short times will have
      significantly less hits. (think articles that viralize)
    - Pages with infrequent (but constant access over the same day or week) may
      not be affected at all by cache.
  - **The `content_hits` , `category_hits` and `tag_hits` still worth to be used
    both for small benchmarks and (for serious reports) needs extra testing for
    detect the impact**

### Softwares

#### LibreOffice Calc / Microsoft Excel / Google Spreadsheet

- Site: <https://libreoffice.org/>
- Site: <https://www.microsoft.com/microsoft-365/excel>
- Site: <https://www.google.com/sheets/about/>

#### Orange Data Miner
- Site: <https://orangedatamining.com/>

#### Weka, "The workbench for machine learning"
- Site: <https://www.cs.waikato.ac.nz/ml/weka/>

## License

To Be Added