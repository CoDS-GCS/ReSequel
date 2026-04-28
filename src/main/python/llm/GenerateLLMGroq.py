from groq import Groq
import time
import tiktoken

class GenerateLLMGroq:
    @staticmethod
    def optimize_sql_Groq_LLM(user_message: str, system_message: str):
        from util.Config import _LLM_API_Key
        _, api_key = _LLM_API_Key.get_API_Key()
        client = Groq(api_key=api_key)
        messages = [
            {"role": "system", "content": system_message},
            {"role": "user", "content": user_message}
        ]
        code, funcs ,gen_time = GenerateLLMGroq.__submit_Request_Groq_LLM(messages=messages, client=client)
        return code, funcs, GenerateLLMGroq.get_number_tokens(user_message=user_message, system_message=system_message, output=code), gen_time

    @staticmethod
    def __submit_Request_Groq_LLM(messages, client):
        from util.Config import _llm_model, _LLM_API_Key, _temperature,_max_token_limit
        time_start = time.time()
        completion = client.chat.completions.create(
            model = f"openai/{_llm_model}",
            messages = messages,
            temperature = _temperature,
            reasoning_effort="low",
            top_p=1,
            max_completion_tokens=_max_token_limit
        )
        try:
                code = completion.choices[0].message.content
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
                code = code[begin_point + len(begin_key):end_point - len(end_key)]

                time_end = time.time()
                return code, funcs, time_end - time_start

        except Exception as err:
                _, api_key = _LLM_API_Key.get_API_Key()
                client = Groq(api_key=api_key)
                return GenerateLLMGroq.__submit_Request_Groq_LLM(messages=messages, client=client)

    @staticmethod
    def get_number_tokens(user_message: str, system_message: str, output: str):
        enc = tiktoken.get_encoding("cl100k_base")
        enc = tiktoken.encoding_for_model("gpt-3.5-turbo")
        token_integers = enc.encode(user_message + system_message+ output)
        num_tokens = len(token_integers)
        return num_tokens