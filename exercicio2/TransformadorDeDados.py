from tabula.io import read_pdf
from zipfile import ZipFile
from os import mkdir, remove
from datetime import datetime
import pandas as pd
from zipfile import ZipFile, ZIP_DEFLATED

unzip_file = "./exercicio1/arquivos/Anexos.zip"
directory_to_extract_to = "./exercicio2/arquivos/"

with ZipFile(unzip_file, 'r') as zip:
    while True:
        try:
            zip.extractall(directory_to_extract_to)
            break
        except FileNotFoundError:
            mkdir("./exercicio2/arquivos/")

pdf_to_read = "./exercicio2/arquivos/AnexoI.pdf"
output_path = f"./exercicio2/arquivos/{datetime.now().strftime("%H%M%S")}.csv"

read_pdf(pdf_to_read, pages="3-181", encoding="utf-8", output_format="dataframe", lattice=False, guess=False, output_path=output_path)

df = pd.read_csv(output_path, header=0, encoding='utf-8', on_bad_lines='skip')
df = df.replace(r"\r", " ", regex=True)
df = df.drop_duplicates(keep=False)

df.rename(columns={'OD' : 'Seg. Odontológica', 'AMB' : 'Seg. Ambulatorial', 'RN\r(alteração)' : 'RN (alteração)'}, inplace=True)
df.to_csv(output_path, index=False)

zip_path = "./exercicio2/arquivos/Teste_Luís_Gustavo_Ulian_Lara.zip"
with ZipFile(zip_path, 'w', ZIP_DEFLATED) as zip:
    zip.write(output_path, arcname="new.csv")

remove("./exercicio2/arquivos/AnexoI.pdf")
remove("./exercicio2/arquivos/AnexoII.pdf")
remove(output_path)