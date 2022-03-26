--
CREATE TABLESPACE loja
LOGGING DATAFILE 'loja.dbf'
SIZE 100m AUTOEXTEND ON NEXT 100m EXTENT MANAGEMENT LOCAL;
--
commit;
alter session set "_ORACLE_SCRIPT"=true;
--
CREATE USER loja 
IDENTIFIED BY loja
DEFAULT TABLESPACE loja
QUOTA UNLIMITED ON loja;
--
commit;
--
GRANT
create session,
alter session,
create table,
create procedure,
create view,
create materialized view,
create trigger,
create sequence,
create any directory,
create type,
create synonym
TO
loja;
--
commit;
--
