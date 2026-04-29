 
 
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year BETWEEN 1990 AND 2015
  AND kt.kind IN ('tv movie',
                   'tv series')
  AND it1.id IN ('13')
  AND mi1.info IN ('CONT: Flipped Shot: When Chip and Kim deliver the chairs in Mto Wa Mbu in the episode "Are You Sure This Is Safe?" theres a child wearing a Pokemon shirt which is shown as a mirrored image. This is done on a lot on reality shows where licensed clothing is visible in order to get around licensing issues. Also, its easier to flip the image than to blur it out.',
                    'FACT: As teams are leaving Singapore you can see that the name of the airport in the graphic is Changai Airport, when in fact the airport in Singapore is Changi Airport',
                    'FACT: In the leg from Switzerland to Malaysia, the Amazing Yellow Line charts a plane ride from Geneva to Paris to Kuala Lumpur. However, according to the map, Paris is placed in the Iberian peninsula near Madrid, Spain.',
                    'FACT: When the teams are travelling from Argentina to Mozambique in the fourth episode of the All-Stars series, Phil Keoghans voice-over states that there are no international flights out of Ushuaia Airport. However, at what the on-screen caption claims is Ushuaia Airport, a Qantas plane is clearly visible. Qantas is Australias main international airline and would not be present at a solely domestic airport in Argentina (Qantas do, however, fly to Buenos Aires, so the scene was presumably filmed at Buenos Aires international airport).')
  AND it2.id IN ('18')
  AND mi2.info IN ('Burbank, California, USA',
                    'Chicago, Illinois, USA',
                    'Dijon Street, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA',
                    'Malta',
                    'Oakland, California, USA',
                    'Santa Clarita, California, USA',
                    'University of British Columbia, Robson Square Campus - 800 Robson Street, Vancouver, British Columbia, Canada',
                    'West Hollywood, California, USA')
  AND rt.role IN ('composer',
                   'editor',
                   'producer',
                   'production designer')
  AND (n.gender IN ('m')
       OR n.gender IS NULL);