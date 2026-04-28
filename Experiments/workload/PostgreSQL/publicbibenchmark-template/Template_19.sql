SELECT pancreactomy22.hcpcscode AS hcpcscode,
       pancreactomy22.hcpcsdescription AS hcpcsdescription,
       CAST(pancreactomy22.npi AS BIGINT) AS npi,
       pancreactomy22.nppesproviderlastorgname AS nppesproviderlastorgname,
       pancreactomy22.nppesproviderstate AS nppesproviderstate,
       pancreactomy22.providertype AS providertype,
       SUM(pancreactomy22.averagemedicarepaymentamt) AS sumaveragemedicarepaymentamtok,
       SUM(pancreactomy22.linesrvccnt) AS sumlinesrvccntok
FROM pancreactomy22
WHERE ((pancreactomy22.hcpcsdescription IN (N_SSS))
       AND ((pancreactomy22.providertype NOT IN (N_SSS))
            OR (pancreactomy22.providertype IS NULL)))
GROUP BY pancreactomy22.hcpcscode,
         pancreactomy22.hcpcsdescription,
         pancreactomy22.npi,
         pancreactomy22.nppesproviderlastorgname,
         pancreactomy22.nppesproviderstate,
         pancreactomy22.providertype,
         pancreactomy22.npi;