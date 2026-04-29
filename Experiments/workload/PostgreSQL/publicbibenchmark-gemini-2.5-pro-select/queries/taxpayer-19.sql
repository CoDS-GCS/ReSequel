
SELECT AVG(averagemedicareallowedamt - averagemedicarepaymentamt) AS avgcalculation9940518082838207ok,
       AVG(averagemedicareallowedamt) AS avgaveragemedicareallowedamtok,
       AVG(averagemedicarepaymentamt) AS avgaveragemedicarepaymentamtok,
       AVG(averagesubmittedchrgamt) AS avgaveragesubmittedchrgamtok,
       hcpcsdescription
FROM
  (SELECT hcpcsdescription,
          averagemedicareallowedamt,
          averagemedicarepaymentamt,
          averagesubmittedchrgamt
   FROM taxpayer8
   WHERE nppesproviderfirstname = 'JOHN'
     AND nppesproviderlastorgname = 'HOLDER'
     AND nppesproviderstate = 'WA') AS filtered_taxpayer
GROUP BY hcpcsdescription;