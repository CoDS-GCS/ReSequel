WITH PostAggregates AS
  (SELECT PostTypeId,
          COUNT(Id) AS TotalPosts,
          SUM(Score) AS SumScore,
          SUM(ViewCount) AS SumViewCount
   FROM Posts
   GROUP BY PostTypeId)
SELECT pt.Name AS PostType,
       pa.TotalPosts,
       pa.SumScore / pa.TotalPosts AS AverageScore,
       pa.SumViewCount / pa.TotalPosts AS AverageViewCount
FROM PostAggregates pa
JOIN PostTypes pt ON pa.PostTypeId = pt.Id
ORDER BY pa.TotalPosts DESC;