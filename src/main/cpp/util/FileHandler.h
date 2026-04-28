#ifndef FILEHANDLER_H
#define FILEHANDLER_H

#include <string>

class FileHandler {
    public:
        // Reads the entire contents of a text file and returns it as a string
        static std::string ReadEntireTextFile(const std::string& filePath);

        // Saves the given text data to a file
        static void SaveTextFile(const std::string& filePath, const std::string& data);
    };



#endif //FILEHANDLER_H
