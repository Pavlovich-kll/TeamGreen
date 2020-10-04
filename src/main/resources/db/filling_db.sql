DELETE FROM user_roles;
DELETE FROM users;
DELETE FROM wallets;
DELETE FROM products;
DELETE FROM types;
DELETE FROM ordered_products;
DELETE FROM orders;
ALTER SEQUENCE global_seq RESTART WITH 1;

INSERT INTO user_roles (user_id, role)
VALUES (1, 'ADMIN'),
       (2, 'USER'),
       (3, 'USER'),
       (4, 'USER');


INSERT INTO users (user_id, name, email, password, wallet_id)
VALUES (1, 'Admin', 'admin@gmail.com', 'admin', 1),
       (2, 'User1', 'user@yandex.ru', 'password', 2),
       (3, 'User2', 'user@yandex.ru', 'password', 3),
       (4, 'User3', 'user@yandex.ru', 'password', 4);


INSERT INTO wallets (user_id, balance)
VALUES (1, 100.0),
       (2, 5000.0),
       (3, 0.0),
       (4, 120000.0);


INSERT INTO types (id, name)
VALUES (1, 'Рыбки'),
       (2, 'Аквариумы'),
       (3, 'Аксессуары'),
       (4, 'Корм'),
       (5, 'Лекарства');
