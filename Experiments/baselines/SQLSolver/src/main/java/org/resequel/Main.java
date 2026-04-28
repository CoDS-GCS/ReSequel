package org.resequel;

import sqlsolver.api.entry.Verification;
import sqlsolver.superopt.logic.VerificationResult;
import java.io.IOException;
import java.util.Map;
import org.resequel.Util;

public class Main {
    public static void main(String[] args) throws IOException {
        String origWorkloadPah = System.getProperty("origWorkloadPah");
        String rewriteWorkloadPah = System.getProperty("rewriteWorkloadPah");
        String schemaPath = System.getProperty("schemaPath");
        String logFileName = System.getProperty("logFileName");
        String overallLogFileName = System.getProperty("overallLogFileName");

        Util util = new Util();
        String schema = util.ReadEntireFile(schemaPath);
        schema = schema.replace("\"","");

        StringBuilder resultLog = new StringBuilder();
        StringBuilder overallLog = new StringBuilder();


        Map<String, String> workloadQueries = util.getWorkloadQueries(origWorkloadPah);
        Map<String, String> workloadRewriteQueries = util.getWorkloadQueries(rewriteWorkloadPah);

        float eq = 0;
        float neq = 0;
        float unknown = 0;
        float timeout = 0;
        for (String qid: workloadQueries.keySet()){
            String origQuery = workloadQueries.get(qid);
            String newQuery = workloadRewriteQueries.get(qid);
            VerificationResult result = Verification.verify(origQuery, newQuery, schema);
            resultLog.append(qid).append(",").append(result).append("\n");

            if (result.equals(VerificationResult.EQ)){
                eq++;}
            else if (result.equals(VerificationResult.NEQ)) {
                neq++;
            }
            else if (result.equals(VerificationResult.UNKNOWN)) {
                unknown++;
            }
            else if (result.equals(VerificationResult.TIMEOUT)) {
                timeout++;
            }
        }
        float workloadSize = workloadQueries.size();
        overallLog.append(workloadSize).append(",").append(eq).append(",").append(neq).append(",").append(unknown).append(",").append(timeout).append("\n");
        overallLog.append(1).append(",").append(eq/workloadSize).append(",").append(neq/workloadSize).append(",").append(unknown/workloadSize).append(",").append(timeout/workloadSize).append("\n");
        util.saveLog(logFileName, resultLog.toString(),"query_id,result");
        util.saveLog(overallLogFileName, overallLog.toString(),"workload_size,EQ,NEQ,UNKNOWN,TIMEOUT");
    }
}