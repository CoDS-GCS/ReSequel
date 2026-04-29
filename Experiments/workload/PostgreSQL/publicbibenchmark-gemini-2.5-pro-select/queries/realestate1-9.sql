
SELECT COUNT(*) AS sumnumberofrecordsok,
       EXTRACT(YEAR
               FROM date_of_transfer)::INT AS yrdateoftransferok
FROM realestate11
WHERE EXTRACT(YEAR
              FROM date_of_transfer) IN ('2005', '2006', '2007', '2008', '2009', '2010', '2011', '2012', '2013', '2014')
GROUP BY yrdateoftransferok;