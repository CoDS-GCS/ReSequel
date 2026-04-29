WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1990 AND 2015
     AND title IN ('(#1.2047)',
                   '(#1.3289)',
                   '(#16.175)',
                   '(#3.73)',
                   '(#7.150)',
                   '(#8.74)',
                   '(#9.172)',
                   '(2003-07-18)',
                   '(2003-10-07)',
                   '(2006-07-14)',
                   '(2009-08-18)',
                   '(2011-02-13)',
                   '(2012-03-07)',
                   'Aflevering 6',
                   'Alaska',
                   'Cinema Suites: Long Beach, CA',
                   'Daisy',
                   'Eurovision sarki yarismasi',
                   'Free Love',
                   'Gone Fishing',
                   'In Confidence',
                   'Kinect Disneyland Adventures',
                   'Late Night with Conan OBrien: 10th Anniversary Special',
                   'Leila',
                   'Meltdown',
                   'My Househusband: Ikaw na!',
                   'Salem Witch Trials',
                   'The Emperors Club',
                   'The First Emperor',
                   'Una piedra en el camino',
                   'Wide Sargasso Sea',
                   'Young Hollywood Awards')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series'))),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'cinematographer',
                   'editor',
                   'producer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('4')
  AND mi2.info_type_id IN ('18')
  AND mi1.info IN ('Chinese',
                    'Croatian',
                    'French',
                    'Italian',
                    'Korean',
                    'None',
                    'Norwegian',
                    'Slovak',
                    'Spanish',
                    'Vietnamese')
  AND mi2.info IN ('Albuquerque, New Mexico, USA',
                    'Buenos Aires, Federal District, Argentina',
                    'China',
                    'Dublin, County Dublin, Ireland',
                    'Houston, Texas, USA',
                    'London, England, UK',
                    'Long Beach, California, USA',
                    'Madrid, Spain',
                    'New Jersey, USA',
                    'New Orleans, Louisiana, USA',
                    'North Hollywood, Los Angeles, California, USA',
                    'Pasadena, California, USA',
                    'Portland, Oregon, USA',
                    'Rio de Janeiro, Rio de Janeiro, Brazil',
                    'Switzerland');