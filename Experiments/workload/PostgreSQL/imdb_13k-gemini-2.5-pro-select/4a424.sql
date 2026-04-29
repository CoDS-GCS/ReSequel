
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     AND name_pcode_nf IN ('A263',
                           'A4252',
                           'B1435',
                           'B6362',
                           'D1326',
                           'D1512',
                           'D56',
                           'E325',
                           'E5354',
                           'J1251',
                           'J2513',
                           'L25',
                           'M2413',
                           'M2453',
                           'M62',
                           'P3653',
                           'P61',
                           'R2626',
                           'S2535',
                           'T6425',
                           'V3452')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN
  (SELECT person_id,
          role_id
   FROM cast_info
   WHERE note IN ('(as Pedro Armendariz)',
                   '(consulting producer)',
                   '(creator)',
                   '(producer)',
                   '(script supervisor)',
                   '(supervising producer)',
                   '(uncredited)',
                   '(voice)',
                   '(voice: English version)')
     OR note IS NULL) AS ci ON n.id = ci.person_id
JOIN
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer')) AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN
  (SELECT id
   FROM info_type
   WHERE id IN ('31')) AS it1 ON pi1.info_type_id = it1.id;