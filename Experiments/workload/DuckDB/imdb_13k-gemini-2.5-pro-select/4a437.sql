WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     AND name_pcode_nf IN ('A5315',
                           'D6436',
                           'G6312',
                           'J124',
                           'M6351',
                           'O262',
                           'P3265',
                           'P3625',
                           'P4143',
                           'W4536'))
SELECT COUNT(*)
FROM filtered_name AS fn
JOIN cast_info AS ci ON fn.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON fn.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON fn.id = an.person_id
WHERE rt.role IN ('actor',
                   'cinematographer',
                   'producer',
                   'writer')
  AND it1.id IN ('26')
  AND (ci.note IN ('(executive producer)',
                   '(uncredited)',
                   '(writer)')
       OR ci.note IS NULL);