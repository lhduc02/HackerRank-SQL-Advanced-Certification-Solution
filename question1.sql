SELECT Q1.algorithm, transactions_Q1, transactions_Q2, transactions_Q3, transactions_Q4
FROM
    (SELECT `algorithm`, SUM(`volume`) AS transactions_Q1
    FROM coins AS c
    JOIN transactions AS t
    ON c.code = t.coin_code
    WHERE DATE(t.dt) BETWEEN '2020-01-01' AND '2020-03-31'
    GROUP BY `algorithm`) AS Q1
JOIN
    (SELECT `algorithm`, SUM(`volume`) AS transactions_Q2
    FROM coins AS c
    JOIN transactions AS t
    ON c.code = t.coin_code
    WHERE DATE(t.dt) BETWEEN '2020-04-01' AND '2020-06-30'
    GROUP BY `algorithm`) AS Q2
ON Q1.algorithm = Q2.algorithm
JOIN
    (SELECT `algorithm`, SUM(`volume`) AS transactions_Q3
    FROM coins AS c
    JOIN transactions AS t
    ON c.code = t.coin_code
    WHERE DATE(t.dt) BETWEEN '2020-07-01' AND '2020-09-30'
    GROUP BY `algorithm`) AS Q3
ON Q1.algorithm = Q3.algorithm
JOIN
    (SELECT `algorithm`, SUM(`volume`) AS transactions_Q4
    FROM coins AS c
    JOIN transactions AS t
    ON c.code = t.coin_code
    WHERE DATE(t.dt) BETWEEN '2020-10-01' AND '2020-12-31'
    GROUP BY `algorithm`) AS Q4
ON Q1.algorithm = Q4.algorithm
ORDER BY Q1.algorithm;
