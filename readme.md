# Projeto Final Unidade 02 | PENTAHO (PDI) | Data Analytics | Digital College Brasil

Desenvolvimento de Projeto de Banco de Dados, entrega de uma solução de BI. <br>
Objetivo de construir um ambiente de análise de dados a partir de arquivos CSVs, utilizando técnicas de ETL para criar o DW. O Projeto visa desenvolver análises que servirão como base para tomadas de decisões estratégicas para o negócio. <br>
Área de negócio: RH. <br>
Tecnologias utilizadas: SQL / PostgreSQL / Pentaho / Microsoft Power BI.<br> 

Instituição: [Digital College Brasil](https://digitalcollege.com.br/) (Fortaleza/CE) <br>
Curso: Data Analytics (Turma 18) <br>
Instrutora: [Nayara Wakweski](https://github.com/NayaraWakewski) <br>

## Arquitetura do Projeto
![screenshot](/images/arquitetura_projeto.png) <br>

## 1. Criar BD no PostgreSQL

## 2. Restore do `BD STAGE`

## 3. Popular tabelas (cargo, departamento, divisao, folha_de_pagamento, funcionario) no banco de dados STAGE_SQL utilizando PENTAHO

### 3.1 Conectar o Pentaho com o PostgreSQL (bd stage_sql).

### 3.2 (CSV para STAGE) Transformação no Pentaho `(Cago.csv)` para `tabela stg_cargo` & Inserção dos dados no PostgreSQL (schema public, `tabela stg_cargo`):
![screenshot](/images/pentaho_stg_cargo.png) <br>
![screenshot](/images/postgresql_stg_cargo.png) <br>

### 3.3 (CSV para STAGE) Transformação no Pentaho `(Departamento.csv)` para `tabela stg_departamento` & Inserção dos dados no PostgreSQL (schema public, `tabela stg_departamento`):
![screenshot](/images/pentaho_stg_departamento.png) <br>
![screenshot](/images/postgresql_stg_departamento.png) <br>

### 3.4 (CSV para STAGE) Transformação no Pentaho `(Divisao.csv)` para `tabela stg_divisao` & Inserção dos dados no PostgreSQL (schema public, `tabela stg_divisao`):
![screenshot](/images/pentaho_stg_divisao.png) <br>
![screenshot](/images/postgresql_stg_divisao.png) <br>

### 3.5 (CSV para STAGE) Transformação no Pentaho `(Funcionario.csv)` para `tabela stg_funcionario` & Inserção dos dados no PostgreSQL (schema public, `tabela stg_funcionario`):
![screenshot](/images/pentaho_stg_funcionario.png) <br>
![screenshot](/images/postgresql_stg_funcionario.png) <br>

### 3.6 (CSV para STAGE) Transformação no Pentaho `(Folha_de_Pagamento.csv)` para `tabela stg_folha_pagamento` & Inserção dos dados no PostgreSQL (schema public, `tabela stg_folha_pagamento`):
![screenshot](/images/pentaho_stg_folha_pagamento.png) <br>
![screenshot](/images/postgresql_stg_folha_pagamento.png) <br>

## 4. Restore do `BD DW`

## 5. Popular tabelas (dim_calendar, dim_departamento, dim_divisao, dim_funcionario, fat_folha_pagamento) no banco de dados `DW_SQL` utilizando PENTAHO

### 5.1 Conectar o Pentaho com o PostgreSQL (bd dw_sql).

### 5.2 Obs.: Tabela dim_calendar já preenchida no bd dw_sql. 
![screenshot](/images/postgresql_dim_calendar.png) <br>

### 5.3 (STAGE para DW) Transformação no Pentaho `(tabela stg_divisao)` para `tabela dim_divisao` & Inserção dos dados no PostgreSQL (schema public, `tabela dim_divisao`):
![screenshot](/images/pentaho_dim_divisao.png) <br>
![screenshot](/images/postgresql_dim_divisao.png) <br>

### 5.4 (STAGE para DW) Transformação no Pentaho `(tabela stg_cargo)` para `tabela dim_cargo` & Inserção dos dados no PostgreSQL (schema public, `tabela dim_cargo`):
![screenshot](/images/pentaho_dim_cargo.png) <br>
![screenshot](/images/postgresql_dim_cargo.png) <br>

### 5.5 (STAGE para DW) Transformação no Pentaho `(tabela stg_departamento)` para `tabela dim_departamento` & Inserção dos dados no PostgreSQL (schema public, `tabela dim_departamento`):
![screenshot](/images/pentaho_dim_departamento.png) <br>
![screenshot](/images/postgresql_dim_departamento.png) <br>

### 5.6 (STAGE para DW) Transformação no Pentaho `(tabela stg_funcionario)` para `tabela dim_funcionario` & Inserção dos dados no PostgreSQL (schema public, `tabela dim_funcionario`):
![screenshot](/images/pentaho_dim_funcionario.png) <br>
![screenshot](/images/postgresql_dim_funcionario.png) <br>

### 5.7 (STAGE para DW) Transformação no Pentaho `(tabela stg_funcionario)` para `tabela dim_funcionario` & Inserção dos dados no PostgreSQL (schema public, `tabela dim_funcionario`):
![screenshot](/images/pentaho_fat_folha_pagamento.png) <br>
![screenshot](/images/postgresql_fat_folha_pagamento.png) <br>

### 5.8 (STAGE para DW) Transformação no Pentaho `(tabela stg_folha_pagamento)` para `tabela fat_folha_pagamento` & Inserção dos dados no PostgreSQL (schema public, `tabela fat_folha_pagamento`):
![screenshot](/images/pentaho_fat_folha_pagamento.png) <br>
![screenshot](/images/postgresql_fat_folha_pagamento.png) <br>

## 6. JOBS
(Em andamento)

## 7. Análises em SQL

### 7.1 TOTAL DE FUNCIONÁRIOS POR DEPARTAMENTO:
```
select dd.ds_dim_departamento as departamento, count(df.nk_dim_funcionario) as total_funcionario
from fat_folha_pagamento fat
inner join dim_departamento dd on fat.sk_dim_departamento = dd.sk_dim_departamento
inner join dim_funcionario df on fat.sk_dim_funcionario = df.sk_dim_funcionario
where nk_dim_funcionario <> 0
group by dd.ds_dim_departamento
order by total_funcionario desc;
```
![screenshot](/images/sql_func_depart.png) <br>
