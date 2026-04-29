
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('f',
                    'm')
     AND name_pcode_nf IN ('A2413',
                           'B4251',
                           'D4316',
                           'D52',
                           'D5214',
                           'D5265',
                           'F6526',
                           'H412',
                           'J3152',
                           'K526',
                           'K6216',
                           'L2425',
                           'M6125',
                           'N313',
                           'N3231',
                           'N3562',
                           'R4136',
                           'T5216')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE rt.role IN ('actor',
                   'actress',
                   'miscellaneous crew',
                   'producer',
                   'writer')
  AND it1.id IN ('19')
  AND (ci.note IN ('(producer)',
                   '(uncredited)',
                   '(vault manager)',
                   '(writer)')
       OR ci.note IS NULL);