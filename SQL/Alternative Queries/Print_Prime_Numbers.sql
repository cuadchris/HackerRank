--https://www.hackerrank.com/challenges/print-prime-numbers/problem

CREATE TABLE Prime_Numbers (number INT);

DECLARE @num INT;
DECLARE @divisor INT;
DECLARE @is_prime BIT;

SELECT @num = 2;

WHILE @num <= 1000
    BEGIN
    SELECT @divisor = @num - 1;
    SELECT @is_prime = 1;
    WHILE @divisor > 1
        BEGIN
        IF @num % @divisor = 0
            SELECT @is_prime = 0;
        SELECT @divisor = @divisor - 1         
        END
    IF @is_prime = 1
        INSERT INTO Prime_Numbers (number) VALUES (@num);
    
    SELECT @num = @num + 1
    END

SELECT STRING_AGG(number,'&') FROM Prime_Numbers;