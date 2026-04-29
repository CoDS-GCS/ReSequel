
SELECT COUNT(*)
FROM title AS t,
     cast_info AS ci,
     movie_info AS mi1,
     movie_info AS mi2
WHERE t.id = ci.movie_id
  AND t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND t.production_year <= 1975
  AND t.production_year >= 1925
  AND t.title IN ('(#1.12)',
                   '(#1.74)',
                   '(#1.88)',
                   '(#2.20)',
                   '(#5.22)',
                   '(#6.12)',
                   '(#6.14)',
                   'A Christmas Carol',
                   'A Matter of Life and Death',
                   'Accidents Will Happen',
                   'Anderssonskans Kalle',
                   'Arsenic and Old Lace',
                   'Batman',
                   'Broadway Bill',
                   'Brother Can You Spare a Dime',
                   'Buried Treasure',
                   'Chain of Events',
                   'Dansk melodi grand prix',
                   'Destry Rides Again',
                   'Detective Story',
                   'Illegal Entry',
                   'Jailhouse Rock',
                   'Jeder stirbt für sich allein',
                   'Jenny',
                   'Jet Pilot',
                   'Les trois mousquetaires',
                   'Love Letters',
                   'Mantrap',
                   'Mind Your Own Business',
                   'One Good Turn',
                   'Part 1',
                   'Pension Schöller',
                   'Quarta puntata',
                   'Safari',
                   'Stree',
                   'Sweet Charity',
                   'The Avenger',
                   'The Brothers',
                   'The Dark Angel',
                   'The Doctor',
                   'The Exile',
                   'The Farmer Takes a Wife',
                   'The Male Animal',
                   'The Opposite Sex',
                   'The Payoff',
                   'The Substitute',
                   'Threes a Crowd',
                   'War and Peace',
                   'What Are Friends For?',
                   'Whiplash')
  AND mi1.info_type_id IN ('5')
  AND mi1.info IN ('Brazil:Livre',
                    'Canada:R',
                    'Finland:K-8',
                    'India:U',
                    'USA:GP',
                    'USA:R',
                    'USA:Unrated')
  AND mi2.info_type_id IN ('3')
  AND mi2.info IN ('Adult',
                    'Adventure',
                    'Animation',
                    'Documentary',
                    'Drama',
                    'Fantasy',
                    'Horror',
                    'Musical',
                    'Mystery',
                    'Sci-Fi',
                    'Thriller')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'video game',
                   'video movie'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actress',
                   'director',
                   'producer'));