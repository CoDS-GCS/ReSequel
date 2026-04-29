WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('f',
                    'm')
     AND name_pcode_nf IN ('A542',
                           'B3143',
                           'B3626',
                           'B5325',
                           'B6215',
                           'B6234',
                           'C2164',
                           'J5432',
                           'L1235',
                           'M2156',
                           'M636',
                           'N1236',
                           'N45',
                           'R5252',
                           'S3562',
                           'S5324',
                           'Z2513'))
SELECT COUNT(*)
FROM filtered_name AS fn
JOIN cast_info AS ci ON fn.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON fn.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON fn.id = an.person_id
WHERE rt.role IN ('actor',
                   'actress',
                   'composer',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer')
  AND it1.id IN ('31')
  AND (ci.note IN ('(producer)',
                   '(production assistant)',
                   '(switcher)',
                   '(uncredited)',
                   '(voice: English version)',
                   '(writer)')
       OR ci.note IS NULL);