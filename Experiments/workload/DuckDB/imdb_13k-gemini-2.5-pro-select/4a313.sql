WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     AND name_pcode_nf IN ('A5241',
                           'E1252',
                           'G6524',
                           'H542',
                           'L5656',
                           'M6432',
                           'N1253',
                           'R1514',
                           'R524',
                           'S456',
                           'T123',
                           'T515',
                           'V6425')),
     filtered_roles AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actress',
                   'composer',
                   'director'))
SELECT COUNT(*)
FROM filtered_name AS fn
JOIN aka_name AS an ON fn.id = an.person_id
JOIN cast_info AS ci ON fn.id = ci.person_id
JOIN filtered_roles AS fr ON ci.role_id = fr.id
JOIN person_info AS pi1 ON fn.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE it1.id IN ('32')
  AND (ci.note IN ('(as Tia Pusit)',
                   '(uncredited)')
       OR ci.note IS NULL);