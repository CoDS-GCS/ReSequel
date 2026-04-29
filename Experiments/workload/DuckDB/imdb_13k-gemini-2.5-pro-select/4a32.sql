
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     AND name_pcode_nf IN ('C2526',
                           'D4524',
                           'D5241',
                           'E2536',
                           'E5262',
                           'H4162',
                           'K6526',
                           'M2414',
                           'M2425',
                           'M2462',
                           'R2635',
                           'S3123',
                           'T616',
                           'V2652',
                           'V5214',
                           'W4532')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE rt.role IN ('actor',
                   'editor',
                   'producer',
                   'writer')
  AND it1.id IN ('19')
  AND (ci.note IN ('(producer)',
                   '(voice)',
                   '(voice: English version)',
                   '(writer)')
       OR ci.note IS NULL);