SELECT pancreactomy22.nppesproviderlastorgname AS nppesproviderlastorgname,
       pancreactomy22.nppesproviderstate AS nppesproviderstate,
       pancreactomy22.providertype AS providertype,
       percentile_cont(0.5) WITHIN GROUP (
                                          ORDER BY pancreactomy22.averagemedicarepaymentamt) AS medaveragemedicarepaymentamtok,
                                         percentile_cont(0.5) WITHIN GROUP (
                                                                            ORDER BY pancreactomy22.averagesubmittedchrgamt) AS medaveragesubmittedchrgamtok,
                                                                           SUM(pancreactomy22.averagemedicarepaymentamt) AS sumaveragemedicarepaymentamtok,
                                                                           SUM(pancreactomy22.linesrvccnt) AS sumlinesrvccntok
FROM pancreactomy22
WHERE ((pancreactomy22.providertype IN (N_SSS))
       AND (pancreactomy22.hcpcsdescription IN (N_SSS)))
GROUP BY pancreactomy22.nppesproviderlastorgname,
         pancreactomy22.nppesproviderstate,
         pancreactomy22.providertype;