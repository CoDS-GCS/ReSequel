WITH movie_base AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1950 AND 1990
     AND kt.kind IN ('episode',
                   'movie')),
     movie_info_filtered AS
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   WHERE mi1.info_type_id IN ('1',
                  '4',
                  '7')
     AND mi1.info IN ('30',
                    '60',
                    'English',
                    'French',
                    'Japanese',
                    'OFM:35 mm',
                    'OFM:Live',
                    'OFM:Video',
                    'PCS:Spherical',
                    'PFM:35 mm',
                    'PFM:Video',
                    'RAT:1.33 : 1',
                    'RAT:1.37 : 1',
                    'RAT:2.35 : 1',
                    'Spanish')),
     movie_info_idx1_filtered AS
  (SELECT mii1.movie_id
   FROM movie_info_idx AS mii1
   WHERE mii1.info_type_id = '100'
     AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii1.info::float BETWEEN 0.0 AND 10000.0),
     movie_info_idx2_filtered AS
  (SELECT mii2.movie_id
   FROM movie_info_idx AS mii2
   WHERE mii2.info_type_id = '101'
     AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii2.info::float BETWEEN 0.0 AND 4.0),
     person_base AS
  (SELECT n.id
   FROM name AS n
   JOIN person_info AS pi1 ON n.id = pi1.person_id
   WHERE (n.gender IN ('f',
                    'm')
          OR n.gender IS NULL)
     AND (n.name_pcode_nf IN ('B6514',
                           'D5432',
                           'E3631',
                           'G6262',
                           'M2424',
                           'M6252',
                           'P3614',
                           'W4125',
                           'W4525')
          OR n.name_pcode_nf IS NULL)
     AND pi1.info_type_id IN ('22'))
SELECT COUNT(*)
FROM movie_base mb
JOIN movie_info_filtered mif ON mb.id = mif.movie_id
JOIN movie_info_idx1_filtered miif1 ON mb.id = miif1.movie_id
JOIN movie_info_idx2_filtered miif2 ON mb.id = miif2.movie_id
JOIN cast_info AS ci ON mb.id = ci.movie_id
JOIN person_base pb ON ci.person_id = pb.id
JOIN aka_name AS an ON pb.id = an.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE ci.note IS NULL
  AND rt.role IN ('actor',
                   'actress',
                   'director');