WITH AggregatedPosts AS
  (SELECT PostTypeId,
          COUNT(*) AS TotalPosts,
          AVG(Score) AS AverageScore,
          AVG(ViewCount) AS AverageViewCount
   FROM Posts
   GROUP BY PostTypeId)
SELECT pt.Name AS PostType,
       ap.TotalPosts,
       ap.AverageScore,
       ap.AverageViewCount
FROM AggregatedPosts ap
JOIN PostTypes pt ON ap.PostTypeId = pt.Id
ORDER BY ap.TotalPosts DESC;