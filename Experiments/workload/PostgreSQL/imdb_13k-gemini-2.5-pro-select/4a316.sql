
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     AND name_pcode_nf IN ('A5242',
                           'A5323',
                           'B53',
                           'B6252',
                           'C2413',
                           'D2134',
                           'D3245',
                           'D6252',
                           'E4312',
                           'E6243',
                           'F6341',
                           'J5262',
                           'K3462',
                           'L2512',
                           'L35',
                           'M2152',
                           'M636',
                           'P4163',
                           'R2162',
                           'R513')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN
  (SELECT person_id,
          role_id
   FROM cast_info
   WHERE note IN ('(additional story material)',
                   '(as Hunter)',
                   '(executive producer)',
                   '(head writer)',
                   '(producer)',
                   '(supervising producer)',
                   '(uncredited)')
     OR note IS NULL) AS ci ON n.id = ci.person_id
JOIN
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'composer',
                   'director',
                   'producer',
                   'writer')) AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN
  (SELECT id
   FROM info_type
   WHERE id IN ('22')) AS it1 ON pi1.info_type_id = it1.id;