WITH valid_persons AS
  (SELECT n.id
   FROM name AS n
   JOIN aka_name AS an ON n.id = an.person_id
   WHERE n.gender IN ('m')
     AND n.name_pcode_nf IN ('C6361',
                           'F6524',
                           'G5125',
                           'J2323',
                           'J6134',
                           'R1563',
                           'R1632',
                           'S2351',
                           'W3134'))
SELECT COUNT(*)
FROM valid_persons vp
JOIN cast_info ci ON vp.id = ci.person_id
JOIN role_type rt ON ci.role_id = rt.id
JOIN person_info pi1 ON vp.id = pi1.person_id
JOIN info_type it1 ON pi1.info_type_id = it1.id
WHERE rt.role IN ('actor',
                   'producer',
                   'writer')
  AND it1.id IN ('34')
  AND (ci.note IN ('(executive producer: FUNimation Entertainment)',
                   '(head writer)',
                   '(uncredited)',
                   '(voice)')
       OR ci.note IS NULL);