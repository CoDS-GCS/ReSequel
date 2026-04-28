#ifndef CONNECTION_H
#define CONNECTION_H


#pragma once
#include "CatalogInfo.h"
#include "Config.h"

namespace minidb {

    class CatalogBuilderFactory {
   		public:
        	static CatalogInfo build(const Config& config, const std::string& save_path);
    };

}  // namespace minidb

#endif //CONNECTION_H
