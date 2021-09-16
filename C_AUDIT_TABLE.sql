CREATE TABLE RCA_PROC_AUDIT
(
	ID int identity, USUARIO nvarchar(255),
	HOST nvarchar(255),
	TIPO_EVT nvarchar (255), NOME_OBJ nvarchar(255),
	Server nvarchar (255),
	TIPO_OBJ nvarchar(255), Data datetime
);
