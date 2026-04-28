SELECT COUNT(*)
FROM comments AS c,
     posts AS p,
     postHistory AS ph,
     votes AS v,
     users AS u
WHERE v.UserId = u.Id
  AND c.UserId = u.Id
  AND p.OwnerUserId = u.Id
  AND ph.UserId = u.Id
  AND c.Score = ###
  AND p.AnswerCount >= ###
  AND p.AnswerCount <= ###
  AND p.CreationDate >= &&&
  AND p.CreationDate <= &&&
  AND ph.CreationDate <= &&&
  AND v.BountyAmount >= ###
  AND v.CreationDate >= &&&
  AND u.UpVotes <= ###
  AND u.CreationDate >= &&&
  AND u.CreationDate <= &&&;