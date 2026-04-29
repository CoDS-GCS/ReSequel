
SELECT pt.Name AS PostType,
       ap.TotalPosts,
       ap.AverageScore,
       ap.AverageViewCount
FROM
  (SELECT PostTypeId,
          COUNT(*) AS TotalPosts,
          AVG(Score) AS AverageScore,
          AVG(ViewCount) AS AverageViewCount
   FROM Posts
   GROUP BY PostTypeId) AS ap
JOIN PostTypes pt ON ap.PostTypeId = pt.Id
ORDER BY ap.TotalPosts DESC;