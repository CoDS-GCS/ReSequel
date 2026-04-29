
SELECT COUNT(*)
FROM role_type AS rt
JOIN cast_info AS ci ON rt.id = ci.role_id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON n.id = an.person_id
WHERE rt.role IN ('actor',
                   'actress',
                   'composer',
                   'editor',
                   'miscellaneous crew',
                   'writer')
  AND it1.id IN ('31')
  AND n.gender IN ('f',
                    'm')
  AND n.name_pcode_nf IN ('C4134',
                           'G6251',
                           'K213',
                           'L5341',
                           'M3451',
                           'P4614',
                           'R215',
                           'T4121',
                           'V2145',
                           'W4365',
                           'Z6525')
  AND (ci.note IN ('(adprom account head)',
                   '(as Monika Sakaguchi)',
                   '(history consultant) (as Dr. Vic Villan)',
                   '(uncredited)',
                   '(writer)')
       OR ci.note IS NULL);