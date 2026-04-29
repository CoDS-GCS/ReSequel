WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     AND name_pcode_nf IN ('G6236',
                           'G624',
                           'J25',
                           'J5153',
                           'J525',
                           'J5252',
                           'L5631',
                           'L5632',
                           'M6253',
                           'P3632',
                           'T5253',
                           'V2365')),
     filtered_cast AS
  (SELECT ci.person_id
   FROM cast_info AS ci
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE rt.role IN ('actor')
     AND (ci.note IN ('(voice)')
          OR ci.note IS NULL)),
     filtered_pi AS
  (SELECT pi.person_id
   FROM person_info AS pi
   JOIN info_type AS it ON pi.info_type_id = it.id
   WHERE it.id IN ('31'))
SELECT COUNT(*)
FROM filtered_name AS fn
JOIN aka_name AS an ON fn.id = an.person_id
JOIN filtered_cast AS fc ON fn.id = fc.person_id
JOIN filtered_pi AS fpi ON fn.id = fpi.person_id;