
SELECT COUNT(*)
FROM users AS u,
     votes AS v,
     postHistory AS ph,
     badges AS b
WHERE u.Id = b.UserId
  AND u.Id = ph.UserId
  AND u.Id = v.UserId
  AND u.Views >= 0;