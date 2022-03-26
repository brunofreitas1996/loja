-- 001_loja.grupo_produto.sql
create table loja.grupo_produto (	
     grupo_id   integer
    ,nome       varchar2(50) unique not null
    ,situacao   INTEGER default 0 not null
    ,dt_insert  timestamp    default systimestamp
    ,constraint grupo_produto_pk primary key (grupo_id)
);
--
comment on column loja.grupo_produto.grupo_id  is 'indentificador da tabela.';
comment on column loja.grupo_produto.nome      is 'nome do grupo.';
comment on column loja.grupo_produto.situacao  is '0 - Ativo, 1 - Inativo';
comment on column loja.grupo_produto.dt_insert is 'data de inser��o do registro.';
--
create sequence loja.seq_grupo_produto;
--
create or replace trigger loja.tgr_grupo_produto  
   before insert on loja.grupo_produto 
   for each row 
begin  
   if inserting then 
      if :new.grupo_id is null then 
         select loja.seq_grupo_produto.nextval into :new.grupo_id from dual; 
      end if; 
   end if; 
end;
--
/
