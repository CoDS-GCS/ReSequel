WITH PostStats AS
  (SELECT PostTypeId,
          COUNT(Id) AS Cnt,
          SUM(Score) AS SumScore,
          SUM(ViewCount) AS SumViewCount
   FROM Posts
   GROUP BY PostTypeId)
SELECT pt.Name AS PostType,
       ps.Cnt AS TotalPosts,
       (ps.SumScore / ps.Cnt) AS AverageScore,
       (ps.SumViewCount / ps.Cnt) AS AverageViewCount
FROM PostStats ps
JOIN PostTypes pt ON ps.PostTypeId = pt.Id
ORDER BY TotalPosts DESC;