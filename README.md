# TrabalhoBD2


# TRABALHO 01 : Título do trabalho
Trabalho desenvolvido durante a disciplina de BD2
 
# Sumário

### 1	COMPONENTES<br>
David Marques<br>
Leonardo Sena<br>
Luiza de Alencar<br>

### 2	Escolha da base de dados e explicação sobre informações relacionadas <br>
CAGED <br>
Admissão e Dispensa dos Empregados do ES. <br>
A planilha mostra as admissões e demissões do estado do Espírito Santo, mostrando os cargos, as horas contratuais, o salário, se foi admitido ou demitido, e informações pessoais como idade, sexo, raça, se possui alguma deficiência, e de qual cidade é. Os anos contabilizados é de 2019 até agosto de 2020. <br>

### 3 Fast Immersion Canvas <br>
![alt text](https://github.com/luizadealencar/BD2/blob/main/Fast%20Immersion%20Canvas.png)


### 4 Fast Modelling Canvas
![alt text](https://github.com/luizadealencar/BD2/blob/803f37f47aa4bfafbe166f9ec55b6f01f6828d57/Fast%20Modelling%20Canvas.png)

### 5 Fast EDA e PPD Canvas
![alt text](https://github.com/luizadealencar/BD2/blob/6ed027ac96f27a5038311b448e8e390b3c300164/PPD.png)
[Collab familiarização com a base de dados](https://colab.research.google.com/drive/1-0cFi4NeX6exUe-B8O43pn5n6eMHtC5r?usp=sharing)

### 6 Mapa de ETL

- Redução da base de dados sob o critério de municípios, dividimos a base em dois arquivos: CAGED_GV, referente aos municípios da grande Vitória, e outro com os demais municípios, afim de agilizar o processamento dos dados. 
- Neste ETL foi realizado um trim de todos os campos de texto e setado os valores iguais a "" (string vazia) para null

![ETL_CAGED_GV](https://github.com/luizadealencar/BD2/blob/main/ETL_CAGED_GV.png)

     
### 7	MODELO CONCEITUAL, LOGICO E FISICO - OLTP<br>

![CONCEITUAL_OLTP](https://github.com/luizadealencar/BD2/blob/main/modelo_conceitual_oltp.jpg)

### 8	MODELO CONCEITUAL, LOGICO E FISICO - OLAP<br>

Modelo Lógico<br>
![LOGICO_OLAP](https://github.com/luizadealencar/BD2/blob/main/modelo_logico.png)

[Script modelo fisíco](https://github.com/luizadealencar/BD2/blob/main/modelo_fisico.sql)<br>

##   MARCO DE ENTREGA PARTE 01 (Até item 8)
 
### 9 CARGA DE DADOS,ANÁLISE DE METADADOS,ESTATISTICAS, SIZING E INDEXAÇÃO
#### 9.1	CARGA DE DADOS A ANÁLISE DOS RESULTADOS OBTIDOS
<br>
Realização de todo processo de ETL (Siga os passos solicitados, preferencialente nas ferramentas recomendadas)
OBS:Lembre que este processo é comumente custoso e complexo, não substime as dificuldades implícitas. 
<br>
<br>


#### 9.2	,ESTATISTICAS, SIZING<br>
<br>
Inclusão de análise das estatísticas e Sizing
<br>
<br>

#### 9.3	Cubos e Dashboards<br>
<br>
Inclusão de cubos e dashboards desenvolvidos
<br>
<br>


#### 9.4	APLICAÇAO DE ÍNDICES E TESTES DE PERFORMANCE<br>
    a) Lista de índices, tipos de índices com explicação de porque foram implementados nas consultas 
    b) Performance esperada VS Resultados obtidos
    c) Tabela de resultados comparando velocidades antes e depois da aplicação dos índices (constando velocidade esperada com planejamento, sem indice e com índice Vs velocidade de execucao real com índice e sem índice).
    d) Escolher as consultas mais complexas para serem analisadas (consultas com menos de 2 joins não serão aceitas)
    e) As imagens do Explain devem ser inclusas no trabalho, bem como explicações sobre os resultados obtidos.
    f) Inclusão de tabela mostrando as 10 execuções, excluindo-se o maior e menor tempos para cada consulta e 
    obtendo-se a media dos outros valores como resultado médio final.
<br>
#### 10 Backup do Banco de Dados<br>
        Detalhamento do backup.
        a) Tempo
        b) Tamanho
        c) Teste de restauração (backup)
        d) Tempo para restauração
        e) Teste de restauração (script sql)
        f) Tempo para restauração (script sql)
<br>

##   MARCO DE ENTREGA PARTE 02 (Até item 10)

### 11 MINERAÇÃO DE DADOS

a) Tópicos introdutórios
* Explicação/Fundamentação teórica sobre o método, objetivos e restrições! (formato doc/odt ou PDF)
* Onde/quando aplicar 
> ##### Estudar e explicar artigo que aplique o método de mineração de dados/machine learning escolhido
* exemplo de uso/aplicação 
> ##### Implementar algoritmo básico de exemplo obtido na literatura (enviar código executável junto do trabalho com detalhamento de explicação para uso passo a passo)
b) Aplicação de data mining/machine learning nos dados do trabalho 
* definir conjunto de dados relevante para o processo
* proposta deve ser aprovada pelo professor (deve ser enviada para avaliação até 72 hora antes da entrega da atividade)

Referência: http://scikit-learn.org/stable/index.html
<br>
Referências adicionais:
Scikit learning Map : http://scikit-learn.org/stable/tutorial/machine_learning_map/index.html
Machine learning in Python with scikit-learn: https://www.youtube.com/playlist?list=PL5-da3qGB5ICeMbQuqbbCOQWcS6OYBr5A






### 12 CRIAÇÃO DOS SLIDES E VÍDEO PARA APRESENTAÇAO FINAL <br>

#### a) Conclusão análises de data mining/dashboards e ajustes no trabalho (conforme ajustes solicitados pelo professor)
#### b) Criação de Slides para apresentação dos resultados provenientes do banco de dados OLAP desenvolvido (CANVAS + NOTEBOOKS E CONCLUSÕES)
#### c) Modelo Pecha Kucha(Apresentação com tempo de  6m40s) 
#### OBS: Esta é uma atividade de grande relevância no contexto do trabalho. Mantenha o foco nos principais resultados.


##   MARCO DE ENTREGA PARTE 03 (Até item 12)

### 13  FORMATACAO NO GIT: https://help.github.com/articles/basic-writing-and-formatting-syntax/
<comentario no git>
    
##### About Formatting
    https://help.github.com/articles/about-writing-and-formatting-on-github/
    
##### Basic Formatting in Git
    
    https://help.github.com/articles/basic-writing-and-formatting-syntax/#referencing-issues-and-pull-requests
    
    
##### Working with advanced formatting
    https://help.github.com/articles/working-with-advanced-formatting/
#### Mastering Markdown
    https://guides.github.com/features/mastering-markdown/

### OBSERVAÇÕES IMPORTANTES

#### Todos os arquivos que fazem parte do projeto (Imagens, pdfs, arquivos fonte, etc..), devem estar presentes no GIT. Os arquivos do projeto vigente não devem ser armazenados em quaisquer outras plataformas.
1. Caso existam arquivos com conteúdos sigilosos, comunicar o professor que definirá em conjunto com o grupo a melhor forma de armazenamento do arquivo.

#### Todos os grupos deverão fazer Fork deste repositório e dar permissões administrativas ao usuário deste GIT, para acompanhamento do trabalho.

#### Os usuários criados no GIT devem possuir o nome de identificação do aluno (não serão aceitos nomes como Eu123, meuprojeto, pro456, etc). Em caso de dúvida comunicar o professor.


Link para BrModelo:<br>
http://sis4.com/brModelo/brModelo/download.html
<br>


Link para curso de GIT<br>
![https://www.youtube.com/curso_git](https://www.youtube.com/playlist?list=PLo7sFyCeiGUdIyEmHdfbuD2eR4XPDqnN2?raw=true "Title")



