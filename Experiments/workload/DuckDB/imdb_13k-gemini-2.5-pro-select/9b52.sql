
SELECT mi1.info,
       n.name,
       COUNT(*)
FROM title AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi ON n.id = pi.person_id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN info_type AS it2 ON pi.info_type_id = it2.id
WHERE t.production_year BETWEEN 1975 AND 2015
  AND kt.kind IN ('episode',
                   'movie',
                   'video movie')
  AND rt.role IN ('cinematographer',
                   'composer',
                   'editor',
                   'production designer',
                   'writer')
  AND it1.id IN ('12',
                  '94')
  AND it2.id IN ('24')
  AND mi1.info IN ('At the end of the closing credits of episode, Alf is heard laughing.',
                    'The Avengers who appear in the screen just before the series logo vary along with who will be in the chapter. If only Thor is going be in it, only Thor is seen.',
                    'There are no opening credits after the title is shown.',
                    'There are no opening credits.',
                    'When the title "Frasier" and the usual silhouette of Seattle are on screen, a lightning bolt flashes in the sky.',
                    'When the title "Frasier" and the usual silhouette of Seattle are on screen, a red light blinks at the highest point of the Space Needle.',
                    'When the title "Frasier" and the usual silhouette of Seattle are on screen, fireworks shoot to the sky.',
                    'When the title "Frasier" and the usual silhouette of Seattle are on screen, several lights are being lit in the "windows" of the buildings.')
  AND n.name ILIKE '%av%'
GROUP BY mi1.info,
         n.name;