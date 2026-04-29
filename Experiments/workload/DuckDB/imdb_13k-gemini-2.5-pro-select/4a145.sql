WITH valid_persons AS
  (SELECT n.id
   FROM name AS n
   JOIN aka_name AS an ON n.id = an.person_id
   WHERE n.gender IN ('m')
     AND n.name_pcode_nf IN ('B6516',
                           'C6265',
                           'E4525',
                           'G2136',
                           'H4136',
                           'H6436',
                           'I245',
                           'J2516',
                           'K6235',
                           'M2432',
                           'M2624',
                           'N3532',
                           'P3252',
                           'P4265',
                           'P6414',
                           'T532',
                           'V6253'))
SELECT COUNT(*)
FROM valid_persons vp
JOIN cast_info ci ON vp.id = ci.person_id
JOIN role_type rt ON ci.role_id = rt.id
JOIN person_info pi1 ON vp.id = pi1.person_id
JOIN info_type it1 ON pi1.info_type_id = it1.id
WHERE rt.role IN ('actor',
                   'composer',
                   'director',
                   'editor',
                   'producer',
                   'writer')
  AND it1.id IN ('26')
  AND (ci.note IN ('(characters)',
                   '(consulting producer)',
                   '(field producer)',
                   '(producer)',
                   '(uncredited)')
       OR ci.note IS NULL);