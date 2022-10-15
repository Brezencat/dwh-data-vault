--Example for PostgreSQL 14.x

CREATE TABLE s_satellite_name_details
	(
--technical columns in dwh. Start
        dt_load_dwh         timestamp 		NOT NULL DEFAULT LOCALTIMESTAMP
	,   pit_id 				int4			NOT NULL --table on servis layer
	,   dt_from             timestamp 		NOT NULL DEFAULT LOCALTIMESTAMP
	,   dt_to               timestamp 		NOT NULL DEFAULT '99991231'::timestamp --date_archive or date_modified in primary system
--technical columns in dwh. End
	,   hub_name_id 		bytea 			NOT NULL
	,   satellite_name 		varchar(256) 	NOT NULL
	[
        detailed information about the object
        is uniform in different systems
    ]
	,   dt_created_system 	timestamp 			NULL
	);

--main btree index
CREATE INDEX ix_s_satellite_name_details ON s_satellite_name_details (hub_name_id, dt_from, dt_to);

--description table
COMMENT ON COLUMN s_satellite_name_details.dt_load_dwh IS 'Дата транзакции, в которой запись попала в таблицу. DEFAULT LOCALTIMESTAMP';
COMMENT ON COLUMN s_satellite_name_details.pit_id IS 'Идентификатор отметки времени';
COMMENT ON COLUMN s_satellite_name_details.dt_from IS 'Дата, с которой действует запись. DEFAULT LOCALTIMESTAMP';
COMMENT ON COLUMN s_satellite_name_details.dt_to IS 'Дата, до которой действует запись. DEFAULT 99991231';
COMMENT ON COLUMN s_satellite_name_details.hub_name_id IS 'Внутренний идектификатор хаба. Для отображения использовать hub_name_id::text';
COMMENT ON COLUMN s_satellite_name_details.contragent IS 'Название данных в сателите (имя клиента, пользователя, название счёт и т.п.';
COMMENT ON COLUMN s_satellite_name_details.[column_name] IS '[другая детальная информация]';
COMMENT ON COLUMN s_satellite_name_details.dt_created_system IS 'Дата создания записи в первичной системе';


