
SELECT COUNT(*)
FROM title AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1925 AND 2015
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('composer',
                   'miscellaneous crew'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('18')
  AND mi1.info IN ('Boston, Massachusetts, USA',
                    'Budapest, Hungary',
                    'Buenos Aires, Federal District, Argentina',
                    'Dodger Stadium - 1000 Elysian Park Avenue, Chávez Ravine, Elysian Park, Los Angeles, California, USA',
                    'France',
                    'Isle of Man',
                    'Laramie Street, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA',
                    'Luxembourg',
                    'Naples, Campania, Italy',
                    'Santa Clarita, California, USA',
                    'Stage 25, Paramount Studios - 5555 Melrose Avenue, Hollywood, Los Angeles, California, USA',
                    'Wall Street, Manhattan, New York City, New York, USA',
                    'West Hollywood, California, USA',
                    'Yuma, Arizona, USA')
  AND mi2.info_type_id IN ('5')
  AND mi2.info IN ('Austria:16',
                    'Canada:16+',
                    'Canada:PA',
                    'Denmark:11',
                    'Germany:6',
                    'Hong Kong:IIA',
                    'Italy:T',
                    'New Zealand:M',
                    'Taiwan:PG-12',
                    'USA:PG');