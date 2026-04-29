WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     AND name_pcode_nf IN ('A164',
                           'A3434',
                           'A53',
                           'A5431',
                           'B14',
                           'B3524',
                           'B563',
                           'C4152',
                           'C6431',
                           'C6534',
                           'F3626',
                           'P1261',
                           'R1423',
                           'R1546',
                           'R3165',
                           'S1353',
                           'S3251'))
SELECT COUNT(*)
FROM filtered_name AS fn
JOIN cast_info AS ci ON fn.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON fn.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON fn.id = an.person_id
WHERE rt.role IN ('actress',
                   'costume designer',
                   'director',
                   'writer')
  AND it1.id IN ('25')
  AND (ci.note IN ('(as Ann Todd)',
                   '(as Bethany Joy Galeotti)',
                   '(as Phebe Khae Arbotante)',
                   '(uncredited)')
       OR ci.note IS NULL);