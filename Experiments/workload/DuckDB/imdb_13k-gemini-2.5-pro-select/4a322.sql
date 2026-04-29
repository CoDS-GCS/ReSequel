WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('f',
                    'm')
     AND name_pcode_nf IN ('B16',
                           'B5325',
                           'D1314',
                           'D2425',
                           'D6515',
                           'E1365',
                           'G2316',
                           'G6352',
                           'J2416',
                           'J3262',
                           'J5216',
                           'J5352',
                           'K5214',
                           'L1561',
                           'L623',
                           'M2416',
                           'M364',
                           'N3656',
                           'N6546',
                           'P3613',
                           'P3625',
                           'P46',
                           'S3154',
                           'S6545',
                           'T12'))
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
                   'director',
                   'producer',
                   'writer')
  AND it1.id IN ('25')
  AND (ci.note IN ('(co-executive producer)',
                   '(developed by)',
                   '(uncredited)',
                   '(written by)')
       OR ci.note IS NULL);