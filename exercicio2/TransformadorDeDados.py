from tabula.io import read_pdf
from zipfile import ZipFile
from os import mkdir, remove
from datetime import datetime
import camelot as amelot

unzip_file = "./exercicio1/arquivos/Anexos.zip"
directory_to_extract_to = "./exercicio2/arquivos/"

with ZipFile(unzip_file, 'r') as zip:
    while True:
        try:
            zip.extractall(directory_to_extract_to)
            break
        except FileNotFoundError:
            mkdir("./exercicio2/arquivos/")


#tentativa com tabula automaticamente
read_pdf("./exercicio2/arquivos/AnexoI.pdf", pages="3-181", output_format="dataframe", output_path=f"./exercicio2/arquivos/{datetime.now().strftime("%H%M%S")}.csv")

#tentativa com camelot
#tables = amelot.read_pdf("./exercicio2/arquivos/AnexoI.pdf", pages="180-181", flavor="lattice")
#tables.export(f"exercicio2/arquivos/{datetime.now().strftime("%H%M%S")}.csv",  f='csv', compress=False) #mudar compress para true no final

remove("./exercicio2/arquivos/AnexoI.pdf")
remove("./exercicio2/arquivos/AnexoII.pdf")