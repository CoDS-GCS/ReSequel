WITH filtered_name AS
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
                           'T51')),
     filtered_roles AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actress',
                   'miscellaneous crew',
                   'producer',
                   'writer'))
SELECT COUNT(*)
FROM filtered_name AS fn
JOIN aka_name AS an ON fn.id = an.person_id
JOIN cast_info AS ci ON fn.id = ci.person_id
JOIN filtered_roles AS fr ON ci.role_id = fr.id
JOIN person_info AS pi1 ON fn.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE it1.id IN ('26')
  AND (ci.note IN ('(head writer)',
                   '(producer)',
                   '(puppeteer: "Salem")',
                   '(uncredited)')
       OR ci.note IS NULL);