WITH name_an AS
  (SELECT n.id AS person_id
   FROM name AS n
   JOIN aka_name AS an ON n.id = an.person_id
   WHERE n.gender IS NULL
     AND n.name_pcode_nf IN ('C6231',
                           'E5412',
                           'G2312',
                           'J2535',
                           'K454',
                           'M6416',
                           'O4165',
                           'R2162',
                           'R52',
                           'S1532',
                           'S5653',
                           'W4523')),
     name_an_pi AS
  (SELECT na.person_id
   FROM name_an AS na
   JOIN person_info AS pi1 ON na.person_id = pi1.person_id
   JOIN info_type AS it1 ON pi1.info_type_id = it1.id
   WHERE it1.id IN ('25'))
SELECT COUNT(*)
FROM name_an_pi AS napi
JOIN cast_info AS ci ON napi.person_id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE rt.role IN ('director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer')
  AND (ci.note IN ('(associate director)',
                   '(executive producer) (as Kylie M. Balagtas)',
                   '(executive producer: BBC)',
                   '(first assistant accountant) (uncredited)',
                   '(production assistant)',
                   '(production coordinator)',
                   '(supervising producer)',
                   '(writer)')
       OR ci.note IS NULL);