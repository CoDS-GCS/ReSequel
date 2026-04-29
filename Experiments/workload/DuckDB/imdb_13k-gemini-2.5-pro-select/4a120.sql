WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     AND name_pcode_nf IN ('A3232',
                           'A3652',
                           'A645',
                           'B4353',
                           'B6562',
                           'G5256',
                           'G6326',
                           'J2126',
                           'K1625',
                           'K2161',
                           'P1545',
                           'R5645'))
SELECT COUNT(*)
FROM filtered_name AS fn
JOIN cast_info AS ci ON fn.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON fn.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON fn.id = an.person_id
WHERE rt.role IN ('actor',
                   'cinematographer',
                   'editor',
                   'writer')
  AND it1.id IN ('31')
  AND (ci.note IN ('(creator)',
                   '(uncredited)',
                   '(writer)')
       OR ci.note IS NULL);