from xml.dom import minidom
from robot.api import ExecutionResult
from datetime import datetime
import pytz

def get_resultado_automacao(path, type):

    # Obtém o total de sucessos e falhas
    results_sucess = get_total_sucess(path)
    results_failures, failed_test_names = get_total_failures_and_names(path)

     # Define o fuso horário do Brasil
    brasil_tz = pytz.timezone('America/Sao_Paulo')

    # Obtém a data e hora corrente
    current_datetime_brasil = datetime.now(brasil_tz).strftime('%d/%m/%Y %H:%M')

    # Cria a mensagem formatada
    message = f'*==============================================================*\n'
    message += f'🤖 Resultado dos Testes ({current_datetime_brasil})\n\n'
    message += f'\n*➔  {type.upper()}:*\n\n'  # Coloca o tipo em negrito e em maiúsculas
    message += f'✅ Total de casos executados com sucesso: *{results_sucess}*\n'  # Check verde 
    message += f'❌ Total de casos executados com falha: *{results_failures}*\n'  # X vermelho     

    if failed_test_names:
        message += '\n\n*Casos de teste com falhas:*\n'
        for test in failed_test_names:
            message += f'- {test}\n'

    return message    

def get_total_sucess(path):
    with open(path, 'r', encoding='utf-8') as f:
        xml = minidom.parse(f)
        testSuite = xml.getElementsByTagName('stat')
        # Assumindo que o total de sucessos é o valor do atributo 'pass' no primeiro <stat>
        total_success = int(testSuite[0].getAttribute('pass'))
    return total_success

def get_total_failures_and_names(path):
    with open(path, 'r', encoding='utf-8') as f:
        xml = minidom.parse(f)

        # Obtém o número de falhas do arquivo XML
        testSuite = xml.getElementsByTagName('stat')
        total_failures = int(testSuite[0].getAttribute('fail'))

        # Inicializa a lista para os nomes dos testes com falha
        failed_tests = []

        # Obtém todas as keywords (<kw>), pois os testes podem estar em diferentes níveis
        keywords = xml.getElementsByTagName('kw')

        for kw in keywords:
            # Procura elementos <status> e <msg>
            status_elements = kw.getElementsByTagName('status')
            if len(status_elements) > 0:
                status = status_elements[0]
                if status.getAttribute('status') == 'FAIL':
                    # Captura o nome da keyword ou mensagem de erro
                    test_name = kw.getAttribute('name')
                    failed_tests.append(test_name)

            # Captura mensagens de erro, caso existam
            msg_elements = kw.getElementsByTagName('msg')
            for msg in msg_elements:
                if msg.getAttribute('level') == 'FAIL':
                    error_msg = msg.firstChild.nodeValue
                    failed_tests.append(f"Erro: {error_msg}")

        return total_failures, failed_tests