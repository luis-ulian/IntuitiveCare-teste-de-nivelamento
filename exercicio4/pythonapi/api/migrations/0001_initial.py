# Generated by Django 5.1.7 on 2025-03-29 07:38

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Empresa',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('cod_ans', models.CharField(max_length=10)),
                ('cod_cnpj', models.CharField(max_length=15)),
                ('des_razao_social', models.CharField(max_length=150)),
                ('des_nome_fantasia', models.CharField(max_length=150)),
                ('des_modalidade', models.CharField(max_length=50)),
                ('des_logradouro', models.CharField(max_length=50)),
                ('numero', models.CharField(max_length=25)),
                ('des_complemento', models.CharField(max_length=100)),
                ('des_bairro', models.CharField(max_length=25)),
                ('des_cidade', models.CharField(max_length=25)),
                ('des_uf', models.CharField(max_length=3)),
                ('cod_cep', models.CharField(max_length=10)),
                ('num_ddd', models.CharField(max_length=3)),
                ('num_telefone', models.CharField(max_length=20)),
                ('num_fax', models.CharField(max_length=12)),
                ('des_email', models.CharField(max_length=150)),
                ('des_representante', models.CharField(max_length=50)),
                ('des_cargo_representante', models.CharField(max_length=25)),
                ('cod_regiao', models.IntegerField(max_length=2)),
                ('dta_ans', models.DateField(max_length=10)),
            ],
        ),
    ]
