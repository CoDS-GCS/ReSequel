WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     AND name_pcode_nf IN ('A4364',
                           'A6362',
                           'B2142',
                           'C1352',
                           'C4316',
                           'D5425',
                           'G2323',
                           'J5351',
                           'J5425',
                           'L565',
                           'L621',
                           'N3515',
                           'R1636',
                           'R3212',
                           'R3215',
                           'R432',
                           'R5432',
                           'T532',
                           'T5651',
                           'W4515',
                           'W4526'))
SELECT COUNT(*)
FROM filtered_name AS fn
JOIN cast_info AS ci ON fn.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON fn.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON fn.id = an.person_id
WHERE rt.role IN ('actor',
                   'cinematographer',
                   'director',
                   'editor',
                   'producer',
                   'writer')
  AND it1.id IN ('34')
  AND (ci.note IN ('(executive producer)',
                   '(producer)',
                   '(uncredited)',
                   '(written by)')
       OR ci.note IS NULL);