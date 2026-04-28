SELECT COUNT(*)
FROM postHistory AS ph,
     posts AS p,
     votes AS v,
     users AS u
WHERE u.Id = p.OwnerUserId
  AND p.Id = ph.PostId
  AND p.Id = v.PostId
  AND ph.CreationDate <= &&& :: timestamp
  AND p.PostTypeId = ###
  AND p.AnswerCount >= ###
  AND p.AnswerCount <= ###
  AND v.CreationDate >= &&& :: timestamp
  AND v.CreationDate <= &&& :: timestamp
  AND u.DownVotes = ###
  AND u.CreationDate <= &&& :: timestamp;