-- 1. Создайте функцию, которая принимает кол-во сек и форматирует их в кол-во дней, часов, минут и секунд.
-- 	  Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

DELIMITER //
CREATE FUNCTION getTime ( val INT ) 
RETURNS CHAR(80)
DETERMINISTIC
BEGIN
	DECLARE DD CHAR(3);
	DECLARE HH, MI, SS CHAR(2);
	DECLARE result CHAR(80);
	SET DD = cast(floor(val/60/60/24) AS CHAR(3));
	SET HH = cast(floor(mod(val/60/60/24,1)*24) AS CHAR(2));
	SET MI = cast(floor(mod(mod(val/60/60/24,1)*24,1)*60) AS CHAR(2));
	SET SS = cast(round(mod(mod(mod(val/60/60/24,1)*24,1)*60,1)*60) AS CHAR(2));
	SET result = concat(DD,' days ',HH,' hours ',MI,' minutes ',SS, ' seconds ');
	RETURN result;
END; //
DELIMITER ;

DROP FUNCTION getTime;

SELECT getTime(1234567) AS Get_Time_Function; -- result : 14 days 6 hours 56 minutes 7 seconds

-- 2. Выведите только четные числа от 1 до 10 включительно. (Через функцию / процедуру)
-- 	  Пример: 2,4,6,8,10 (можно сделать через шаг +  2: х = 2, х+=2)
DELIMITER //
CREATE PROCEDURE showEvenNumbers()
DETERMINISTIC
BEGIN
	DECLARE result CHAR(30);
    DECLARE temp CHAR(5);
    DECLARE i INT;
    SET i = 0;
    SET result = "";
    WHILE (i <= 10) DO
		BEGIN
			IF (i % 2 = 0) THEN
				IF (i = 10) THEN
					SET temp = i;
				ELSE
					SET temp = CONCAT(i, ',');
				END IF;
                SET result = CONCAT(result, temp);
			END IF;
            SET i = i + 1;
		END;
	END WHILE;
    SELECT result;
END; //
DELIMITER ;

DROP PROCEDURE showEvenNumbers;
CALL showEvenNumbers();

