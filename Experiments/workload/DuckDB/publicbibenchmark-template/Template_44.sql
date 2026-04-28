SELECT nyc2.borough AS borough,
       nyc2.complaint_type AS complaint_type
FROM nyc2
WHERE ((nyc2.borough >= &&&)
       AND (nyc2.borough <= &&&))
GROUP BY nyc2.borough,
         nyc2.complaint_type;