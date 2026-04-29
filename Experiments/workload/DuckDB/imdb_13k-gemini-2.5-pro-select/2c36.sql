WITH movie_ids AS (
                     (SELECT movie_id
                      FROM movie_info
                      WHERE info_type_id IN ('3')
                        AND info IN ('Animation',
                    'Biography',
                    'Music',
                    'Mystery',
                    'Short',
                    'Sport')) INTERSECT
                     (SELECT movie_id
                      FROM movie_info
                      WHERE info_type_id IN ('7')
                        AND info IN ('CAM:Canon 5D Mark II',
                    'CAM:Canon 7D',
                    'OFM:Super 16',
                    'PCS:HDCAM SR',
                    'RAT:1.78 : 1')))
SELECT COUNT(*)
FROM title AS t
JOIN movie_ids mi ON t.id = mi.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN kind_type AS kt ON t.kind_id = kt.id
WHERE t.production_year BETWEEN 1975 AND 2015
  AND t.title IN ('(#1.10093)',
                   '(#1.10148)',
                   '(#1.5295)',
                   '(#1.5710)',
                   '(#15.46)',
                   '(#4.85)',
                   '(#9.172)',
                   '(#9.4)',
                   '(1997-09-18)',
                   '(1998-06-22)',
                   '(2006-02-02)',
                   '(2010-12-19)',
                   '(2012-04-27)',
                   'A Fair to Remember',
                   'Be Prepared',
                   'Boogie',
                   'Booted',
                   'David Copperfield',
                   'February',
                   'Firehouse',
                   'Holidays',
                   'Last Party 2000',
                   'Liebe und Tod',
                   'Maid of Honor',
                   'Missed Connections',
                   'Police Academy: Mission to Moscow',
                   'Road House',
                   'Secret Truths',
                   'Senjo no Varukyuria 2: Garia Ôritsu Shikan Gakkô',
                   'The Magdalene Sisters',
                   'The Prodigal Son',
                   'Top 9 Results',
                   'Triangles',
                   'Wolf Creek')
  AND kt.kind IN ('episode',
                   'movie',
                   'tv series',
                   'video game',
                   'video movie')
  AND rt.role IN ('costume designer',
                   'director',
                   'editor')
  AND (n.gender IN ('f')
       OR n.gender IS NULL);