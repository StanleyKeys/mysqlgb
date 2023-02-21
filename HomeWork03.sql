USE lesson1;

-- CREATE TABLE - создает базу данных
CREATE TABLE Staff
(
	Id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    post VARCHAR(20),
    seniority INT,
    salary INT,
    age INT
);

INSERT INTO Staff (first_name, last_name, post, seniority, salary, age)
VALUES
('Вася', 'Петров', 'Начальник', 40, 100000, 60),
('Петр', 'Власов', 'Начальник', 8, 70000, 30),
('Катя', 'Катина', 'Инженер', 2, 70000, 25),
('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
('Иван', 'Иванов', 'Рабочий', 40, 30000, 59),
('Петр', 'Петров', 'Рабочий', 20, 25000, 40),
('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
('Максим', 'Максимов', 'Рабочий', 2, 11000, 22),
('Юрий', 'Галкин', 'Рабочий', 3, 12000, 24),
('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);

-- 1. Отсортируйте данные по полю заработная плата (salary) в порядке: убывания;
SELECT * FROM Staff
ORDER BY salary DESC;

-- 2. Выведите 5 максимальных заработных плат (salary);
SELECT * FROM Staff
ORDER BY salary DESC
LIMIT 5;

-- 3. Посчитайте суммарную зарплату (salary) по каждой специальности (post);
SELECT post, SUM(salary) AS Summary
FROM Staff
GROUP BY post;

-- 4. Найдите кол-во сотрудников со специальностью (post) "Рабочий" в возрасте от 24 до 49 лет включительно. 
SELECT post, COUNT(post) AS count
FROM Staff
WHERE post = 'Рабочий' AND age > 24 AND age <=49;

SELECT * FROM Staff
WHERE post = 'Рабочий' AND age > 24 AND age <=49;

-- 5. Найдите количество специальностей.
SELECT post, COUNT(post) AS amount
FROM Staff
GROUP BY post; 

-- 6. Выведите специальности, у которых средний возраст сотрудников меньше 30 лет.
SELECT post, AVG(age) AS average
FROM Staff
GROUP BY post
HAVING AVG(age) < 30;