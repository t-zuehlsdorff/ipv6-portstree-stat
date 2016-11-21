START TRANSACTION;

-- stores a list of all times, when a portstree was sync with
-- this database
-- also the import_id is used in the ports; see relation 'ports'
CREATE TABLE portstree_sync_log (
  import_id   BIGSERIAL   NOT NULL PRIMARY KEY,
  import_time TIMESTAMPTZ NOT NULL DEFAULT current_timestamp
);

COMMENT ON TABLE portstree_sync_log IS 'list of all portstree synchronisation times';

-- stores a list of all ports of the ports-tree and give them an surrogat id
-- 'port' has form of "category/dirname"
-- 'import_id' is used to detect deleted ports
CREATE TABLE ports (
  port_id   SERIAL NOT NULL PRIMARY KEY,
  port      TEXT   NOT NULL UNIQUE CHECK (0 != position('/' in port)),
  import_id BIGINT NOT NULL
);

ROLLBACK;
