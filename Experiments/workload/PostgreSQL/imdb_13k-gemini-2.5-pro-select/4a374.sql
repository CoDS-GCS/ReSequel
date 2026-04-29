WITH filtered_names AS
  (SELECT id
   FROM name
   WHERE (gender IN ('f')
          OR gender IS NULL)
     AND name_pcode_nf IN ('A4253',
                           'B6164',
                           'C3656',
                           'D525',
                           'F6524',
                           'J5616',
                           'K452',
                           'L25',
                           'M2416',
                           'M2525',
                           'M6245',
                           'S4125',
                           'T6216',
                           'T6253'))
SELECT COUNT(*)
FROM filtered_names AS fn
JOIN cast_info AS ci ON fn.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN person_info AS pi ON fn.id = pi.person_id
JOIN info_type AS it1 ON pi.info_type_id = it1.id
JOIN aka_name AS an ON fn.id = an.person_id
WHERE ci.note IS NULL
  AND rt.role IN ('actress',
                   'editor')
  AND it1.id IN ('22');