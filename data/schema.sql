CREATE TABLE choices(
  id      INTEGER PRIMARY KEY AUTOINCREMENT,
  option  VARCHAR(128),
  page_id INTEGER,
  FOREIGN KEY(page_id) REFERENCES pages(id)
);

CREATE TABLE pages(
  id          INTEGER PRIMARY KEY AUTOINCREMENT,
  content     TEXT,
  published   BOOLEAN default false,
  choice_id   INTEGER,
  author_id     INTEGER,
  created_at  TIMESTAMP,
  modified_at TIMESTAMP, 
  FOREIGN KEY(choice_id) REFERENCES choices(id),
  FOREIGN KEY(author_id)   REFERENCES users(id)
);

CREATE TABLE authors(
  id            INTEGER PRIMARY KEY AUTOINCREMENT,
  name          VARCHAR(32),
  password_hash CHAR(64),
  created_at    TIMESTAMP
);