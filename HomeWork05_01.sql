USE lesson1;

CREATE TABLE Cars
(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    mark VARCHAR(20) NOT NULL,
    cost INT
);

SHOW VARIABLES LIKE "secure_file_priv"; -- Проверить путь до папки, куда нужно скидывать файлы (иначе выдает ошибку "The MySQL server is running with the -secure-file-priv option")

LOAD DATA LOCAL INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/test_db.csv" INTO TABLE Cars; -- Выбран абсолютный путь до файла.

INSERT INTO Cars(mark, cost)
VALUES
	("Audi", 52642),
    ("Mercedes", 57127),
    ("Skoda", 9000),
    ("Volvo", 29000),
    ("Bentley", 35000),
    ("Citroen", 21000),
    ("Hummer", 41400),
    ("Volkswagen", 21600);

-- 1. Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов
CREATE VIEW CarsLowCost AS
SELECT id, mark, cost
FROM Cars
WHERE cost < 25000;

SELECT *
FROM CarsLowCost;

-- 2. Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW) 
ALTER VIEW CarsLowCost AS
SELECT id, mark, cost
FROM Cars
WHERE cost < 30000;

SELECT *
FROM CarsLowCost;

-- 3. Создайте представление, в котором будут только автомобили марки "Шкода" и "Ауди"
CREATE VIEW Skoda_Audi_Table AS
SELECT id, mark, cost
FROM Cars
WHERE mark = "Skoda" OR mark = "Audi";

SELECT *
FROM Skoda_Audi_Table;

    
    
		

