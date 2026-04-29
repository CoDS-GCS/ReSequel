
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     AND name_pcode_nf IN ('A352',
                           'A6312',
                           'D1325',
                           'D5265',
                           'E4164',
                           'F5256',
                           'J5123',
                           'J5351',
                           'J5431',
                           'J6252',
                           'N2416',
                           'T3232',
                           'V5425')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE rt.role IN ('actor',
                   'composer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer')
  AND it1.id IN ('26')
  AND (ci.note IN ('(acting director)',
                   '(archive footage)',
                   '(associate producer)',
                   '(executive producer)',
                   '(lead editor)',
                   '(producer)',
                   '(uncredited)')
       OR ci.note IS NULL);