
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE (n.gender IN ('f',
                    'm')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A4152',
                           'B1534',
                           'B4236',
                           'B6536',
                           'J5424',
                           'K253',
                           'K263',
                           'M3216',
                           'N5156',
                           'P6215',
                           'P6425',
                           'R5251',
                           'S3423',
                           'S5124',
                           'Y2352',
                           'Y2532'))
  AND (ci.note IN ('(associate producer) (uncredited)',
                   '(original idea)',
                   '(producer)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor',
                   'actress',
                   'composer',
                   'producer',
                   'writer')
  AND it1.id IN ('34');