--Example for PostgreSQL 14.x

CREATE TABLE h_hub_name
    (
        hub_name_id         bytea       NOT NULL CONSTRAINT PK_h_hub_name_id PRIMARY KEY
    ,   hub_name_id_system  varchar(36) NOT NULL --учитывал длину GUID
    ,	data_source_id      int4 		NOT NULL
	,   dt_load_dwh         timestamp 	NOT NULL DEFAULT LOCALTIMESTAMP  
    );

--description table	
COMMENT ON COLUMN h_hub_name.hub_name_id IS 'Внутренний идектификатор хаба. Для отображения использовать hub_name_id::text';
COMMENT ON COLUMN h_hub_name.hub_name_id_system IS 'Идентификатор данных для хаба в первичной системе. Является бизнес ключом';
COMMENT ON COLUMN h_hub_name.data_source_id IS 'Идентификатор источника данных';
COMMENT ON COLUMN h_hub_name.dt_load_dwh IS 'Дата транзакции в которой запись попала в таблицу';
