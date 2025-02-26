import os
from dotenv import load_dotenv


def get_environment_variables():
    load_dotenv()

    environment_variables = {
        'SLACK_INCOMING_WEBHOOK_URL': os.getenv('SLACK_INCOMING_WEBHOOK_URL'),
        'USER': os.getenv('USER'),
        'PASSWORD': os.getenv('PASSWORD'),
        'BASE_URL': os.getenv('BASE_URL')
    }

    return environment_variables