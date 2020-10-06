DROP TABLE IF EXISTS user_roles;
DROP TABLE IF EXISTS product_types;
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS wallets CASCADE;
DROP TABLE IF EXISTS products CASCADE;

DROP TABLE IF EXISTS types;
DROP TABLE IF EXISTS ordered_products;
DROP TABLE IF EXISTS orders;
DROP SEQUENCE IF EXISTS global_seq;

CREATE SEQUENCE global_seq START WITH 1;

CREATE TABLE users
(
    id          BIGINT PRIMARY KEY DEFAULT nextval('global_seq'),
    name        VARCHAR   NOT NULL,
    email       VARCHAR   NOT NULL,
    password    VARCHAR   NOT NULL,
    wallet_id   BIGINT    NOT NULL,
    created     TIMESTAMP NOT NULL,
    last_updated TIMESTAMP NOT NULL
);
CREATE UNIQUE INDEX users_unique_email_idx ON users (email);

CREATE TABLE user_roles
(
    user_id BIGINT NOT NULL,
    role    VARCHAR,
    CONSTRAINT user_roles_idx UNIQUE (user_id, role),
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

CREATE TABLE product_types
(
    product_id BIGINT NOT NULL,
    type       VARCHAR,
    CONSTRAINT product_types_unique_idx UNIQUE (product_id, type),
    FOREIGN KEY (product_id) REFERENCES users (id) ON DELETE CASCADE
);

CREATE TABLE wallets
(
    id          BIGINT PRIMARY KEY DEFAULT nextval('global_seq'),
    user_id     BIGINT    NOT NULL,

    balance     DECIMAL   NOT NULL,
    created     TIMESTAMP NOT NULL,
    last_updated TIMESTAMP NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

ALTER TABLE users
    ADD FOREIGN KEY (wallet_id) REFERENCES wallets (id) ON DELETE CASCADE;


CREATE TABLE products
(
    id          BIGINT PRIMARY KEY DEFAULT nextval('global_seq'),
    name        VARCHAR   NOT NULL,

    description VARCHAR   NOT NULL,
    image       oid     NOT NULL,
    price       INTEGER   NOT NULL,
    created     TIMESTAMP NOT NULL,
    last_updated TIMESTAMP NOT NULL

);

CREATE TABLE orders
(

    id          BIGINT PRIMARY KEY DEFAULT nextval('global_seq'),
    status      VARCHAR   NOT NULL,
    user_id     BIGINT    NOT NULL,

    created     TIMESTAMP NOT NULL,
    last_updated TIMESTAMP NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE TABLE ordered_products
(
    order_id   BIGINT NOT NULL,
    product_id BIGINT NOT NULL,

    CONSTRAINT PK_ORDERED_PRODUCT PRIMARY KEY (order_id, product_id)
);
