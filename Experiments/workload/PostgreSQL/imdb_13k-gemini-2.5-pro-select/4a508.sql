WITH filtered_pi AS
  (SELECT person_id
   FROM person_info
   WHERE info_type_id IN ('34')),
     filtered_ci AS
  (SELECT person_id
   FROM cast_info ci
   JOIN role_type rt ON ci.role_id = rt.id
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
          OR ci.note IS NULL))
SELECT COUNT(*)
FROM name n
JOIN aka_name an ON n.id = an.person_id
JOIN filtered_pi pi ON n.id = pi.person_id
JOIN filtered_ci ci ON n.id = ci.person_id
WHERE (n.gender IN ('f')
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
                           'T53'));