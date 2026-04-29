WITH filtered_roles AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('cinematographer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer')),
     filtered_info_types AS
  (SELECT id
   FROM info_type
   WHERE id IN ('31'))
SELECT COUNT(*)
FROM name AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN filtered_roles AS rt ON ci.role_id = rt.id
JOIN filtered_info_types AS it1 ON pi1.info_type_id = it1.id
WHERE n.gender IS NULL
  AND (n.name_pcode_nf IN ('B6512',
                           'C6236',
                           'D5425',
                           'J2145',
                           'J2152',
                           'J2536',
                           'L2512',
                           'L5264',
                           'L626',
                           'M2416',
                           'M3262',
                           'P4515',
                           'R1632',
                           'R525',
                           'S6252')
       OR n.name_pcode_nf IS NULL)
  AND (ci.note IN ('(continuity)',
                   '(producer)',
                   '(production assistant)',
                   '(production coordinator)',
                   '(script supervisor)',
                   '(segment producer)',
                   '(supervising producer)',
                   '(technical advisor)',
                   '(writer)')
       OR ci.note IS NULL);