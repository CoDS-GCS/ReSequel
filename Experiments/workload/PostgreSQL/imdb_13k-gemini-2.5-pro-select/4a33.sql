WITH valid_persons AS
  (SELECT n.id
   FROM name AS n
   JOIN aka_name AS an ON n.id = an.person_id
   WHERE n.gender IN ('f')
     AND n.name_pcode_nf IN ('A5325',
                           'B5365',
                           'E4253',
                           'F1656',
                           'H3456',
                           'L2',
                           'M4145',
                           'N3246',
                           'W5324'))
SELECT COUNT(*)
FROM valid_persons vp
JOIN cast_info ci ON vp.id = ci.person_id
JOIN role_type rt ON ci.role_id = rt.id
JOIN person_info pi1 ON vp.id = pi1.person_id
JOIN info_type it1 ON pi1.info_type_id = it1.id
WHERE rt.role IN ('actress',
                   'miscellaneous crew',
                   'producer')
  AND it1.id IN ('19')
  AND (ci.note IN ('(executive producer: TV2)',
                   '(production coordinator)',
                   '(publicist) (uncredited)',
                   '(script supervisor)',
                   '(voice)')
       OR ci.note IS NULL);