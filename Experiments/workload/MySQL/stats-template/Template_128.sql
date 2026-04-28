SELECT COUNT(*)
FROM comments AS c,
     posts AS p,
     postLinks AS pl,
     postHistory AS ph,
     votes AS v
WHERE p.Id = pl.PostId
  AND p.Id = v.PostId
  AND p.Id = ph.PostId
  AND p.Id = c.PostId
  AND c.CreationDate <= &&&
  AND p.Score >= ###
  AND p.ViewCount <= ###
  AND p.AnswerCount >= ###
  AND p.CreationDate >= &&&
  AND v.VoteTypeId = ###;