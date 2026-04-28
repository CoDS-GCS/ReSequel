from google import genai
from google.genai import types
import time


class InquiryLLMGemini:
    @staticmethod
    def inquery_Gemini_LLM(user_message: str, system_message: str):
        from util.Config import _LLM_API_Key
        _, api_key = _LLM_API_Key.get_API_Key()
        client = genai.Client(api_key=api_key)
        result, number_of_tokens, time_gen = InquiryLLMGemini.__submit_Request_Gemini_LLM(user_message=user_message, system_message=system_message, client=client)
        return result, number_of_tokens, time_gen

    @staticmethod
    def __submit_Request_Gemini_LLM(user_message: str, system_message: str, client):
        from util.Config import _LLM_API_Key, _llm_model, _temperature, _top_p, _top_k, _max_out_token_limit

        time_start = time.time()
        contents = [
            types.Content(
                role="user",
                parts=[types.Part.from_text(text=user_message)],
            )
        ]

        generation_config = types.GenerateContentConfig(
            temperature=_temperature,
            top_p=_top_p,
            top_k=_top_k,
            max_output_tokens=_max_out_token_limit,
            safety_settings=[
                types.SafetySetting(
                    category="HARM_CATEGORY_CIVIC_INTEGRITY",
                    threshold="BLOCK_LOW_AND_ABOVE",  # Block most
                ),
            ],
            response_mime_type="text/plain",
            system_instruction=[ types.Part.from_text( text=system_message )],
        )

        try:
            response = client.models.generate_content(model=_llm_model,
                    contents=contents,
                    config=generation_config)
            result = response.text
            time_end = time.time()
            return result, response.usage_metadata.total_token_count, time_end - time_start

        except Exception as err:
            _, api_key = _LLM_API_Key.get_API_Key()
            client = genai.Client(api_key=api_key)
            return InquiryLLMGemini.__submit_Request_Gemini_LLM(user_message=user_message, system_message=system_message, client=client)