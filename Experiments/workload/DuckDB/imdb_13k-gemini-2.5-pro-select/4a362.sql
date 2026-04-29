WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('f',
                    'm')
     AND name_pcode_nf IN ('C6231',
                           'J562',
                           'L216',
                           'L24',
                           'N2421')),
     filtered_cast_info AS
  (SELECT person_id,
          role_id
   FROM cast_info
   WHERE note IS NULL),
     filtered_role_type AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'actress',
                   'director'))
SELECT COUNT(*)
FROM filtered_name AS n
JOIN filtered_cast_info AS ci ON n.id = ci.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN filtered_role_type AS rt ON rt.id = ci.role_id
WHERE pi1.info_type_id IN ('22');