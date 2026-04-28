SELECT COUNT(*)
FROM comments AS c,
     posts AS p,
     postLinks AS pl,
     postHistory AS ph,
     users AS u
WHERE pl.RelatedPostId = p.Id
  AND u.Id = c.UserId
  AND c.PostId = p.Id
  AND ph.PostId = p.Id
  AND c.CreationDate >= &&&
  AND c.CreationDate <= &&&
  AND p.CommentCount >= ###
  AND p.CommentCount <= ###
  AND pl.LinkTypeId = ###
  AND ph.CreationDate >= &&&
  AND u.Reputation >= ###
  AND u.Reputation <= ###
  AND u.DownVotes >= ###
  AND u.DownVotes <= ###;