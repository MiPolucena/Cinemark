import os
from dotenv import load_dotenv


def get_environment_variables():
    load_dotenv()

    environment_variables = {
        'USER': os.getenv('USER'),
        'PASSWORD': os.getenv('PASSWORD'),
        'BASE_URL': os.getenv('BASE_URL')
    }

    return environment_variables