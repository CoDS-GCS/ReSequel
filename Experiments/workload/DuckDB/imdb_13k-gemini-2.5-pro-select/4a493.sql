
SELECT COUNT(*)
FROM name AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
WHERE n.gender IS NULL
  AND n.name_pcode_nf IN ('B5251',
                           'B6526',
                           'C6216',
                           'C6424',
                           'D1525',
                           'D5',
                           'F1252',
                           'H2525',
                           'J5234',
                           'J5252',
                           'J5365',
                           'K232',
                           'K3625',
                           'K6461',
                           'L5626',
                           'N2421',
                           'P451',
                           'R1636',
                           'R23',
                           'S5425',
                           'V2364',
                           'Y1534',
                           'Y2153')
  AND (ci.note IN ('(TV engineering unit head) (as Carla Enriquez)',
                   '(assistant location manager) (as Paulino Nieva)',
                   '(co-executive producer)',
                   '(co-producer)',
                   '(image designer)',
                   '(line producer)',
                   '(original story)',
                   '(playback supervisor)',
                   '(producer)',
                   '(production accountant)',
                   '(production assistant)',
                   '(promo specialist) (as Kzia Manto)',
                   '(scenario)',
                   '(series producer)',
                   '(stories supervised and based on concepts by)',
                   '(technical director) (as Jhune Castillo)',
                   '(writer)')
       OR ci.note IS NULL)
  AND pi1.info_type_id IN
    (SELECT id
     FROM info_type
     WHERE id IN ('25'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('cinematographer',
                   'director',
                   'miscellaneous crew',
                   'producer',
                   'production designer',
                   'writer'));