-- original: fkey_malloc.test
-- credit:   http://www.sqlite.org/src/tree?ci=trunk&name=test

PRAGMA foreign_keys = 1;
  CREATE TABLE t1(a PRIMARY KEY, b UNIQUE);
  CREATE TABLE t2(x REFERENCES t1 ON UPDATE CASCADE ON DELETE CASCADE)
;PRAGMA foreign_keys = 1;
  CREATE TABLE t1(a, b, UNIQUE(a, b))
;PRAGMA foreign_keys = 1;
  CREATE TABLE t1(x INTEGER PRIMARY KEY);
  CREATE TABLE t2(y DEFAULT 14 REFERENCES t1(x) ON UPDATE SET DEFAULT);
  CREATE TABLE t3(y REFERENCES t1 ON UPDATE SET NULL);
  INSERT INTO t1 VALUES(13);
  INSERT INTO t2 VALUES(13);
  INSERT INTO t3 VALUES(13)
;PRAGMA foreign_keys = 1;
  CREATE TABLE t1(x INTEGER PRIMARY KEY, y UNIQUE);
  CREATE TABLE t2(z REFERENCES t1(x), a REFERENCES t1(y));
  CREATE TABLE t3(x);
  CREATE TABLE t4(z REFERENCES t3);
  CREATE TABLE t5(x, y);
  CREATE TABLE t6(z REFERENCES t5(x));
  CREATE INDEX i51 ON t5(x);
  CREATE INDEX i52 ON t5(y, x);
  INSERT INTO t1 VALUES(1, 2)
;PRAGMA foreign_keys = 1;
  CREATE TABLE t1(x, y, PRIMARY KEY(x, y));
  CREATE TABLE t2(a, b, FOREIGN KEY(a, b) REFERENCES t1 ON UPDATE CASCADE);
  INSERT INTO t1 VALUES(1, 2);
  INSERT INTO t2 VALUES(1, 2)
;PRAGMA foreign_keys = 1;
  CREATE TABLE t1(
    x PRIMARY KEY, 
    y REFERENCES t1 ON DELETE RESTRICT ON UPDATE SET DEFAULT
  );
  INSERT INTO t1 VALUES('abc', 'abc');
  INSERT INTO t1 VALUES('def', 'def')
;PRAGMA foreign_keys = 1;
  CREATE TABLE x(a, b, PRIMARY KEY(a, b));
  CREATE TABLE y(c, d,
    FOREIGN KEY(d, c) REFERENCES x DEFERRABLE INITIALLY DEFERRED
  );
  CREATE TABLE z(e, f, FOREIGN KEY(e, f) REFERENCES x);