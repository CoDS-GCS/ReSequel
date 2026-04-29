WITH valid_persons AS
  (SELECT n.id
   FROM name AS n
   JOIN aka_name AS an ON n.id = an.person_id
   WHERE n.gender IN ('m')
     AND n.name_pcode_nf IN ('G6351',
                           'H2415',
                           'I2543',
                           'J5163',
                           'R4614',
                           'W4521'))
SELECT COUNT(*)
FROM valid_persons vp
JOIN cast_info ci ON vp.id = ci.person_id
JOIN role_type rt ON ci.role_id = rt.id
JOIN person_info pi1 ON vp.id = pi1.person_id
JOIN info_type it1 ON pi1.info_type_id = it1.id
WHERE rt.role IN ('actor',
                   'producer',
                   'writer')
  AND it1.id IN ('25')
  AND (ci.note IN ('(creator)',
                   '(senior executive producer)',
                   '(uncredited)')
       OR ci.note IS NULL);