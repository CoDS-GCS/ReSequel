WITH movie_ids AS
  (SELECT t.id
   FROM title t
   JOIN kind_type kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1990 AND 2015
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'video game',
                   'video movie'))
SELECT COUNT(*)
FROM movie_ids
JOIN cast_info AS ci ON movie_ids.id = ci.movie_id
JOIN movie_info AS mi1 ON movie_ids.id = mi1.movie_id
JOIN movie_info AS mi2 ON movie_ids.id = mi2.movie_id
WHERE ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actress',
                   'costume designer',
                   'editor',
                   'guest',
                   'production designer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('16')
  AND mi1.info IN ('Belgium:19 December 2001',
                    'France:16 November 2004',
                    'Hungary:10 April 2004',
                    'South Korea:13 December 2002',
                    'South Korea:13 March 1999',
                    'Switzerland:25 June 2009',
                    'Switzerland:9 January 1998',
                    'USA:17 November 2006',
                    'USA:5 November 2010',
                    'USA:5 September 2001')
  AND mi2.info_type_id IN ('17')
  AND mi2.info IN ('Despite the fact that this was filmed in Super 35, "Filmed in Panavision" is listed in the end credits.',
                    'Despite the fact that this was filmed in the standard spherical format, "Filmed in Panavision" is listed in the end credits.',
                    'Not screened in advance for critics.');