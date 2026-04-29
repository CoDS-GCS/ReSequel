WITH filtered_pi AS
  (SELECT pi1.person_id
   FROM person_info AS pi1
   JOIN info_type AS it1 ON pi1.info_type_id = it1.id
   WHERE it1.id IN ('32')),
     filtered_ci AS
  (SELECT ci.person_id
   FROM cast_info AS ci
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE rt.role IN ('composer',
                   'costume designer',
                   'director',
                   'miscellaneous crew',
                   'producer',
                   'production designer',
                   'writer')
     AND (ci.note IN ('(creator)',
                   '(executive producer)',
                   '(location manager)',
                   '(novel)',
                   '(original idea)',
                   '(producer)',
                   '(producer: ORF)',
                   '(production accountant)',
                   '(production assistant)',
                   '(script assistant)',
                   '(story editor) (as Li-an Poloyapoy)',
                   '(written by)')
          OR ci.note IS NULL))
SELECT COUNT(*)
FROM name AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN filtered_pi AS pi ON n.id = pi.person_id
JOIN filtered_ci AS ci ON n.id = ci.person_id
WHERE n.gender IS NULL
  AND n.name_pcode_nf IN ('A262',
                           'A5252',
                           'B3241',
                           'B616',
                           'D1314',
                           'D5451',
                           'J4314',
                           'K1535',
                           'K16',
                           'L5141',
                           'L5152',
                           'M2321',
                           'M252',
                           'N2421',
                           'N3541',
                           'P3616',
                           'P4215',
                           'R3265',
                           'Y5215');