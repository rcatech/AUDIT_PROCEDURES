# AUDIT_PROCEDURES
Script SQL para auditar alterações em procedures realizadas no banco de dados


## Tutorial de instalação

Basta executar o script C_AUDIT.sql 
Ele irá criar a tabela RCA_PROC_AUDIT e irá criar a trigger em seu banco de dados.
O script deverá ser executado em todos os bancos de dados que se deseja auditar.


## Detalhes

A trigger irá salvar as informações:

* ID - Identificador único
* USUARIO - Usuario SQL que realizou a ação
* HOST - Endereço IP que executou a ação
* TIPO_EVT - Tipo de evento que chamou a trigger
* NOME_OBJ - Nome do objeto alterado
* Server - Servidor que executou a ação
* TIPO_OBJ - Tipo de objeto alterado
* Data - Data e hora que a ação foi executada


