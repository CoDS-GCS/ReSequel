WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     AND name_pcode_nf IN ('C3452',
                           'C6251',
                           'C6453',
                           'F142',
                           'G6562',
                           'J2132',
                           'L625',
                           'N3524',
                           'S3631',
                           'T632',
                           'Y1425')),
     filtered_cast AS
  (SELECT ci.person_id
   FROM cast_info AS ci
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE rt.role IN ('actor',
                   'director')
     AND (ci.note IN ('(voice)')
          OR ci.note IS NULL)),
     filtered_pi AS
  (SELECT pi.person_id
   FROM person_info AS pi
   JOIN info_type AS it ON pi.info_type_id = it.id
   WHERE it.id IN ('32'))
SELECT COUNT(*)
FROM filtered_name AS fn
JOIN aka_name AS an ON fn.id = an.person_id
JOIN filtered_cast AS fc ON fn.id = fc.person_id
JOIN filtered_pi AS fpi ON fn.id = fpi.person_id;