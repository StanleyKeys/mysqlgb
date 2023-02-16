-- Создание БД
CREATE DATABASE homework01; -- Создали БД

-- Подключение к БД 
USE homework01; -- Мы рабоатем в homework01

-- Создание таблицы
CREATE TABLE smartphone -- создание таблички smartphone
(
	-- Здесь идут столбцы нашей таблицы 
    -- имя_столбца тип_данных ограничения 
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, -- столбец id - первичный ключ 
    model VARCHAR(30) NOT NULL, -- строчка на 30 символов для модели
    manufacturer VARCHAR(30), -- строчка на 30 символов для Производителя
    prduct_count INT, -- целочисленная переменная для количества товаров
    price INT -- целочисленная переменная для стоимости
);
-- Заполнение таблицы какими-то данными
-- INSERT table_name(column1, column2)
-- VALUES (value1, value2)

INSERT smartphone(model, manufacturer, prduct_count, price)
VALUES
	("iPhone 10", "Apple", 1, 76000), 		-- id = 1
    ("iPhone 8", "Apple", 15, 51000),	-- id = 2
    ("iPhone 9", "Apple", 3, 68000),-- id = 3
    ("iPhone 11", "Apple", 6, 47000),-- id = 4
    ("Galaxy Note", "Samsung", 17, 80000), -- id = 5
    ("Galaxy S22", "Samsung", 11, 74000), -- id = 6
    ("Galaxy S9", "Samsung", 9, 11000), 		-- id = 7
    ("Galaxy A10", "Samsung", 24, 9000),	-- id = 8
    ("Galaxy M52", "Samsung", 3, 27000),-- id = 9
    ("P20 Pro", "Huawei", 34, 27000),-- id = 10
    ("Rog Phone 5", "Asus", 1, 88000), -- id = 11
    ("Zenfone 9", "Asus", 20, 64000); -- id = 12
    
-- Выведите название, производителя и цену для товаров, количество которых превышает 2
SELECT model, manufacturer, price
FROM smartphone
WHERE prduct_count > 2;

-- Выведите весь ассортимент товаров марки “Samsung”
SELECT *
FROM smartphone
WHERE manufacturer = "Samsung";
