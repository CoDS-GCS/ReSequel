
SELECT commongovernment13.prodorservcodedesc,
       MIN(commongovernment13.prodorservcode) AS prodorservcode,
       SUM(commongovernment13.obligatedamount) AS sumobligatedamountok
FROM commongovernment13
GROUP BY commongovernment13.prodorservcodedesc;