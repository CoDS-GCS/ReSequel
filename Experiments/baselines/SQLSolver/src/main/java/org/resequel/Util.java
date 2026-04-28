package org.resequel;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

public class Util {

    public String ReadEntireFile(String file_path){
        Path filePath = Paths.get(file_path);
        try {
            String content = Files.readString(filePath);
            return content;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

    public String ReadEntireFile(Path filePath){
        try {
            String content = Files.readString(filePath);
            return content;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

    public void saveLog(String fname, String data, String header) throws IOException {
        if (header!= null)
            data = header+"\n"+ data;
        Files.writeString(Path.of(fname), data);
    }

    public Map<String, String> getWorkloadQueries(String workloadPath){
        Path dir = Paths.get(workloadPath);
        Map<String, String> result = new HashMap<>();
        Set<String> ignore = Set.of("schema.sql", "import.sql","index.sql");
        try {
            List<Path> sqlFiles = Files.list(dir)
                    .filter(Files::isRegularFile)
                    .filter(p -> p.toString().toLowerCase().endsWith(".sql"))
                    .filter(p -> !ignore.contains(p.getFileName().toString()))
                    .collect(Collectors.toList());

            for (Path p: sqlFiles){
                String sqlQuery = this.ReadEntireFile(p);
                String queryID = p.getFileName().toString();
                result.put(queryID, sqlQuery);
            }
        }
        catch (Exception ignored){}

        return result;
    }


}
