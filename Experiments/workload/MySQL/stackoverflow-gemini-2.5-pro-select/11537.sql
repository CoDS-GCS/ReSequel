
SELECT pt.Name AS PostType,
       p_agg.Cnt AS TotalPosts,
       (p_agg.SumScore / p_agg.Cnt) AS AverageScore,
       (p_agg.SumViewCount / p_agg.Cnt) AS AverageViewCount
FROM
  (SELECT PostTypeId,
          COUNT(*) AS Cnt,
          SUM(Score) AS SumScore,
          SUM(ViewCount) AS SumViewCount
   FROM Posts
   GROUP BY PostTypeId) AS p_agg
JOIN PostTypes pt ON p_agg.PostTypeId = pt.Id
ORDER BY TotalPosts DESC;