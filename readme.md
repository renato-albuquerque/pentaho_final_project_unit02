# Projeto Final Unidade 02 | PENTAHO (PDI) | Data Analytics | Digital College Brasil

Desenvolvimento de Projeto de Banco de Dados, entrega de uma solução de BI. Desde o `RESTORE do bd` até o `DASHBOARD`.<br>
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

### 3.2 Transformação (ktr) no Pentaho `(Cago.csv)` & Inserção dos dados no PostgreSQL (schema public, `tabela stg_cargo`):
![screenshot](/images/pentaho_stg_cargo.png) <br>
![screenshot](/images/postgresql_stg_cargo.png) <br>

### 3.3 Transformação (ktr) no Pentaho `(Departamento.csv)` & Inserção dos dados no PostgreSQL (schema public, `tabela stg_departamento`):
![screenshot](/images/pentaho_stg_departamento.png) <br>
![screenshot](/images/postgresql_stg_departamento.png) <br>

### 3.4 Transformação (ktr) no Pentaho `(Divisao.csv)` & Inserção dos dados no PostgreSQL (schema public, `tabela stg_divisao`):
![screenshot](/images/pentaho_stg_divisao.png) <br>
![screenshot](/images/postgresql_stg_divisao.png) <br>

### 3.5 Transformação (ktr) no Pentaho `(Funcionario.csv)` & Inserção dos dados no PostgreSQL (schema public, `tabela stg_funcionario`):
![screenshot](/images/pentaho_stg_funcionario.png) <br>
![screenshot](/images/postgresql_stg_funcionario.png) <br>

### 3.6 Transformação (ktr) no Pentaho `(Folha_de_Pagamento.csv)` & Inserção dos dados no PostgreSQL (schema public, `tabela stg_folha_pagamento`):
![screenshot](/images/pentaho_stg_folha_pagamento.png) <br>
![screenshot](/images/postgresql_stg_folha_pagamento.png) <br>

## 4. Restore do `BD DW`

## 5. Popular tabelas (dim_calendar, dim_departamento, dim_divisao, dim_funcionario, fat_folha_pagamento) no banco de dados `DW_SQL` utilizando PENTAHO

### 5.1 Conectar o Pentaho com o PostgreSQL (bd dw_sql).

### 5.2 Obs.: Tabela dim_calendar já preenchida no bd dw_sql. 

### 5.3 Transformação (ktr) no Pentaho `(tabela stg_divisao)` & Inserção dos dados no PostgreSQL (schema public, `tabela dim_divisao`):
![screenshot](/images/pentaho_dim_divisao.png) <br>
![screenshot](/images/postgresql_dim_divisao.png) <br>

### 5.4 Transformação (ktr) no Pentaho `(tabela stg_cargo)` & Inserção dos dados no PostgreSQL (schema public, `tabela dim_cargo`):
![screenshot](/images/pentaho_dim_cargo.png) <br>
![screenshot](/images/postgresql_dim_cargo.png) <br>