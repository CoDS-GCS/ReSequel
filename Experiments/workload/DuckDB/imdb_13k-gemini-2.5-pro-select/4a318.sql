
SELECT COUNT(*)
FROM cast_info AS ci
JOIN role_type AS rt ON rt.id = ci.role_id
JOIN name AS n ON n.id = ci.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON it1.id = pi1.info_type_id
WHERE n.gender IS NULL
  AND n.name_pcode_nf IN ('A452',
                           'A5352',
                           'A6532',
                           'B326',
                           'C6236',
                           'E3636',
                           'G6212',
                           'H6153',
                           'J2163',
                           'J512',
                           'J5232',
                           'J5236',
                           'M2352',
                           'M2423',
                           'M4245',
                           'M6351',
                           'M6523',
                           'R1542',
                           'R1631',
                           'S61',
                           'T3563')
  AND (ci.note IN ('(creator)',
                   '(director of photography)',
                   '(executive producer)',
                   '(head of production administration)',
                   '(producer) (outdoors)',
                   '(producer)',
                   '(production accountant)',
                   '(production coordinator) (as Joanne Oboyski-Battelene)',
                   '(series director)',
                   '(writer)')
       OR ci.note IS NULL)
  AND rt.role IN ('cinematographer',
                   'composer',
                   'costume designer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'production designer',
                   'writer')
  AND it1.id IN ('31');