
SELECT rome,
       romelib,
       MIN(codgeoprincipal) AS mincodgeoprincipalnk,
       SUM(empsalnp1) AS sumempsalnp1ok
FROM salariesfrance6
GROUP BY rome,
         romelib
HAVING SUM(empsalnp1) >= 0.0;