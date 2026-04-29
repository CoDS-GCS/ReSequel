
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('f',
                    'm')
     AND name_pcode_nf IN ('A5632',
                           'A6561',
                           'B6515',
                           'C2414',
                           'C6253',
                           'D1632',
                           'G1513',
                           'G4152',
                           'J1646',
                           'J36',
                           'J5142',
                           'J5261',
                           'K5164',
                           'L2625',
                           'M3163',
                           'M6264',
                           'O4262',
                           'R1524',
                           'R1632',
                           'R3132',
                           'R3254',
                           'R5341',
                           'T2352',
                           'Z246')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE rt.role IN ('actor',
                   'actress',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer')
  AND it1.id IN ('26')
  AND (ci.note IN ('(associate producer)',
                   '(credit only)',
                   '(executive producer)',
                   '(producer)',
                   '(story consultant)',
                   '(uncredited)',
                   '(voice) (uncredited)',
                   '(voice)',
                   '(voice: English version)')
       OR ci.note IS NULL);