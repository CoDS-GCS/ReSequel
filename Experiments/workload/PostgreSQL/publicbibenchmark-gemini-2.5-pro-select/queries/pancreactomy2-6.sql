
SELECT nppesproviderlastorgname,
       nppesproviderstate,
       CAST(nppesproviderzip AS BIGINT) AS nppesproviderzip,
       providertype,
       SUM(linesrvccnt) AS sumlinesrvccntok
FROM pancreactomy22
WHERE hcpcsdescription = 'Imaging of pancreatic duct for placement of catheter using an endoscope'
GROUP BY nppesproviderlastorgname,
         nppesproviderstate,
         CAST(nppesproviderzip AS BIGINT),
         providertype;