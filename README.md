# Data Mining and Machine Learning references for Joomla! CMS [v0.4]
<!-- **Joomla! Data Mining SQL Queries examples. Useful to extract data for analysis
on external open source tools, including to build machine learning models.** -->

The most common use case of this project is that your organization (or clients
of your company) have one or more websites _SO BIG_ they help to understand how
the content is organized and then how to generate more value.

> **PROTIP 1**: While new people to both machine learning and usage in the real
  world are likely to assume the value to deliver with data mining for large
  websites is forecasting and replicating success cases, **often the best value
  is discovering patterns already existing and fixing small issues with high
  impact**. In other words: you learn how humans produce/optimize content
  (even if it means ask them instead of analize the data data), then discover
  outliers that are not as perfect. The next step is, based on data
  visualization, help the humans to self-improvement with new feedback.

> **PROTIP 2**: if you're *really* into forecasting from the _PROTIP 1_,
  **machine learning can (and often will) works better even with small (but well
  representative) list of items (think like 100 rows)** than 1.000's to
  100.000's but poorly prepared data.

---

<!-- TOC depthFrom:2 -->

- [1. Overview](#1-overview)
- [2. Data extraction, preparation and cleaning](#2-data-extraction-preparation-and-cleaning)
    - [2.1. Data extraction from the Joomla site database ("SQL queries")](#21-data-extraction-from-the-joomla-site-database-sql-queries)
        - [2.1.1. Output for the reference SQL queries](#211-output-for-the-reference-sql-queries)
    - [2.2. Data extraction from Joomla server logs ("Apache/NGinx access logs")](#22-data-extraction-from-joomla-server-logs-apachenginx-access-logs)
    - [2.3. Data extraction from Google Analytics and Google Search Console](#23-data-extraction-from-google-analytics-and-google-search-console)
        - [2.3.1. Google Analytics](#231-google-analytics)
        - [2.3.2. Google Search Console](#232-google-search-console)
    - [2.4. Helper scripts](#24-helper-scripts)
- [3. Data Mining and Machine learning ("understanding the data")](#3-data-mining-and-machine-learning-understanding-the-data)
    - [3.1. Know limitations](#31-know-limitations)
    - [3.2. Softwares](#32-softwares)
        - [3.2.1. LibreOffice Calc / Microsoft Excel / Google Spreadsheet](#321-libreoffice-calc--microsoft-excel--google-spreadsheet)
        - [3.2.2. Orange Data Miner](#322-orange-data-miner)
        - [3.2.3. Weka, "The workbench for machine learning"](#323-weka-the-workbench-for-machine-learning)
- [4. Patterns often found on (large) websites to be aware](#4-patterns-often-found-on-large-websites-to-be-aware)
    - [4.1 Spammers](#41-spammers)
    - [4.2 Untagged items](#42-untagged-items)

<!-- /TOC -->

---

## 1. Overview

**TL;DR of Concepts**

> - [Joomla!](https://www.joomla.org/) is an award-winning content management system
  (CMS), which enables you to build web sites and powerful online applications.
> - [Data mining](https://en.wikipedia.org/wiki/Data_mining) (in Portuguese,
  [Mineração de dados](https://pt.wikipedia.org/wiki/Minera%C3%A7%C3%A3o_de_dados))
  is a process of discovering patterns in large data sets involving methods at
  the intersection of [machine learning](https://en.wikipedia.org/wiki/Machine_learning),
  [statistics](https://en.wikipedia.org/wiki/Statistics), and database systems.
> - The **joomla-data-mining-and-machine-learning** gives an general idea of how
    to do data mining and machine learning with websites, but dedicate special
    attention to implementation of non-generic tasks, like SQL queries,
    to an typical Joomla! CMS installation.

**What this reference is NOT**:

- **Do not mistake [Data mining](https://en.wikipedia.org/wiki/Data_mining) with
  [web scraping](https://en.wikipedia.org/wiki/Web_scraping).**
  - This project requires administrative access (like database access and server
    access logs).
- **Do not mistake this project by something that you "install" on an site**
    - Some people search for _"Data mining WordPress"_ or _"Data Mining Joomla"_
      asking for something to install and automatically _"enable data mining"_
      _"enable machine learning"_ on the website.
    - Ok, **stricly speaking**, yes, one discussed source of data, Google Analytics,
      _can be installed_, but this project is have broader concept.
- **Do not confuse this guide with something whose final result runs
  automatically and give insights.**
    - While some parts can be automated and even individual softwares _can
      bruteforce_ insights, an human would still need to glue different tools
      and discard irrelevant or obvious conclusions and focus on what can be
      useful
        - _"Wow, Orange Data Mining discoreverd that `content_created_date` can
          predict `content_hits`"_ is the same as one machine discover that as
          older as one content is, more likely to have an total number of views.
          But is this useful?

## 2. Data extraction, preparation and cleaning

### 2.1. Data extraction from the Joomla site database ("SQL queries")
- Directory: **[sql/](sql/)**
- Database engine: **MySQL-like**
  - Replace 'JOSTABLEPREFIX_' with your real database prefix.
  - For Joomla CMS sites using _PostgreSQL_ or _SQL Server_/_SQL Azure_ you
    need some small changes on syntax, but field names are granted to be
    compatible.

#### 2.1.1. Output for the reference SQL queries
- Directory: **[output/](output/)**

Each data mining project is unique, not just by project per organization, but
by point in time. Yet this project contains examples of data output when
using the implementation with the SQL queries.

### 2.2. Data extraction from Joomla server logs ("Apache/NGinx access logs")
> Note: this section is a minimal draft. Since the implementation is more
  generic than the use with Joomla CMS, it may not be implemented at all on
  future releases. But it still mentioned here, since is an potential source
  of data.

### 2.3. Data extraction from Google Analytics and Google Search Console
> Note: since this topic is generic than the use with only Joomla CMS
  websites, it's here more as a quick reference. In fact, it would be incomplete
  to at least not mention one source of data that is very likely to be already
  used on average sites in production on a reference related to data mining
  for Joomla.

Both Google Analytics and Google Search Console can be used a source of data.
While both (in special for very big sites with pages with low number of access)
are likely to not be as structured to get an full picture as the context
extracted from the database export, it still allow to compare data.

#### 2.3.1. Google Analytics

**Export to Excel XLSX, CSV or Google Spreadsheet list of all URLs**

1. Go to <https://analytics.google.com/>. Select the account of the website
2. On the sidebar, click `Behavior` (in Portuguese, `Comportamento`)
3. Click on `Site Content` (in Portuguese, `Conteúdo do site`)
4. Click on `All Pages` (in Portuguese, `Todas as Páginas`)
5. Change how many list items to show; recommented: 5000.
    - Exported items are exactly the ones previewed on screen.
    - When do exist more than 5000 items, click to see next page. Each page
      needs to be exported.
6. Personalize the date range to show the table on the top of the screen, right
  side; recommended: at least a few years ago until current date.
    - Keep in mind that older pages may not be accessed by users on recent
      months. For big sites, this means you will miss parts of your site
    - But also keep in mind that older dates will return inexistent pages today
7. On the top of the screen, right side, click `Export`.
  - `Excel (XLSX)` or `Google Spreadsheets` can be a good format to start.

#### 2.3.2. Google Search Console

The steps are similar to Google Analytics, but with the limitation of **1000**
URLs. Also an single `Excel (XLSX)` exported file have more content from
Google Analytics and is

**Export to Excel XLSX, CSV or Google Spreadsheet list of all URLs**

1. Go to <https://search.google.com/search-console/>. Select the account of the website
2. On the sidebar, click `Performance` (in Portuguese, `Desempenho`)
3. There is no need to change how many itens to export (the maximum,
  non-configurable, is 1000)
4. Personalize the date rang;, the older you can get, the better.
5. On the top of the screen, right side, click `Export`.
  - `Excel (XLSX)` or `Google Spreadsheets` can be a good format to start.

### 2.4. Helper scripts

At the moment the [bin/](bin/), even for an working draft, have no
significant content.

## 3. Data Mining and Machine learning ("understanding the data")
> At the moment this section is an draft.

### 3.1. Know limitations

1. Data extraction from the Joomla site database ("SQL queries") fields named
 `content_hits`, `category_hits` and `tag_hits`, while very useful to get an
  overview without need to relate with other sources (like Google Analytics
  and Apache/Nginx access logs) are affected by caching mechanisms (both standard
  Joomla Caching and full page caches like Varnish). Do not ask to disable
  caches as this affects performance, in particular for big sites. But, as rule
  of trump, when you confirm that cache do affect these variables:
    - The real value is equal or higher than exported one (sometimes much higher)
        - Pages with disproportionate number of access in short times will have
          significantly less hits. (think articles that viralize)
        - Pages with infrequent (but constant access over the same day or week)
          may not be affected at all by cache.
    - **The `content_hits` , `category_hits` and `tag_hits` still worth to be
      used both for small benchmarks and (for serious reports) needs extra
      testing for detect the impact**
2. Data from Google Analytics and Google Search Console **are limited to
  page URls most accessed by users** and evolution over time (including URLs
  changes)
    - _(TODO: explain more on this)_

### 3.2. Softwares

#### 3.2.1. LibreOffice Calc / Microsoft Excel / Google Spreadsheet

- Site: <https://libreoffice.org/>
- Site: <https://www.microsoft.com/microsoft-365/excel>
- Site: <https://www.google.com/sheets/about/>

#### 3.2.2. Orange Data Miner
- Site: <https://orangedatamining.com/>

#### 3.2.3. Weka, "The workbench for machine learning"
- Site: <https://www.cs.waikato.ac.nz/ml/weka/>

## 4. Patterns often found on (large) websites to be aware

> _TODO: this entire section is an working draft_

### 4.1 Spammers
For sites that allow users to create accounts (even if there is no registration
link on the site, but the CMS allows create accounts) the exported data will
show trends of non-natural humans registered.

### 4.2 Untagged items

> _TODO: add content_

# License
[MIT License](LICENSE.md).

`SPDX-License-Identifier: MIT`
