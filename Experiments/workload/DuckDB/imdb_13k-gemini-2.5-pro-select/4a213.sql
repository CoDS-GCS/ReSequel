
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE (n.gender IN ('f')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A562',
                           'C4641',
                           'D5212',
                           'G6262',
                           'G6316',
                           'G6352',
                           'I5216',
                           'J2126',
                           'L2416',
                           'L4513',
                           'M3245',
                           'P3245',
                           'P415',
                           'P4253',
                           'R23',
                           'S2135',
                           'Y1534'))
  AND (ci.note IN ('(co-producer)',
                   '(location manager)',
                   '(post-production producer)',
                   '(production assistance)',
                   '(production assistant) (as Donna Joy A. Pasion)',
                   '(researcher)',
                   '(script editor)',
                   '(script)',
                   '(story)')
       OR ci.note IS NULL)
  AND rt.role IN ('actress',
                   'cinematographer',
                   'composer',
                   'director',
                   'miscellaneous crew',
                   'producer',
                   'writer')
  AND it1.id IN ('34');