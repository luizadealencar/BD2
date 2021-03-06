# TrabalhoBD2


# TRABALHO 01 : CAGED
Trabalho desenvolvido durante a disciplina de BD2
 
# Sumário

### 1	COMPONENTES<br>
David Marques<br>
Leonardo Sena<br>
Luiza de Alencar<br>

### 2	BASE DE DADOS E INFORMAÇÕES <br>
CAGED <br>
Admissão e Dispensa dos Empregados do ES. <br>
A planilha mostra as admissões e demissões do estado do Espírito Santo, mostrando os cargos, as horas contratuais, o salário, se foi admitido ou demitido, e informações pessoais como idade, sexo, raça, se possui alguma deficiência, e de qual cidade é. Os anos contabilizados é de 2019 até agosto de 2020. <br>

### 3 FAST IMMERSION CANVAS <br>
![alt text](https://github.com/luizadealencar/BD2/blob/main/Fast%20Immersion%20Canvas.png)


### 4 FAST MODELLING CANVAS
![alt text](https://github.com/luizadealencar/BD2/blob/803f37f47aa4bfafbe166f9ec55b6f01f6828d57/Fast%20Modelling%20Canvas.png)

### 5 FAST EDA E PPD CANVAS
![alt text](https://github.com/luizadealencar/BD2/blob/6ed027ac96f27a5038311b448e8e390b3c300164/PPD.png)
[Collab familiarização com a base de dados](https://colab.research.google.com/drive/1-0cFi4NeX6exUe-B8O43pn5n6eMHtC5r?usp=sharing)

### 6 MAPA DE ETL

- Redução da base de dados sob o critério de municípios, dividimos a base em dois arquivos: CAGED_GV, referente aos municípios da grande Vitória, e outro com os demais municípios, afim de agilizar o processamento dos dados. 
- Neste ETL foi realizado um trim de todos os campos de texto e setado os valores iguais a "" (string vazia) para null

![ETL_CAGED_GV](https://github.com/luizadealencar/BD2/blob/main/ETL_CAGED_GV.png)
     
### 7	MODELO CONCEITUAL, LOGICO E FISICO - OLTP<br>

![CONCEITUAL_OLTP](https://github.com/luizadealencar/BD2/blob/main/modelo_conceitual_oltp.jpg)

### 8	MODELO CONCEITUAL, LOGICO E FISICO - OLAP<br>

Modelo Lógico<br>
![LOGICO_OLAP](https://github.com/luizadealencar/BD2/blob/main/modelo_logico.png)

[Script modelo fisíco](https://github.com/luizadealencar/BD2/blob/main/modelo_fisico.sql)<br>

### 9 CARGA DE DADOS, ANÁLISE DE METADADOS, ESTATÍSTICAS, SIZING E INDEXAÇÃO
#### 9.1	CARGA DE DADOS A ANÁLISE DOS RESULTADOS OBTIDOS
##### 9.1.1 Conhecimento, extração e limpeza dos dados

[Collab notebook](https://colab.research.google.com/drive/1-0cFi4NeX6exUe-B8O43pn5n6eMHtC5r?usp=sharing)

##### 9.1.2 Gera dimensões

![ETL_GERA_DIM](https://github.com/luizadealencar/BD2/blob/main/ETL_GERA_DIM.jpg)

##### 9.1.3 Gera fato

![ETL_GERA_FATO](https://github.com/luizadealencar/BD2/blob/main/ETL_GERA_FATO.jpg)

#### 9.2	ANÁLISE DE METADADOS, ESTATÍSTICAS, SIZING<br>
[Análise de Metados, Estatísticas e Sizing](https://github.com/luizadealencar/BD2/blob/b92738f6f551b9f8126adea3cfa363555ff45eb7/Metadados,%20Estat%C3%ADsticas%20e%20Sizing.pdf)

#### 9.3	Cubos e Dashboards<br>
[Cubos e Dimensões com Atoti](https://github.com/luizadealencar/BD2/blob/main/atoti-caged.ipynb)
###### Perguntas respondidas com o Cubo gerado
![Perguntas respondidas com atoti](https://github.com/luizadealencar/BD2/blob/main/atoti-perguntas.png)
<br>


#### 9.4	APLICAÇAO DE ÍNDICES E TESTES DE PERFORMANCE<br>
##### 9.4.1 Criação dos índices
``` sql
create index idx_jnk_caged_horascontratuais on dim_jnk_caged(horascontratuais);
create index idx_jnk_person_charac_desc_instr on dim_jnk_person_charac(desc_instr);
create index idx_jnk_person_charac_desc_raca on dim_jnk_person_charac(desc_raca);
create index idx_jnk_locale_cod_municipio on dim_jnk_locale(municipio);
create index idx_date_year on dim_date(year);
```
Obs: Implementamos esses índices, pois acreditamos que são as colunas "chaves" para as perguntas que podemos responder com a base de dados do CAGED.
Utilizamos o tipo de índice B-TREE para realizar filtros com os valores das colunas, assim acessando os dados com o mesmo valor mais rapidamente, otimizando nossa consulta.

##### 9.4.2 Performance esperada VS Resultados obtidos
Consulta
``` sql
select * from fato_registro 
inner join dim_jnk_person_charac 
on fato_registro.dim_jnk_person_charac = dim_jnk_person_charac.dim_jnk_person_charac
inner join dim_jnk_locale 
on fato_registro.dim_jnk_locale_cod = dim_jnk_locale.dim_jnk_locale_cod
inner join dim_date 
on fato_registro.dim_date_cod = dim_date.dim_date_cod
inner join dim_jnk_caged 
on fato_registro.dim_jnk_caged_cod = dim_jnk_caged.dim_jnk_caged_cod
where dim_jnk_caged.horascontratuais = 40 
and dim_date."year" = 2019
and dim_jnk_locale.municipio LIKE 'Vitoria'
```

| Tabela    | Sem Índice | Com Índice |
|-----------|------------|------------|
| planejado | 800ms     | 600ms      |
| execução  | 454ms      | 232ms     |


##### 9.4.3 Tabela de Resultados
**Sem Índice**
``` sql
EXPLAIN (FORMAT JSON) select * from fato_registro 
inner join dim_jnk_person_charac on fato_registro.dim_jnk_person_charac = dim_jnk_person_charac.dim_jnk_person_charac
inner join dim_jnk_locale on fato_registro.dim_jnk_locale_cod = dim_jnk_locale.dim_jnk_locale_cod
inner join dim_date on fato_registro.dim_date_cod = dim_date.dim_date_cod
inner join dim_jnk_caged on fato_registro.dim_jnk_caged_cod = dim_jnk_caged.dim_jnk_caged_cod
where dim_jnk_caged.horascontratuais = 40 
and dim_date."year" = 2019
and dim_jnk_locale.municipio LIKE 'Vitoria'
```
![Explain sem indice](https://github.com/luizadealencar/BD2/blob/main/explain_plan_no_indx.svg)

**Com Índice**
``` sql
EXPLAIN (FORMAT JSON) select * from fato_registro 
inner join dim_jnk_person_charac on fato_registro.dim_jnk_person_charac = dim_jnk_person_charac.dim_jnk_person_charac
inner join dim_jnk_locale on fato_registro.dim_jnk_locale_cod = dim_jnk_locale.dim_jnk_locale_cod
inner join dim_date on fato_registro.dim_date_cod = dim_date.dim_date_cod
inner join dim_jnk_caged on fato_registro.dim_jnk_caged_cod = dim_jnk_caged.dim_jnk_caged_cod
where dim_jnk_caged.horascontratuais = 40 
and dim_date."year" = 2019
and dim_jnk_locale.municipio LIKE 'Vitoria'
```
![Explain com indice](https://github.com/luizadealencar/BD2/blob/main/explain_plan_with_indx.svg)


| Tabela    |   01   |   02  |   03   |  04   | 05     | 06    | 07     | 08    | 09     | 10 | med |
|-----------|--------|-------|--------|-------|--------|-------|--------|-------|---------|--------|-----|
| Sem Índice | 405ms | 441ms | 406ms | 415ms | 468ms | 524ms | 412ms | 464ms | 484ms | 354ms | 437ms |
| Com Índice | 284ms | 282ms | 290ms | 238ms | 277ms | 294ms | 229ms | 232ms | 300ms | 289ms | 273,25ms |

##### 9.4.4 Consultas
``` sql
select * from fato_registro 
inner join dim_jnk_person_charac on fato_registro.dim_jnk_person_charac = dim_jnk_person_charac.dim_jnk_person_charac
inner join dim_jnk_locale on fato_registro.dim_jnk_locale_cod = dim_jnk_locale.dim_jnk_locale_cod
inner join dim_date on fato_registro.dim_date_cod = dim_date.dim_date_cod
inner join dim_jnk_caged on fato_registro.dim_jnk_caged_cod = dim_jnk_caged.dim_jnk_caged_cod
where dim_jnk_caged.horascontratuais = 40 
and dim_date."year" = 2019
and dim_jnk_locale.municipio LIKE 'Vitoria'
```

``` sql
select * from fato_registro 
inner join dim_jnk_person_charac on fato_registro.dim_jnk_person_charac = dim_jnk_person_charac.dim_jnk_person_charac
inner join dim_jnk_locale on fato_registro.dim_jnk_locale_cod = dim_jnk_locale.dim_jnk_locale_cod
inner join dim_date on fato_registro.dim_date_cod = dim_date.dim_date_cod
inner join dim_jnk_caged on fato_registro.dim_jnk_caged_cod = dim_jnk_caged.dim_jnk_caged_cod
where dim_jnk_person_charac.desc_raca LIKE 'Preta'
and fato_registro.saldo = 1
```

``` sql
select * from fato_registro 
inner join dim_jnk_person_charac on fato_registro.dim_jnk_person_charac = dim_jnk_person_charac.dim_jnk_person_charac
inner join dim_jnk_locale on fato_registro.dim_jnk_locale_cod = dim_jnk_locale.dim_jnk_locale_cod
inner join dim_date on fato_registro.dim_date_cod = dim_date.dim_date_cod
inner join dim_jnk_caged on fato_registro.dim_jnk_caged_cod = dim_jnk_caged.dim_jnk_caged_cod
where dim_jnk_person_charac.desc_raca LIKE 'Preta'
and dim_jnk_person_charac.desc_instr LIKE 'Médio Completo'
```

### 10 BACKUP DO BANCO DE DADOS<br>
#### a) Tempo
![PG_DUMP_TIME](https://github.com/luizadealencar/BD2/blob/main/pg_dump_time)

#### b) Tamanho <br>
![PG_DUMP_SIZE](https://github.com/luizadealencar/BD2/blob/main/pg_dump_size.png)

#### c) Teste de restauração (backup) <br>
[DW_CAGED_DUMP](https://github.com/luizadealencar/BD2/blob/main/dw_caged_bkp.dump)

#### d) Tempo para restauração <br>
![PG_RESTORE_DUMP](https://github.com/luizadealencar/BD2/blob/main/pg_restore_dump.png)

#### e) Teste de restauração (script sql) <br>
[DW_CAGED_BKP_SQL](https://github.com/luizadealencar/BD2/blob/main/dw_caged_bkp.sql)

#### f) Tempo para restauração (script sql) <br>
![PG_RESTORE_COMMAND](https://github.com/luizadealencar/BD2/blob/main/pg_restore_sql_command.png) <br>
![PG_RESTORE_TIME](https://github.com/luizadealencar/BD2/blob/main/pg_restore_sql_time.png)

### 11 MINERAÇÃO DE DADOS
[Mineração de dados em PDF](https://github.com/luizadealencar/BD2/blob/43903ac14a7cb34e30956e4ee76e3d25f6fa22c8/Mineracao.pdf)
<br>
[Mineração de dados no COLAB](https://colab.research.google.com/drive/1XTvMnCrGsaCgdBGnddfvYCSZ7CV2bQ3_?usp=sharing#scrollTo=8jzyiFqG-jof)
<br>
[Mineração de dados em IPYNB](https://github.com/luizadealencar/BD2/blob/a67f2daa6ee8405a764a75861e69cac3fc3ff2b6/mineracao_caged.ipynb)

### 12 CRIAÇÃO DOS SLIDES E VÍDEO PARA APRESENTAÇAO FINAL <br>

Video: https://github.com/luizadealencar/BD2/blob/main/pechacutcha.mp4

Slides: https://docs.google.com/presentation/d/1_PMxMlyCcGCT4I-UMvkFruCmbVdRIVckV9efVVigRPM/edit?usp=sharing
