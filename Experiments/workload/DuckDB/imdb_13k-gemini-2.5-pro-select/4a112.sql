
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('f',
                    'm')
     AND name_pcode_nf IN ('A3651',
                           'A5365',
                           'B6324',
                           'B6536',
                           'G1645',
                           'H4521',
                           'J5253',
                           'J54',
                           'J565',
                           'M3452',
                           'M4262',
                           'M6254',
                           'P3623',
                           'T5214',
                           'V4356')) AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE ci.note IS NULL
  AND rt.role IN ('actor',
                   'actress')
  AND it1.id IN ('32');