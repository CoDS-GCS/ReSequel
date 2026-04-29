WITH aggregated_data AS
  (SELECT nppesproviderlastorgname,
          nppesproviderstate,
          nppesproviderzip,
          providertype,
          SUM(linesrvccnt) AS sumlinesrvccntok
   FROM pancreactomy21
   WHERE hcpcsdescription = 'Imaging of pancreatic duct for placement of catheter using an endoscope'
   GROUP BY nppesproviderlastorgname,
            nppesproviderstate,
            nppesproviderzip,
            providertype)
SELECT nppesproviderlastorgname,
       nppesproviderstate,
       CAST(nppesproviderzip AS BIGINT) AS nppesproviderzip,
       providertype,
       sumlinesrvccntok
FROM aggregated_data;