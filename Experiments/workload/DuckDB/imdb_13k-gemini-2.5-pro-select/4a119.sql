
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A3654',
                           'A6532',
                           'D5313',
                           'D5424',
                           'F4652',
                           'G2152',
                           'J2535',
                           'J4516',
                           'J5435',
                           'K6535',
                           'L5265',
                           'L6162',
                           'N2621',
                           'P3624',
                           'R5125',
                           'R5356',
                           'S1235',
                           'S3152'))
  AND (ci.note IN ('(actors director)',
                   '(co-producer)',
                   '(executive producer)',
                   '(producer: ORF)',
                   '(production assistant)',
                   '(script supervisor)',
                   '(supervising producer)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer')
  AND it1.id IN ('32');