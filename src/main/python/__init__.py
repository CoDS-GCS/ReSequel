import os
import sys
from os.path import dirname

PACKAGE_PATH = dirname(__file__)
if PACKAGE_PATH not in sys.path:
    sys.path.append(PACKAGE_PATH)




# __all__ = [
#     "config",
#     "load_dataset_catalog",
#     "get_dataset_names",
#     "get_dataset_path",
#     "get_catalogs",
#     "get_catalog_path",
#     "generate_pipeline",
#     "create_report",
#     "prepare_dataset"
# ]