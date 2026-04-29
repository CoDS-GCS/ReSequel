WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     AND name_pcode_nf IN ('A6351',
                           'B6321',
                           'B6535',
                           'C2612',
                           'D1365',
                           'E6212',
                           'G125',
                           'G3526',
                           'G4513',
                           'H6315',
                           'J2561',
                           'J26',
                           'J5153',
                           'J5215',
                           'K252',
                           'L535',
                           'O3452',
                           'R2421',
                           'R2631',
                           'S452',
                           'T6142',
                           'T6263',
                           'W4636',
                           'X5361'))
SELECT COUNT(*)
FROM filtered_name AS fn
JOIN cast_info AS ci ON fn.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON fn.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON fn.id = an.person_id
WHERE rt.role IN ('actor',
                   'composer',
                   'director',
                   'production designer',
                   'writer')
  AND it1.id IN ('22')
  AND (ci.note IN ('(credit only)',
                   '(uncredited)',
                   '(writer)')
       OR ci.note IS NULL);