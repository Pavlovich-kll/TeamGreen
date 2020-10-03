DROP TABLE IF EXISTS user_roles;
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS wallets CASCADE;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS types;
DROP TABLE IF EXISTS ordered_products;
DROP TABLE IF EXISTS orders;
DROP SEQUENCE IF EXISTS global_seq;

CREATE SEQUENCE global_seq START WITH 100000;

CREATE TABLE users
(
    id          INTEGER PRIMARY KEY DEFAULT nextval('global_seq'),
    name        VARCHAR   NOT NULL,
    email       VARCHAR   NOT NULL,
    password    VARCHAR   NOT NULL,
    wallet_id   INTEGER   NOT NULL,
    created     TIMESTAMP NOT NULL,
    last_update TIMESTAMP NOT NULL
);
CREATE UNIQUE INDEX users_unique_email_idx ON users (email);

CREATE TABLE user_roles
(
    user_id INTEGER NOT NULL,
    role    VARCHAR,
    CONSTRAINT user_roles_idx UNIQUE (user_id, role),
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

CREATE TABLE wallets
(
    id          INTEGER PRIMARY KEY DEFAULT nextval('global_seq'),
    user_id     INTEGER   NOT NULL,
    balance     DECIMAL   NOT NULL,
    created     TIMESTAMP NOT NULL,
    last_update TIMESTAMP NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

ALTER TABLE users
    ADD FOREIGN KEY (wallet_id) REFERENCES wallets (id) ON DELETE CASCADE;

CREATE TABLE types
(
    id          INTEGER PRIMARY KEY DEFAULT nextval('global_seq'),
    name        VARCHAR   NOT NULL,
    created     TIMESTAMP NOT NULL,
    last_update TIMESTAMP NOT NULL
);

CREATE TABLE products
(
    id          INTEGER PRIMARY KEY DEFAULT nextval('global_seq'),
    description VARCHAR   NOT NULL,
    image       BYTEA     NOT NULL,
    price       INTEGER   NOT NULL,
    created     TIMESTAMP NOT NULL,
    last_update TIMESTAMP NOT NULL,
    type_id     INTEGER   NOT NULL,
    FOREIGN KEY (type_id) REFERENCES types (id)
);

CREATE TABLE orders
(
    id          INTEGER PRIMARY KEY DEFAULT nextval('global_seq'),
    status      VARCHAR   NOT NULL,
    user_id     INTEGER   NOT NULL,
    created     TIMESTAMP NOT NULL,
    last_update TIMESTAMP NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE TABLE ordered_products
(
    order_id   INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    CONSTRAINT PK_ORDERED_PRODUCT PRIMARY KEY (order_id, product_id)
);
