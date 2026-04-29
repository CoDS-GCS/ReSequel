
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     AND name_pcode_nf IN ('A3435',
                           'C6456',
                           'G6516',
                           'H3262',
                           'J464',
                           'K3452',
                           'K4124',
                           'L651',
                           'M6165',
                           'N2163',
                           'P363',
                           'S246',
                           'T2616',
                           'T51')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN
  (SELECT person_id,
          role_id
   FROM cast_info
   WHERE note IN ('(head writer)',
                   '(producer)',
                   '(puppeteer: "Salem")',
                   '(uncredited)')
     OR note IS NULL) AS ci ON n.id = ci.person_id
JOIN
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actress',
                   'miscellaneous crew',
                   'producer',
                   'writer')) AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN
  (SELECT id
   FROM info_type
   WHERE id IN ('26')) AS it1 ON pi1.info_type_id = it1.id;