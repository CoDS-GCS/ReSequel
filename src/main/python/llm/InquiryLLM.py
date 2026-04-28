from .InquiryLLMGemini import InquiryLLMGemini
from .InquiryLLMGemini import InquiryLLMGemini


class InquiryLLM:

    @staticmethod
    def inquiry_llm(user_message: str, system_message: str):
        from util.Config import _llm_platform, _OPENAI, _META, _GOOGLE

        if _llm_platform is None:
            raise Exception("Select a LLM Platform: OpenAI (GPT) or Meta (Lama)")
        elif _llm_platform == _OPENAI:
            pass
            #return GenerateLLMCodeGPT.generate_code_OpenAI_LLM(user_message=user_message, system_message=system_message)
        elif _llm_platform == _META:
            pass
            #return GenerateLLMCodeLLaMa.generate_code_LLaMa_LLM(user_message=user_message, system_message=system_message)
        elif _llm_platform == _GOOGLE:
            return InquiryLLMGemini.inquery_Gemini_LLM(user_message=user_message, system_message=system_message)

        else:
            raise Exception(f"Model {_llm_platform} is not implemented yet!")