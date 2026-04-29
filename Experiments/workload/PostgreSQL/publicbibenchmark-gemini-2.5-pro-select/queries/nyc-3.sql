
SELECT nyc2.borough,
       nyc2.complaint_type
FROM nyc2
WHERE nyc2.borough BETWEEN 'BRONX' AND 'STATEN ISLAND'
GROUP BY nyc2.borough,
         nyc2.complaint_type;