
SELECT COUNT(*)
FROM role_type AS rt
JOIN cast_info AS ci ON rt.id = ci.role_id
JOIN name AS n ON ci.person_id = n.id
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON it1.id = pi1.info_type_id
WHERE rt.role IN ('actress',
                   'cinematographer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'production designer',
                   'writer')
  AND (ci.note IN ('(actors director)',
                   '(as Samia Smith)',
                   '(assistant accountant)',
                   '(producer)',
                   '(production assistant)')
       OR ci.note IS NULL)
  AND (n.gender IN ('f')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A2513',
                           'A4163',
                           'A5354',
                           'A6362',
                           'C623',
                           'C6235',
                           'D13',
                           'D16',
                           'E1465',
                           'G46',
                           'J2416',
                           'J2532',
                           'J5243',
                           'K3256',
                           'K5164',
                           'M26',
                           'M265',
                           'M6562',
                           'S523',
                           'S6252',
                           'T2542',
                           'T53'))
  AND it1.id IN ('34');