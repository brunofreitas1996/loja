--001_loja.produto.sql
create table loja.produto (	
     produto_id  integer
    ,grupo_id    integer
    ,descricao   varchar2(100) not null
    ,cod_produto INTEGER       not null
    ,vl_prod     number(20,2)  not null
    ,dt_insert   timestamp     default systimestamp
    ,constraint  produto_pk primary key (produto_id)
    ,constraint  produto_uk unique (cod_produto)
);
--
comment on column loja.produto.produto_id  is 'indentificador da tabela.';
comment on column loja.produto.descricao   is 'Descrição do produto';
comment on column loja.produto.cod_produto is 'Código único do produto';
comment on column loja.produto.vl_prod     is 'Valor do produto';
comment on column loja.produto.dt_insert   is 'data de inserção do registro.';
--
create sequence loja.seq_produto;
--
create or replace trigger loja.tgr_produto  
   before insert on loja.produto 
   for each row 
begin  
   if inserting then 
      if :new.produto_id is null then 
         select loja.seq_produto.nextval into :new.produto_id from dual; 
      end if; 
   end if; 
end;
--
/
