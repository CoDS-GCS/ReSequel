WITH filtered_data AS
  (SELECT nppesproviderlastorgname,
          nppesproviderstate,
          providertype,
          averagemedicarepaymentamt,
          averagesubmittedchrgamt,
          linesrvccnt
   FROM pancreactomy22
   WHERE providertype IN ('General Surgery', 'Surgical Oncology')
     AND hcpcsdescription IN ('Pancreas procedure', 'Partial removal of pancreas', 'Partial removal of pancreas with attachment to small bowel', 'Partial removal of pancreas, bile duct and small bowel with connection of pancreas to small bowel'))
SELECT nppesproviderlastorgname,
       nppesproviderstate,
       providertype,
       percentile_cont(0.5) WITHIN GROUP (
                                          ORDER BY averagemedicarepaymentamt) AS medaveragemedicarepaymentamtok,
                                         percentile_cont(0.5) WITHIN GROUP (
                                                                            ORDER BY averagesubmittedchrgamt) AS medaveragesubmittedchrgamtok,
                                                                           SUM(averagemedicarepaymentamt) AS sumaveragemedicarepaymentamtok,
                                                                           SUM(linesrvccnt) AS sumlinesrvccntok
FROM filtered_data
GROUP BY nppesproviderlastorgname,
         nppesproviderstate,
         providertype;