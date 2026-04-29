
SELECT nppesprovidergender,
       nppesproviderlastorgname,
       nppesproviderstate,
       providertype,
       SUM(averagemedicarepaymentamt) AS sumaveragemedicarepaymentamtok,
       SUM(linesrvccnt) AS sumlinesrvccntok
FROM pancreactomy22
WHERE providertype IN ('General Surgery', 'Surgical Oncology', 'Vascular Surgery')
  AND hcpcsdescription IN ('Pancreas procedure', 'Partial removal of pancreas', 'Partial removal of pancreas with attachment to small bowel', 'Partial removal of pancreas, bile duct and small bowel with connection of pancreas to small bowel')
GROUP BY nppesprovidergender,
         nppesproviderlastorgname,
         nppesproviderstate,
         providertype;