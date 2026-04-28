SELECT COUNT(*)
FROM comments AS c,
     posts AS p,
     postHistory AS ph,
     votes AS v,
     users AS u
WHERE u.Id = c.UserId
  AND c.UserId = p.OwnerUserId
  AND p.OwnerUserId = ph.UserId
  AND ph.UserId = v.UserId
  AND p.Score <= ###
  AND p.AnswerCount >= ###
  AND p.AnswerCount <= ###
  AND p.CommentCount >= ###
  AND p.FavoriteCount <= ###
  AND ph.PostHistoryTypeId = ###
  AND v.BountyAmount <= ###
  AND u.DownVotes >= ###;