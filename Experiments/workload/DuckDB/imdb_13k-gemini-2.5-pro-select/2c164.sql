WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1950 AND 1990
     AND title IN ('(#1.245)',
                   '(#1.390)',
                   '(#1.461)',
                   '(#1.61)',
                   '(#1.843)',
                   '(#1.85)',
                   '(#2.32)',
                   '(#3.11)',
                   '(#3.52)',
                   '(#7.22)',
                   'A Day in the Life',
                   'A Matter of Principle',
                   'A Room with a View',
                   'Annie Hall',
                   'Astonished',
                   'Billy the Kid',
                   'Blazing Saddles',
                   'Brushfire',
                   'Buddies',
                   'Casino Royale',
                   'Crack-Up',
                   'D.O.A.',
                   'Das Jubiläum',
                   'Deutschland im Herbst',
                   'Domino',
                   'Duel',
                   'First Night',
                   'Grand Theft Auto',
                   'Impulse',
                   'It Couldnt Happen Here',
                   'Kdyby tisíc klarinetu',
                   'My Blue Heaven',
                   'New Faces',
                   'Night of 100 Stars III',
                   'North to Alaska',
                   'Samurai',
                   'Seishun to wa nanda',
                   'The 37th Annual Emmy Awards',
                   'The Avenging Angel',
                   'The Deputy',
                   'The Disappearance',
                   'The Earth Day Special',
                   'The Strike',
                   'The Vote',
                   'Thuiskomst')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie'))),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actress',
                   'cinematographer',
                   'director',
                   'editor'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('8')
  AND mi2.info_type_id IN ('5')
  AND mi1.info IN ('Austria',
                    'Canada',
                    'Denmark',
                    'Finland',
                    'France',
                    'Israel',
                    'Netherlands',
                    'Norway',
                    'Poland',
                    'Spain',
                    'Sweden',
                    'West Germany',
                    'Yugoslavia')
  AND mi2.info IN ('Argentina:Atp',
                    'Australia:PG',
                    'Canada:PG',
                    'Canada:R',
                    'Finland:K-18',
                    'India:Unrated',
                    'Netherlands:12',
                    'Netherlands:AL',
                    'Singapore:PG',
                    'South Korea:15',
                    'Spain:T',
                    'Sweden:11',
                    'UK:18',
                    'USA:X');