
SELECT COUNT(*)
FROM
  (SELECT ci.movie_id
   FROM name AS n
   JOIN cast_info AS ci ON n.id = ci.person_id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE n.gender IN ('f')
     AND n.name_pcode_nf IN ('A4252',
                           'B6161',
                           'J5162',
                           'K3652',
                           'L5326')
     AND rt.role IN ('actress')) AS fc
JOIN title AS t ON fc.movie_id = t.id
AND t.production_year BETWEEN 1925 AND 2015
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('episode',
                   'movie')
JOIN movie_companies AS mc ON t.id = mc.movie_id
JOIN company_type AS ct ON mc.company_type_id = ct.id
AND ct.kind IN ('distributors',
                   'production companies')
JOIN company_name AS cn ON mc.company_id = cn.id
AND cn.name IN ('Columbia Broadcasting System (CBS)',
                   'Fox Network',
                   'Independent Television (ITV)',
                   'Metro-Goldwyn-Mayer (MGM)',
                   'National Broadcasting Company (NBC)',
                   'Paramount Pictures',
                   'Shout! Factory',
                   'Universal Pictures',
                   'Warner Bros')
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
AND mi1.info IN ('CBS Television City - 7800 Beverly Blvd., Fairfax, Los Angeles, California, USA',
                    'General Service Studios - 1040 N. Las Palmas, Hollywood, Los Angeles, California, USA',
                    'Hal Roach Studios - 8822 Washington Blvd., Culver City, California, USA',
                    'Paramount Studios - 5555 Melrose Avenue, Hollywood, Los Angeles, California, USA',
                    'Republic Studios - 4024 Radford Avenue, North Hollywood, Los Angeles, California, USA',
                    'Revue Studios, Hollywood, Los Angeles, California, USA',
                    'Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA')
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
AND it1.id IN ('18')
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id;