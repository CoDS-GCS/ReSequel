
SELECT pt.Name AS PostType,
       ap.TotalPosts,
       ap.AverageScore,
       ap.TotalViews
FROM
  (SELECT PostTypeId,
          COUNT(*) AS TotalPosts,
          AVG(Score) AS AverageScore,
          SUM(ViewCount) AS TotalViews
   FROM Posts
   GROUP BY PostTypeId) AS ap
JOIN PostTypes pt ON ap.PostTypeId = pt.Id
ORDER BY ap.TotalPosts DESC;