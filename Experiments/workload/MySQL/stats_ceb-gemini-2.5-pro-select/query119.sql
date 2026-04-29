WITH user_badge_counts AS
  (SELECT UserId,
          COUNT(*) AS badge_count
   FROM badges
   WHERE Date >= '2010-07-20 10:34:10'
   GROUP BY UserId),
     user_post_counts AS
  (SELECT OwnerUserId,
          COUNT(*) AS post_count
   FROM posts
   WHERE ViewCount >= 0
     AND ViewCount <= 2024
   GROUP BY OwnerUserId),
     user_ph_counts AS
  (SELECT UserId,
          COUNT(*) AS ph_count
   FROM postHistory
   WHERE PostHistoryTypeId = 5
   GROUP BY UserId)
SELECT SUM(b.badge_count * p.post_count * ph.ph_count)
FROM users u
JOIN user_badge_counts b ON u.Id = b.UserId
JOIN user_post_counts p ON u.Id = p.OwnerUserId
JOIN user_ph_counts ph ON u.Id = ph.UserId
WHERE u.Reputation >= 1
  AND u.Reputation <= 750;