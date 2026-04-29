WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     AND name_pcode_nf IN ('A5325',
                           'B1525',
                           'B4152',
                           'B652',
                           'C6463',
                           'D5123',
                           'E6256',
                           'F6325',
                           'H6132',
                           'I2',
                           'I5626',
                           'K3162',
                           'K4213',
                           'K531',
                           'M2523',
                           'M4212',
                           'M4523',
                           'N4165',
                           'P1425',
                           'R1634',
                           'S3151',
                           'S5616',
                           'T3415',
                           'T5241'))
SELECT COUNT(*)
FROM filtered_name AS fn
JOIN cast_info AS ci ON fn.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON fn.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON fn.id = an.person_id
WHERE rt.role IN ('actor',
                   'director',
                   'producer',
                   'writer')
  AND it1.id IN ('34')
  AND (ci.note IN ('(executive producer)',
                   '(producer)',
                   '(voice)',
                   '(voice: English version) (as Jim Taggert)',
                   '(writer)')
       OR ci.note IS NULL);