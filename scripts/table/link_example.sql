--Example for PostgreSQL 14.x

CREATE TABLE l_hub_name_other_hub_name
	(
--technical columns in dwh. Start
        dt_load_dwh                 timestamp   NOT NULL DEFAULT LOCALTIMESTAMP
	,   pit_id                      int4 		NOT NULL --table on servis layer
	,   dt_from                     timestamp 	NOT NULL DEFAULT LOCALTIMESTAMP
	,   dt_to                       timestamp 	NOT NULL DEFAULT '99991231'::timestamp --date_archive or date_modified in primary system
--technical columns in dwh. End
	,   l_hub_name_other_hub_name   serial      NOT NULL
    ,   hub_name_id                 bytea       NOT NULL
    ,   other_hub_name_id           bytea       NOT NULL
	,   data_source_id              int4        NOT NULL
    );

--main btree index
CREATE INDEX ix_l_hub_name_other_hub_name ON l_hub_name_other_hub_name (hub_name_id, other_hub_name_id, dt_from, dt_to);

--description table
COMMENT ON COLUMN l_hub_name_other_hub_name.dt_load_dwh IS 'Дата транзакции, в которой запись попала в таблицу. DEFAULT LOCALTIMESTAMP';
COMMENT ON COLUMN l_hub_name_other_hub_name.pit_id IS 'Идентификатор отметки времени';
COMMENT ON COLUMN l_hub_name_other_hub_name.dt_from IS 'Дата, с которой действует запись. DEFAULT LOCALTIMESTAMP';
COMMENT ON COLUMN l_hub_name_other_hub_name.dt_to IS 'Дата, до которой действует запись. DEFAULT 99991231';
COMMENT ON COLUMN l_hub_name_other_hub_name.l_hub_name_other_hub_name_id IS 'Внутренний идектификатор строки линка';
COMMENT ON COLUMN l_hub_name_other_hub_name.hub_name_id IS 'Внутренний идектификатор хаба. Для отображения использовать hub_name_id::text';
COMMENT ON COLUMN l_hub_name_other_hub_name.other_hub_name_id IS 'Внутренний идектификатор другого хаба Для отображения использовать other_hub_name_id::text';
COMMENT ON COLUMN l_hub_name_other_hub_name.data_source_id IS 'Идентификатор источника данных';


