WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     AND name_pcode_nf IN ('B124',
                           'B5346',
                           'B6346',
                           'C262',
                           'C4163',
                           'C6431',
                           'F4145',
                           'J413',
                           'L512',
                           'L5341',
                           'M1526',
                           'M6562',
                           'S6156',
                           'T2625',
                           'Y6253',
                           'Z52'))
SELECT COUNT(*)
FROM filtered_name AS fn
JOIN cast_info AS ci ON fn.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON fn.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON fn.id = an.person_id
WHERE rt.role IN ('actress',
                   'writer')
  AND it1.id IN ('31')
  AND (ci.note IN ('(uncredited)',
                   '(writer)')
       OR ci.note IS NULL);