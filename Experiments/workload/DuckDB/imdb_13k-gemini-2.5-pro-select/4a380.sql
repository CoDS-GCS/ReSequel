WITH filtered_names AS
  (SELECT id
   FROM name
   WHERE (gender IN ('m')
          OR gender IS NULL)
     AND name_pcode_nf IN ('A4515',
                           'C6235',
                           'C6242',
                           'J2356',
                           'J5363',
                           'J5436',
                           'T252'))
SELECT COUNT(*)
FROM filtered_names AS fn
JOIN cast_info AS ci ON fn.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN person_info AS pi ON fn.id = pi.person_id
JOIN info_type AS it1 ON pi.info_type_id = it1.id
JOIN aka_name AS an ON fn.id = an.person_id
WHERE ci.note IS NULL
  AND rt.role IN ('actor',
                   'cinematographer')
  AND it1.id IN ('32');