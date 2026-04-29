
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
                   'tv movie',
                   'video game',
                   'video movie'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'actress',
                   'composer',
                   'director',
                   'writer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('8')
  AND mi1.info IN ('Austria',
                    'Canada',
                    'China',
                    'Czechoslovakia',
                    'Egypt',
                    'France',
                    'Iceland',
                    'Iran',
                    'Latvia',
                    'Morocco',
                    'Soviet Union',
                    'United Arab Emirates')
  AND mi2.info_type_id IN ('7')
  AND mi2.info IN ('LAB:Fotofilm S.A., Madrid, Spain',
                    'PCS:DV',
                    'PFM:DVD-ROM',
                    'PFM:Video',
                    'RAT:1.78 : 1 / (anamorphic)');