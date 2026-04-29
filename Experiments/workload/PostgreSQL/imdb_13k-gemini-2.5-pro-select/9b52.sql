WITH filtered_persons AS
  (SELECT n.id,
          n.name
   FROM name AS n
   JOIN person_info AS pi ON n.id = pi.person_id
   WHERE n.name ILIKE '%av%'
     AND pi.info_type_id IN ('24')),
     filtered_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1975 AND 2015
     AND kt.kind IN ('episode',
                   'movie',
                   'video movie'))
SELECT mi1.info,
       fp.name,
       COUNT(*)
FROM cast_info AS ci
JOIN filtered_persons AS fp ON ci.person_id = fp.id
JOIN filtered_movies AS fm ON ci.movie_id = fm.id
JOIN movie_info AS mi1 ON ci.movie_id = mi1.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE mi1.info_type_id IN ('12',
                  '94')
  AND mi1.info IN ('At the end of the closing credits of episode, Alf is heard laughing.',
                    'The Avengers who appear in the screen just before the series logo vary along with who will be in the chapter. If only Thor is going be in it, only Thor is seen.',
                    'There are no opening credits after the title is shown.',
                    'There are no opening credits.',
                    'When the title "Frasier" and the usual silhouette of Seattle are on screen, a lightning bolt flashes in the sky.',
                    'When the title "Frasier" and the usual silhouette of Seattle are on screen, a red light blinks at the highest point of the Space Needle.',
                    'When the title "Frasier" and the usual silhouette of Seattle are on screen, fireworks shoot to the sky.',
                    'When the title "Frasier" and the usual silhouette of Seattle are on screen, several lights are being lit in the "windows" of the buildings.')
  AND rt.role IN ('cinematographer',
                   'composer',
                   'editor',
                   'production designer',
                   'writer')
GROUP BY mi1.info,
         fp.name;