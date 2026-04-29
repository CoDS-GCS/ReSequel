WITH FilteredPostHistory AS
  (SELECT UserId,
          COUNT(*) AS ph_count
   FROM postHistory
   WHERE CreationDate >= '2010-07-27 18:08:19'
     AND CreationDate <= '2014-09-10 08:22:43'
   GROUP BY UserId),
     FilteredPosts AS
  (SELECT OwnerUserId,
          COUNT(*) AS p_count
   FROM posts
   WHERE PostTypeId = 2
   GROUP BY OwnerUserId),
     FilteredBadges AS
  (SELECT UserId,
          COUNT(*) AS b_count
   FROM badges
   GROUP BY UserId)
SELECT SUM(ph.ph_count * p.p_count * b.b_count)
FROM users AS u
JOIN FilteredPostHistory AS ph ON u.Id = ph.UserId
JOIN FilteredPosts AS p ON u.Id = p.OwnerUserId
JOIN FilteredBadges AS b ON u.Id = b.UserId;