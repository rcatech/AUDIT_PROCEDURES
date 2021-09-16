CREATE trigger AUDIT_PROCEDURE on database

for CREATE_PROCEDURE, ALTER_PROCEDURE, DROP_PROCEDURE

as

begin

set nocount on

/*
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
								RCA TECHNOLOGY
---------------------------------------------------------------------------
---------------------------------------------------------------------------

Autor: <Cassiolato, Rafael>
Data: 07/09/2020
Descrição:
	Essa trigger analisa todas as alterações em procedures (CREATE, ALTER, DROP) realizadas no banco de dados
		utilizada principalmente para auditar alterações realizadas nas transactions do SAP B1

---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------


Executar a criação da tabela abaixo, onde serão armazenadas as informações de log:

############################################################################
CREATE TABLE RCA_PROC_AUDIT
	(
		ID int identity, USUARIO nvarchar(255),
		HOST nvarchar(255),
		TIPO_EVT nvarchar (255), NOME_OBJ nvarchar(255),
		Server nvarchar (255),
		TIPO_OBJ nvarchar(255), Data datetime
	)
############################################################################

*/

Declare @data xml

set @data=Eventdata()

Insert into RCA_PROC_AUDIT values

(

@data.value('(/EVENT_INSTANCE/LoginName)[1]','nvarchar(255)'),

CAST(CONNECTIONPROPERTY('client_net_address') as nvarchar(254)),

@data.value('(/EVENT_INSTANCE/EventType)[1]','nvarchar(255)'),

@data.value('(/EVENT_INSTANCE/ObjectName)[1]','nvarchar(255)'),

@data.value('(/EVENT_INSTANCE/ServerName)[1]', 'nvarchar(255)'),

@data.value('(/EVENT_INSTANCE/ObjectType)[1]','nvarchar(255)'),

getdate()

)

set nocount off

end
