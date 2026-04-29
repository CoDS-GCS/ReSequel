WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     AND name_pcode_nf IN ('A2324',
                           'A5361',
                           'B4652',
                           'C6243',
                           'D2426',
                           'E1623',
                           'F2162',
                           'G6512',
                           'J5262',
                           'K6242',
                           'L21',
                           'L2656',
                           'L6212',
                           'N5251',
                           'P3624',
                           'P4252',
                           'P5352',
                           'R521',
                           'R5325',
                           'R5354',
                           'S1232',
                           'T1524',
                           'V2361',
                           'Y2562',
                           'Z5352'))
SELECT COUNT(*)
FROM filtered_name AS fn
JOIN cast_info AS ci ON fn.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON fn.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON fn.id = an.person_id
WHERE rt.role IN ('actor',
                   'cinematographer',
                   'composer',
                   'director',
                   'miscellaneous crew',
                   'producer',
                   'writer')
  AND it1.id IN ('19')
  AND (ci.note IN ('(creator)',
                   '(executive producer)',
                   '(producer)',
                   '(stand-in) (uncredited)')
       OR ci.note IS NULL);