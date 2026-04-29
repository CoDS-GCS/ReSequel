
SELECT COUNT(*)
FROM role_type AS rt
JOIN cast_info AS ci ON rt.id = ci.role_id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON n.id = an.person_id
WHERE rt.role IN ('actor',
                   'cinematographer',
                   'composer',
                   'producer')
  AND it1.id IN ('26')
  AND n.gender IN ('m')
  AND n.name_pcode_nf IN ('A2326',
                           'D1316',
                           'D136',
                           'D5252',
                           'H6432',
                           'K3416',
                           'K6251',
                           'M2415',
                           'M5242')
  AND (ci.note IN ('(producer)')
       OR ci.note IS NULL);