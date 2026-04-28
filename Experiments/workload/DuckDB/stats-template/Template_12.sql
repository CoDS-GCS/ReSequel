SELECT COUNT(*)
FROM tags AS t,
     posts AS p,
     users AS u,
     postHistory AS ph,
     badges AS b
WHERE p.Id = t.ExcerptPostId
  AND u.Id = ph.UserId
  AND u.Id = b.UserId
  AND u.Id = p.OwnerUserId
  AND p.CommentCount >= ###
  AND u.DownVotes <= ###
  AND b.Date <= &&& :: timestamp;