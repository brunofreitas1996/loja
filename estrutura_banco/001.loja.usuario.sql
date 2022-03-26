-- 001_LOJA.USAURIO.SQL
create table loja.usuario (	
     usuario_id   integer
    ,nome         varchar2(50) not null
    ,email        varchar2(50) not null
    ,cpf          varchar2(20) unique not null
    ,senha        varchar2(20) not null
    ,tipo_usuario integer      default 0
    ,dt_insert    timestamp    default systimestamp, 
	 constraint usuario_pk primary key (usuario_id)
);
--
comment on column loja.usuario.usuario_id is 'indentificador da tabela.';
comment on column loja.usuario.nome is 'nome do usu�rio.';
comment on column loja.usuario.email is 'endere�o eletr�nico do usu�rio.';
comment on column loja.usuario.cpf is 'n�mero do cadastro �nico do usu�rio e username.';
comment on column loja.usuario.senha is 'senha de acesso a aplica��o.';
comment on column loja.usuario.tipo_usuario is '0 - usu�rio comum; 1 - propriet�rio.';
comment on column loja.usuario.dt_insert is 'data de inser��o do registro.';
--
create sequence loja.seq_usuario;
--
create or replace trigger loja.tgr_usuario  
   before insert on loja.usuario 
   for each row 
begin  
   if inserting then 
      if :new.usuario_id is null then 
         select loja.seq_usuario.nextval into :new.usuario_id from dual; 
      end if; 
   end if; 
end;
--
/
