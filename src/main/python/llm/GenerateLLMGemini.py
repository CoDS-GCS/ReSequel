from google import genai
from google.genai import types
import time


class OptimizeLLMSQLGemini:
    @staticmethod
    def optimize_sql_Gemini_LLM(user_message: str, system_message: str):
        from util.Config import _LLM_API_Key
        _, api_key = _LLM_API_Key.get_API_Key()
        client = genai.Client(api_key=api_key)
        code, funcs, number_of_tokens, time_gen = OptimizeLLMSQLGemini.__submit_Request_Gemini_LLM(user_message=user_message, system_message=system_message, client=client)
        return code, funcs, number_of_tokens, time_gen

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
            code = response.text
            funcs = None
            if "<FUNCTIONS>" in code and "</FUNCTIONS>" in code:
                begin_key = "<FUNCTIONS>"
                end_key = "</FUNCTIONS>"
                begin_point = code.find(begin_key)
                end_point = code.find(end_key)
                funcs = code[begin_point + len(begin_key): end_point]

            begin_key = "```sql"
            end_key = "```"[::-1]
            begin_point = code.find(begin_key)
            if begin_point == -1:
                begin_key = "```\nsql"
                begin_point = code.find(begin_key)

            end_point = len(code) - code[::-1].find(end_key)
            code = code[begin_point+len(begin_key):end_point- len(end_key)]

            time_end = time.time()
            print(f"len text = {len(user_message) + len(system_message)}  , input tokens = {response.usage_metadata.total_token_count} -- {response.usage_metadata.prompt_token_count}")
            return code, funcs, response.usage_metadata.total_token_count, time_end - time_start

        except Exception as err:
            _, api_key = _LLM_API_Key.get_API_Key()
            client = genai.Client(api_key=api_key)
            return OptimizeLLMSQLGemini.__submit_Request_Gemini_LLM(user_message=user_message, system_message=system_message, client=client)

    @staticmethod
    def get_number_tokens(messages: str):

        from util.Config import _llm_model, _temperature, _top_p, _top_k, _max_out_token_limit

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
            #system_instruction=[types.Part.from_text(text=messages)],
        )

        safety_settings = [
            {"category": "HARM_CATEGORY_HARASSMENT", "threshold": "BLOCK_MEDIUM_AND_ABOVE"},
            {"category": "HARM_CATEGORY_HATE_SPEECH", "threshold": "BLOCK_MEDIUM_AND_ABOVE"},
            {"category": "HARM_CATEGORY_SEXUALLY_EXPLICIT", "threshold": "BLOCK_MEDIUM_AND_ABOVE"},
            {"category": "HARM_CATEGORY_DANGEROUS_CONTENT", "threshold": "BLOCK_MEDIUM_AND_ABOVE"},
        ]

        model = genai.GenerativeModel(model_name=_llm_model,
                                      generation_config=generation_config,
                                      safety_settings=safety_settings)

        number_of_tokens = model.count_tokens(messages).total_tokens
        return number_of_tokens