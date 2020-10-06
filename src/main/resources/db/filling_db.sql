DELETE FROM user_roles;
DELETE FROM users;
DELETE FROM wallets;
DELETE FROM products;
DELETE FROM product_types;
DELETE FROM ordered_products;
DELETE FROM orders;
ALTER SEQUENCE global_seq RESTART WITH 1;

INSERT INTO user_roles (user_id, role)
VALUES (1, 'ADMIN'),
       (2, 'USER'),
       (3, 'USER'),
       (4, 'USER');


INSERT INTO users (id, name, email, password, wallet_id)
VALUES (1, 'Admin', 'admin@gmail.com', 'admin', 1),
       (2, 'User1', 'user@yandex.ru', 'password', 2),
       (3, 'User2', 'user@yandex.ru', 'password', 3),
       (4, 'User3', 'user@yandex.ru', 'password', 4);


INSERT INTO wallets (user_id, balance)
VALUES (1, 100.0),
       (2, 5000.0),
       (3, 0.0),
       (4, 120000.0);


INSERT INTO product_types (product_id, type)
VALUES (1, 'Рыбки'),
       (2, 'Аквариумы'),
       (3, 'Аксессуары'),
       (4, 'Корм'),
       (5, 'Лекарства');

INSERT INTO products (id, created, last_updated, description, name, image, price)
VALUES (1, '2004-10-19 10:23:54','2004-10-19 10:23:54', 'Карп кои M (15-17 см)', 'Рыбки',lo_import('./src/main/resources/image/fish/карп_кои.jpg'),1500),
       (2, '2004-10-19 10:23:54','2004-10-19 10:23:54', 'Карп кои L (25-30 см)', 'Рыбки',lo_import('./src/main/resources/image/fish/карп_кои.jpg'),8000),
       (3, '2004-10-19 10:23:54','2004-10-19 10:23:54', 'Карп М (18-20 см)','Рыбки',lo_import('./src/main/resources/image/fish/карп.jpg'),400),
       (4, '2004-10-19 10:23:54','2004-10-19 10:23:54', 'Аквариумный комплекс 830*390*610мм, 195л','Аквариумы',lo_import('./src/main/resources/image/aquarium/аквариум_1.jpg'),28100),
       (5, '2004-10-19 10:23:54','2004-10-19 10:23:54', 'Аквариум многогранник  585х345х410мм, 55л','Аквариумы',lo_import('./src/main/resources/image/aquarium/аквариум_2.jpg'),5675),
       (6, '2004-10-19 10:23:54','2004-10-19 10:23:54', 'Аквариум, 120х50х70 см, белый, Т5 4х54Вт, 375л','Аквариумы',lo_import('./src/main/resources/image/aquarium/аквариум_2.jpg'),92475),
       (7, '2004-10-19 10:23:54','2004-10-19 10:23:54', 'Декор Сундук на гроте','Аксессуары',lo_import('./src/main/resources/image/accessories/сундук.jpg'),975),
       (8, '2004-10-19 10:23:54','2004-10-19 10:23:54', 'Полный набор декораций для аквариума','Аксессуары',lo_import('./src/main/resources/image/accessories/декорации.jpg'),19500),
       (9, '2004-10-19 10:23:54','2004-10-19 10:23:54', 'Натуральный грунт для аквариумов "Красный гравий"','Аксессуары',lo_import('./src/main/resources/image/accessories/грунт.jpg'),485),
       (10, '2004-10-19 10:23:54','2004-10-19 10:23:54', 'Основной корм в форме крупных хлопьев для крупных видов рыб, 1000мл','Корм',lo_import('./src/main/resources/image/feed/корм_крупный.jpg'),1295),
       (11, '2004-10-19 10:23:54','2004-10-19 10:23:54', 'Основной корм класса премиум в форме гранул для маленьких рыб, 250мл','Корм', lo_import('./src/main/resources/image/feed/корм_маленький.jpg'),830),
       (12, '2004-10-19 10:23:54','2004-10-19 10:23:54', 'Основной корм для всех видов рыб, хлопья, 250мл','Корм',lo_import('./src/main/resources/image/feed/корм_универсальный.jpg'),425),
       (13, '2004-10-19 10:23:54','2004-10-19 10:23:54', 'Кондиционер для аквариумной воды,50 мл','Лекарства',lo_import('./src/main/resources/image/medicines/кондиционер.jpg'),65),
       (14, '2004-10-19 10:23:54','2004-10-19 10:23:54', 'Для борьбы с бактериальными инфекциями воды, 30 ампул','Лекарства',lo_import('./src/main/resources/image/medicines/бактерии.jpg'),3340),
       (15, '2004-10-19 10:23:54','2004-10-19 10:23:54', 'Антигрибковый препарат для рыбок, 118мл','Лекарства',lo_import('./src/main/resources/image/medicines/антигрибок.jpg'),720);

insert into orders (id, created, last_updated, status, user_id)
values (1, '2004-10-19 10:23:54','2004-10-19 10:23:54', 'NEW',2),
       (2, '2004-10-19 10:23:54','2004-10-19 10:23:54', 'IN_PROCESSING',3),
       (3, '2004-10-19 10:23:54','2004-10-19 10:23:54', 'SENT',4),
       (4, '2004-10-19 10:23:54','2004-10-19 10:23:54', 'CANCELED',4),
       (5, '2004-10-19 10:23:54','2004-10-19 10:23:54', 'DELIVERED',2);

