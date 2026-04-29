WITH movie_base AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 2015
     AND kt.kind IN ('episode',
                   'movie')),
     movie_keywords AS
  (SELECT mk.movie_id
   FROM movie_keyword AS mk
   JOIN keyword AS k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('bare-chested-male',
                     'based-on-play',
                     'character-name-in-title',
                     'dancing',
                     'death',
                     'gay',
                     'homosexual',
                     'lesbian-sex',
                     'love',
                     'murder',
                     'non-fiction',
                     'oral-sex',
                     'song',
                     'suicide',
                     'violence'))
SELECT COUNT(*)
FROM movie_base
JOIN movie_keywords ON movie_base.id = movie_keywords.movie_id
JOIN movie_info AS mi1 ON movie_base.id = mi1.movie_id
JOIN movie_info AS mi2 ON movie_base.id = mi2.movie_id
JOIN cast_info AS ci ON movie_base.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE mi1.info_type_id IN ('2')
  AND mi1.info IN ('Black and White',
                    'Color')
  AND mi2.info_type_id IN ('5')
  AND mi2.info IN ('Argentina:13',
                    'Australia:G',
                    'Finland:K-15',
                    'Iceland:16',
                    'Singapore:M18',
                    'Singapore:NC-16',
                    'South Korea:18',
                    'UK:12',
                    'USA:R',
                    'West Germany:12',
                    'West Germany:16',
                    'West Germany:18')
  AND rt.role IN ('director')
  AND (n.gender IN ('m')
       OR n.gender IS NULL);