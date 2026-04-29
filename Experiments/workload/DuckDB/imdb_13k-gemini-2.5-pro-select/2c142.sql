
SELECT COUNT(*)
FROM title AS t,
     cast_info AS ci,
     movie_info AS mi1,
     movie_info AS mi2
WHERE t.id = ci.movie_id
  AND t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND t.production_year <= 1990
  AND t.production_year >= 1950
  AND t.title IN ('(#1.159)',
                   '(#1.197)',
                   '(#1.401)',
                   '(#1.466)',
                   '(#1.538)',
                   '(#1.679)',
                   '(#1.875)',
                   '(#2.14)',
                   '(#9.8)',
                   '1984 NFL Draft',
                   'All Dogs Go to Heaven',
                   'All Star Comedy Carnival',
                   'Ashes to Ashes',
                   'Asylum',
                   'Austerlitz',
                   'Beyond a Reasonable Doubt',
                   'Black Magic',
                   'Blind Justice',
                   'Blind Mans Bluff',
                   'Bon Voyage',
                   'Captain America',
                   'Chicago Bears vs. Detroit Lions',
                   'Dancing in the Dark',
                   'Die Verschwörung',
                   'End of the Line',
                   'Evacuation',
                   'Grace Under Pressure',
                   'Identity Crisis',
                   'La Bohème',
                   'Macho Man',
                   'Maß für Maß',
                   'Melodi grand prix',
                   'No Way Out',
                   'Nobodys Fool',
                   'Oceans Eleven',
                   'Pacific Heights',
                   'Sweet Charity',
                   'Temptation',
                   'Terror',
                   'The Beauty Contest',
                   'The Champion',
                   'The Decline of Western Civilization Part II: The Metal Years',
                   'The Experts',
                   'The Good Samaritan',
                   'The Last Straw',
                   'The Road to War',
                   'The Searchers',
                   'The Untouchables',
                   'Without a Clue')
  AND mi1.info_type_id IN ('3')
  AND mi1.info IN ('Adult',
                    'Comedy',
                    'Drama',
                    'Fantasy',
                    'Horror',
                    'Music',
                    'Musical',
                    'Mystery',
                    'Romance',
                    'Sci-Fi',
                    'Thriller')
  AND mi2.info_type_id IN ('5')
  AND mi2.info IN ('Australia:PG',
                    'Brazil:Livre',
                    'Canada:A',
                    'Chile:18',
                    'Finland:(Banned)',
                    'India:U',
                    'Italy:T',
                    'Italy:VM18',
                    'Netherlands:18',
                    'Portugal:M/18',
                    'USA:PG')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv series',
                   'video game',
                   'video movie'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f',
                    'm'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'director',
                   'producer',
                   'writer'));