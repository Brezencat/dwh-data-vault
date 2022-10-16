# Построение DWH по методологии Data Vault (с модификациями).

## Стек технологий
* На данный момент:
    * Модель DWH - **Data Vault** (модифицированный под потребности)
    * СУБД - **PostgreSQL**
    * ETL/Orcestrator/Scheduler - **Apache NiFi**
* В перспективе:
    * _СУБД - Postgres Pro_
    * _Orcestrator/Scheduler - Apache Airflow 2_
    * _Отчётность - Apache Superset / Metabase_

## Описание
* [Краткая инфографика по сущностям Data Vault](docs/data-vault-brief.png)
* [Бизнесовое описание архитектуры хранилища данных](docs/dwh-architecture-business-steps.png)
* [Архитектурный план хранилища данных](docs/dwh-architecture-plan.png)
* [Структура хранилища. Описание](docs/stucture.md)

## Примеры скриптов
### СУБД
* [Таблицы:](scripts/table/)
    * [Пример хаба (HUB)](scripts/table/dds.hub_example.sql)
    * [Пример сателлита (SATELLITE)](scripts/table/dds.satellite_example.sql)
    * [Пример связи/линка (LINK)](scripts/table/dds.link_example.sql)
* Процедуры:


### ETL
*в процессе...*

## Исходные файлы для подготовки презентаций и описания
* [source](source/)