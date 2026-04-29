
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE n.gender IN ('m')
  AND n.name_pcode_nf IN ('E3632',
                           'G5362',
                           'K25',
                           'M2434',
                           'N2423')
  AND ci.note IS NULL
  AND rt.role IN ('actor')
  AND it1.id IN ('25');