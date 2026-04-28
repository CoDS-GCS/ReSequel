SELECT AVG(CAST(CAST(realestate11.price AS BIGINT) AS DOUBLE PRECISION)) AS avgpriceok
FROM realestate11
WHERE ((CAST(realestate11.date_of_transfer AS DATE) >= cast('2005-01-01' AS DATE))
       AND (CAST(realestate11.date_of_transfer AS DATE) <= cast('2015-03-31' AS DATE))
       AND (CAST(realestate11.date_of_transfer AS DATE) >= cast('1995-01-01' AS DATE))
       AND (CAST(realestate11.date_of_transfer AS DATE) <= cast('2015-03-31' AS DATE))
       AND (CAST(EXTRACT(YEAR
                         FROM realestate11.date_of_transfer) AS BIGINT) IN (2005,
                                                                            2006,
                                                                            2007,
                                                                            2008,
                                                                            2009,
                                                                            2010,
                                                                            2011,
                                                                            2012,
                                                                            2013,
                                                                            2014)))
HAVING (COUNT(1) > 0);