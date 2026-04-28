SELECT nyc2.borough AS borough,
       nyc2.complaint_type AS complaint_type,
       CAST(EXTRACT(QUARTER
                    FROM nyc2.created_date) AS BIGINT) AS qrcreateddateok,
       SUM(CAST(nyc2.number_of_records AS BIGINT)) AS sumnumberofrecordsok
FROM nyc2
WHERE ((nyc2.borough >= &&&)
       AND (nyc2.borough <= &&&)
       AND (nyc2.complaint_type IN (N_SSS)))
GROUP BY nyc2.borough,
         nyc2.complaint_type,
         qrcreateddateok;