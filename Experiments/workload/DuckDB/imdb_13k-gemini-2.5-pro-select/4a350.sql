WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     AND name_pcode_nf IN ('A2414',
                           'B162',
                           'B4616',
                           'C245',
                           'C5231',
                           'I656',
                           'J3251',
                           'J425',
                           'L2121',
                           'L3214',
                           'M2534',
                           'M4252',
                           'M4652',
                           'R2435',
                           'R52',
                           'S1231')),
     filtered_roles AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actress'))
SELECT COUNT(*)
FROM filtered_name AS fn
JOIN aka_name AS an ON fn.id = an.person_id
JOIN cast_info AS ci ON fn.id = ci.person_id
JOIN filtered_roles AS fr ON ci.role_id = fr.id
JOIN person_info AS pi1 ON fn.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE it1.id IN ('37')
  AND (ci.note IN ('(voice)')
       OR ci.note IS NULL);