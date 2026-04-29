WITH user_comments AS
  (SELECT u.Id,
          COUNT(c.Id) AS c_count
   FROM users u
   JOIN comments c ON u.Id = c.UserId
   WHERE u.Reputation >= 1
     AND u.Reputation <= 7931
     AND u.Views <= 109
     AND u.DownVotes >= 0
     AND u.CreationDate <= '2014-09-12 13:12:56'
   GROUP BY u.Id)
SELECT SUM(uc.c_count *
             (SELECT COUNT(*)
              FROM postHistory ph
              WHERE ph.UserId = uc.Id))
FROM user_comments uc;