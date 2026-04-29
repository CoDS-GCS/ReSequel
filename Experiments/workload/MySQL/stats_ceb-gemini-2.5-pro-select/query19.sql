
SELECT COUNT(*)
FROM postLinks AS pl
WHERE pl.PostId IN
    (SELECT p.Id
     FROM posts AS p
     JOIN users AS u ON p.OwnerUserId = u.Id
     WHERE p.CommentCount <= 17
       AND u.CreationDate <= '2014-09-12 07:12:16');