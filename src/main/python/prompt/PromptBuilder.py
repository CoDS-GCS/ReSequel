from catalog.Catalog import CatalogInfo
from .BasicPrompt import BasicPrompt
from .GenerateQueriesPrompt import GenerateQueriesPrompt
from .VerifyQueriesPrompt import VerifyQueriesPrompt
from .ImplementPrompt import ImplementPrompt


def prompt_factory(catalog: CatalogInfo, work_load: []):
    class PromptClass(BasicPrompt):
        def __init__(self, *args, **kwargs):
            self.catalog = catalog
            self.work_load = work_load
            BasicPrompt.__init__(self, *args, **kwargs)

    return PromptClass()

def prompt_factory_generate_queries(catalog: CatalogInfo, template: str, list_size: int):
    class PromptClass(GenerateQueriesPrompt):
        def __init__(self, *args, **kwargs):
            self.catalog = catalog
            self.template = template
            GenerateQueriesPrompt.__init__(self, list_size,*args, **kwargs)

    return PromptClass()

def prompt_factory_implement(catalog: CatalogInfo, table_name: str):
    class PromptClass(ImplementPrompt):
        def __init__(self, *args, **kwargs):
            self.catalog = catalog
            self.table_name = table_name
            ImplementPrompt.__init__(self,table_name, *args, **kwargs)

    return PromptClass()

def prompt_factory_verify_queries(catalog: CatalogInfo, template: str, queries: []):
    class PromptClass(VerifyQueriesPrompt):
        def __init__(self, *args, **kwargs):
            self.catalog = catalog
            self.template = template
            self.queries = queries
            VerifyQueriesPrompt.__init__(self, template=template,queries=queries,*args, **kwargs)

    return PromptClass()