WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     AND name_pcode_nf IN ('A263',
                           'A4252',
                           'B1435',
                           'B6362',
                           'D1326',
                           'D1512',
                           'D56',
                           'E325',
                           'E5354',
                           'J1251',
                           'J2513',
                           'L25',
                           'M2413',
                           'M2453',
                           'M62',
                           'P3653',
                           'P61',
                           'R2626',
                           'S2535',
                           'T6425',
                           'V3452'))
SELECT COUNT(*)
FROM filtered_name AS fn
JOIN cast_info AS ci ON fn.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON fn.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON fn.id = an.person_id
WHERE rt.role IN ('actor',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer')
  AND it1.id IN ('31')
  AND (ci.note IN ('(as Pedro Armendariz)',
                   '(consulting producer)',
                   '(creator)',
                   '(producer)',
                   '(script supervisor)',
                   '(supervising producer)',
                   '(uncredited)',
                   '(voice)',
                   '(voice: English version)')
       OR ci.note IS NULL);