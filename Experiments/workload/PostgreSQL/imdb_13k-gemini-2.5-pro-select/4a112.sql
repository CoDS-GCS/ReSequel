WITH filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'actress')),
     filtered_it AS
  (SELECT id
   FROM info_type
   WHERE id IN ('32'))
SELECT COUNT(*)
FROM name AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN filtered_it ON pi1.info_type_id = filtered_it.id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN filtered_rt ON ci.role_id = filtered_rt.id
WHERE n.gender IN ('f',
                    'm')
  AND n.name_pcode_nf IN ('A3651',
                           'A5365',
                           'B6324',
                           'B6536',
                           'G1645',
                           'H4521',
                           'J5253',
                           'J54',
                           'J565',
                           'M3452',
                           'M4262',
                           'M6254',
                           'P3623',
                           'T5214',
                           'V4356')
  AND ci.note IS NULL;