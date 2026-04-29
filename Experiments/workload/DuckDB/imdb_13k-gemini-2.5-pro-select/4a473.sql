
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE (gender IN ('m')
          OR gender IS NULL)
     AND (name_pcode_nf IN ('A6526',
                           'D6412',
                           'E4516',
                           'I6152',
                           'J3163',
                           'M3253',
                           'P6256',
                           'R3264',
                           'R5141',
                           'R5245',
                           'S2524',
                           'T25')
          OR name_pcode_nf IS NULL)) AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actor',
                   'costume designer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer')
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
AND it1.id IN ('37')
WHERE (ci.note IN ('(adprom coordinator)',
                   '(executive producer)',
                   '(uncredited)')
       OR ci.note IS NULL);