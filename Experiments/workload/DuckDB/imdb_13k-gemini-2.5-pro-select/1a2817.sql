
SELECT COUNT(*)
FROM
  (SELECT t.id
   FROM title AS t,
        kind_type AS kt,
        info_type AS it1,
        movie_info AS mi1,
        movie_info AS mi2,
        info_type AS it2,
        cast_info AS ci,
        role_type AS rt,
        name AS n
   WHERE t.id = ci.movie_id
     AND t.id = mi1.movie_id
     AND t.id = mi2.movie_id
     AND mi1.info_type_id = it1.id
     AND mi2.info_type_id = it2.id
     AND t.kind_id = kt.id
     AND ci.person_id = n.id
     AND ci.role_id = rt.id
     AND it1.id IN ('5')
     AND it2.id IN ('8')
     AND mi1.info IN ('Australia:G',
                    'Australia:M',
                    'Australia:R',
                    'Canada:PG',
                    'Finland:K-16',
                    'Finland:S',
                    'Germany:BPjM Restricted',
                    'Netherlands:18',
                    'Singapore:PG',
                    'Spain:T',
                    'UK:18',
                    'USA:Passed',
                    'USA:TV-G',
                    'West Germany:16')
     AND mi2.info IN ('Argentina',
                    'Austria',
                    'Belgium',
                    'Canada',
                    'Finland',
                    'France',
                    'Germany',
                    'India',
                    'Japan',
                    'Soviet Union',
                    'Spain',
                    'Sweden',
                    'UK',
                    'West Germany')
     AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game',
                   'video movie')
     AND rt.role IN ('editor')
     AND n.gender IS NULL
     AND t.production_year BETWEEN 1875 AND 1975) AS subquery;