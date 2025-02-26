import urllib3

def disable_request_warning():
    urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)


# Essa função desativa os warnings de conexões inseguras do urllib3.
# Se o script não faz requisições HTTP inseguras, pode ser removido.
