
SELECT pt.Name AS PostType,
       p_agg.TotalPosts,
       p_agg.AverageScore,
       p_agg.TotalViews
FROM
  (SELECT PostTypeId,
          COUNT(Id) AS TotalPosts,
          AVG(Score) AS AverageScore,
          SUM(ViewCount) AS TotalViews
   FROM Posts
   GROUP BY PostTypeId) AS p_agg
JOIN PostTypes pt ON p_agg.PostTypeId = pt.Id
ORDER BY p_agg.TotalPosts DESC;