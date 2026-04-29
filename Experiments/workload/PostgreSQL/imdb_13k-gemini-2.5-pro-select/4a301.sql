
SELECT COUNT(*)
FROM name AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE n.gender IS NULL
  AND n.name_pcode_nf IN ('A5264',
                           'A6323',
                           'B6535',
                           'D1363',
                           'H256',
                           'H5265',
                           'J2141',
                           'J2356',
                           'J512',
                           'K364',
                           'L2152',
                           'L62',
                           'L623',
                           'M6321',
                           'M6515',
                           'N253',
                           'R625',
                           'S4151',
                           'W4514',
                           'W4521')
  AND (ci.note IN ('(assistant producer)',
                   '(character design)',
                   '(director of photography)',
                   '(production accountant)',
                   '(production assistant)',
                   '(production coordinator)',
                   '(scenario)',
                   '(senior supervising producer)',
                   '(series producer)',
                   '(story editor)',
                   '(supervising producer)')
       OR ci.note IS NULL)
  AND rt.role IN ('cinematographer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'production designer',
                   'writer')
  AND it1.id IN ('32');