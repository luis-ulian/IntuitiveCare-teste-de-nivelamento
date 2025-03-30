from requests import get
from bs4 import BeautifulSoup
from urllib.request import urlretrieve
from zipfile import ZipFile, ZIP_DEFLATED
from os import mkdir, remove

url = 'https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos'
page = get(url)

soup = BeautifulSoup(page.text, 'html.parser')

ol = soup.find('ol')
anchors = ol.find_all('a')

links = []

for anchor in anchors:
    if anchor["href"].find(".pdf") > 0:
        links.append(anchor["href"])


while True:
    try:
        print("Aguarde, baixando arquivos...\n")
        urlretrieve(links[0], './exercicio1/arquivos/AnexoI.pdf')
        urlretrieve(links[1], './exercicio1/arquivos/AnexoII.pdf') 
        break
    except FileNotFoundError:
        mkdir('./exercicio1/arquivos/')

zip_path = "./exercicio1/arquivos/Anexos.zip"

with ZipFile(zip_path, 'w', ZIP_DEFLATED) as zip:
    zip.write("./exercicio1/arquivos/AnexoI.pdf", arcname="AnexoI.pdf")
    zip.write("./exercicio1/arquivos/AnexoII.pdf", arcname="AnexoII.pdf")

remove("./exercicio1/arquivos/AnexoI.pdf")
remove("./exercicio1/arquivos/AnexoII.pdf")



