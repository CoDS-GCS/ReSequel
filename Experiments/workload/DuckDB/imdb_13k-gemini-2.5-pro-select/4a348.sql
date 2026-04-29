
SELECT COUNT(*)
FROM cast_info AS ci
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
WHERE ci.note IS NULL
  AND rt.role IN ('actress')
  AND n.gender IN ('f')
  AND n.name_pcode_nf IN ('B4521',
                           'C435',
                           'C6245',
                           'D5241',
                           'D535',
                           'E5161',
                           'E5165',
                           'H32',
                           'I6515',
                           'K2526',
                           'K3161',
                           'K6515',
                           'L6263',
                           'L6414',
                           'L6541',
                           'M6236',
                           'P5414',
                           'S3625',
                           'S4521',
                           'T261',
                           'V1524')
  AND pi1.info_type_id IN ('26');