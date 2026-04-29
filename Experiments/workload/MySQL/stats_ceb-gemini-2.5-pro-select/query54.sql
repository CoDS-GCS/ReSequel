WITH FilteredPosts AS
  (SELECT Id,
          OwnerUserId
   FROM posts
   WHERE Score = 1
     AND ViewCount >= 0
     AND FavoriteCount >= 0),
     FilteredUsers AS
  (SELECT Id
   FROM users
   WHERE CreationDate >= '2011-02-08 18:11:37'),
     FilteredPostLinks AS
  (SELECT RelatedPostId
   FROM postLinks
   WHERE LinkTypeId = 1
     AND CreationDate >= '2011-04-12 15:23:59')
SELECT COUNT(*)
FROM FilteredPosts AS p
JOIN FilteredUsers AS u ON p.OwnerUserId = u.Id
JOIN FilteredPostLinks AS pl ON p.Id = pl.RelatedPostId
JOIN comments AS c ON p.Id = c.PostId
JOIN badges AS b ON u.Id = b.UserId;