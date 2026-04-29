
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN person_info AS pi ON n.id = pi.person_id
JOIN info_type AS it1 ON pi.info_type_id = it1.id
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('m')
       OR n.gender IS NULL)
  AND n.name_pcode_nf IN ('A4163',
                           'A6365',
                           'B6536',
                           'C6216',
                           'G624',
                           'G6263',
                           'H6432',
                           'J516',
                           'J562',
                           'J6524',
                           'M6353',
                           'N2416',
                           'N2425')
  AND ci.note IS NULL
  AND rt.role IN ('actor')
  AND it1.id IN ('37');