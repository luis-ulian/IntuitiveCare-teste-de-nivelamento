from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework import status
#from .models import Empresa
#from .serializer import TabelaEmpresaSerializer

from pandas import read_csv

@api_view(['GET'])
def get_empresas(request):
    file_path = './Relatorio_cadop.csv'

    tabela_empresas = read_csv(file_path, header=0, encoding='utf-8', on_bad_lines='skip', sep=';')

    columns_to_ignore = ['Nome_Fantasia','Logradouro','Numero','Complemento','Bairro','Cidade','UF','DDD','Telefone','Fax','Endereco_eletronico','Cargo_Representante','Regiao_de_Comercializacao','Data_Registro_ANS']
    tabela_empresas = tabela_empresas.drop(columns_to_ignore, axis=1)

    return Response(tabela_empresas.to_json(orient='records'))
