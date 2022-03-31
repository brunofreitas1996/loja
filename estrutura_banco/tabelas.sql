create table loja.pessoa ( 
  pessoa_id     integer
 ,endereco_id   integer  
 ,nome          varchar(100) not null
 ,cpf           varchar2(20) not null unique  
 ,dt_nascimento date not null  
 ,telefone      integer not null  
 ,email         varchar2(100)  
 ,dt_insert     timestamp default systimestamp 
);
alter table loja.pessoa add constraint pessoa_pk primary key (pessoa_id);
create sequence loja.seq_pessoa;

comment on column loja.pessoa.pessoa_id     is 'Identificador da tabela';
comment on column loja.pessoa.endereco_id   is 'Identificador da tabela loja.endereco';
comment on column loja.pessoa.nome          is 'Nome da pessoa';
comment on column loja.pessoa.cpf           is 'Número do cadasto único';
comment on column loja.pessoa.dt_nascimento is 'Data de nascimento';
comment on column loja.pessoa.telefone      is 'Número do telefone';
comment on column loja.pessoa.email         is 'Email';
comment on column loja.pessoa.dt_insert     is 'Data de inserçao do registro na tabela';


create table loja.endereco ( 
  endereco_id integer
 ,bairro_id   integer
 ,nr_imovel   varchar(30) not null  
 ,complemento varchar2(200) not null   
 ,dt_insert   timestamp default systimestamp 
);

alter table loja.endereco add constraint endereco_pk primary key (endereco_id);
create sequence loja.seq_endereco;

comment on column loja.endereco.endereco_id is 'identificador da tabela.';
comment on column loja.endereco.bairro_id   is 'Identificador da tabela loja.bairro';
comment on column loja.endereco.nr_imovel   is 'Número do local onde reside';
comment on column loja.endereco.complemento is 'Complemento do endereço';
comment on column loja.pessoa.dt_insert     is 'Data de inserçao do registro na tabela';

create table loja.bairro ( 
  bairro_id          integer  
 ,municipio_id       integer 
 ,tipo_logradouro_id integer
 ,cep                integer not null unique  
 ,logradouro         varchar(200) not null  
 ,bairro             varchar2(100) not null  
 ,dt_insert          timestamp default systimestamp
);

alter table loja.bairro add constraint bairro_pk primary key (bairro_id);
create sequence loja.seq_bairro;

comment on column loja.bairro.bairro_id          is 'Identificador da tabela';
comment on column loja.bairro.municipio_id       is 'Identificador da tabela loja.municipio';
comment on column loja.bairro.tipo_logradouro_id is 'Identificador da tabela loja.tipo_logradouro';
comment on column loja.bairro.cep                is 'CEP';
comment on column loja.bairro.logradouro         is 'Nome do logradouro';
comment on column loja.bairro.bairro             is 'Nome  do bairro';
comment on column loja.bairro.dt_insert          is 'Data de inserçao do registro na tabela';

create table loja.municipio ( 
  municipio_id integer
 ,nome         varchar(100) not null unique
 ,uf           char(2) not null
 ,dt_insert    timestamp default systimestamp
); 

alter table loja.municipio add constraint municipio_pk primary key (municipio_id);
create sequence loja.seq_municipio;

comment on column loja.municipio.municipio_id is 'Identificador da tabela';
comment on column loja.municipio.nome         is 'Nome';
comment on column loja.municipio.uf           is 'UF';
comment on column loja.municipio.dt_insert    is 'Data de inserçao do registro na tabela';

create table loja.produto ( 
  produto_id       integer 
 ,grupo_produto_id integer
 ,fabricante_id    integer 
 ,lote_id          integer 
 ,descricao        varchar2(500) not null  
 ,etiqueta         integer not null unique  
 ,valor            number(20,2) not null  
 ,dt_saida         timestamp 
 ,situacao         integer default 0 
 ,dt_insert        timestamp default systimestamp 
); 

alter table loja.produto add constraint produto_pk primary key (produto_id);
create sequence loja.seq_produto;

comment on column loja.produto.produto_id       is 'Identificador da tabela';
comment on column loja.produto.grupo_produto_id is 'Identificador da tabela loja.grupo_produto';
comment on column loja.produto.fabricante_id    is 'Identificador da tabela loja.fabricante';
comment on column loja.produto.lote_id          is 'Identificador da tabela loja.lote';
comment on column loja.produto.descricao        is 'Descrição do grupo';
comment on column loja.produto.etiqueta         is 'Etiqueta do produto';
comment on column loja.produto.valor            is 'Valor de venda do produto';
comment on column loja.produto.dt_saida         is 'Data em que o produto saiu do estoque, venda';
comment on column loja.produto.situacao         is '0 - Ativo, 1 - Inativo';
comment on column loja.produto.dt_insert        is 'Data de inserçao do registro na tabela';

create table loja.grupo_produto ( 
  grupo_produto_id integer
 ,descricao        varchar(500) not null unique  
 ,dt_insert        timestamp default systimestamp  
);

alter table loja.grupo_produto add constraint grupo_produto_pk primary key (grupo_produto_id);
create sequence loja.seq_grupo_produto;

comment on column loja.grupo_produto.grupo_produto_id is 'Identificador da tabela';
comment on column loja.grupo_produto.descricao        is 'Descrição';
comment on column loja.grupo_produto.dt_insert        is 'Data de inserçao do registro na tabela';


create table loja.fornecedor ( 
  fornecedor_id integer 
 ,endereco_id  integer  
 ,nome         varchar2(200) not null  
 ,cnpj         integer not null unique    
 ,situacao     integer default 0  
 ,dt_insert    timestamp default systimestamp  
); 

alter table loja.fornecedor add constraint fornecedor_pk primary key (fornecedor_id);
create sequence loja.seq_fornecedor;

comment on column loja.fornecedor.fornecedor_id is 'Identificador da tabela';
comment on column loja.fornecedor.endereco_id  is 'Identificador da tabela loja.endereco';
comment on column loja.fornecedor.nome         is 'Nome';
comment on column loja.fornecedor.cnpj         is 'CNPJ';
comment on column loja.fornecedor.situacao     is '0 - Ativo, 1 - Inativo';
comment on column loja.fornecedor.dt_insert    is 'Data de inserçao do registro na tabela';

create table loja.lote ( 
  lote_id       integer
 ,fornecedor_id integer
 ,dt_compra     date not null  
 ,vl_compra     float not null 
 ,dt_insert     timestamp default systimestamp 
);

alter table loja.lote add constraint lote_pk primary key (lote_id);
create sequence loja.seq_lote;

comment on column loja.lote.lote_id       is 'Identificador da tabela';
comment on column loja.lote.fornecedor_id is 'Identificador da tabela loja.fornecedor';
comment on column loja.lote.dt_compra     is 'Data de compra do lote';
comment on column loja.lote.vl_compra     is 'Valor total da compra';
comment on column loja.lote.dt_insert     is 'Data de inserçao do registro na tabela';

create table loja.tipo_logradouro ( 
  tipo_logradouro_id integer  
 ,descricao          varchar(20) not null unique
 ,dt_insert          timestamp default systimestamp 
); 

alter table loja.tipo_logradouro add constraint tipo_logradouro_pk primary key (tipo_logradouro_id);
create sequence loja.seq_tipo_logradouro;

comment on column loja.tipo_logradouro.tipo_logradouro_id is 'Identificador da tabela';
comment on column loja.tipo_logradouro.descricao          is 'Descrição';
comment on column loja.tipo_logradouro.dt_insert          is 'Data de inserçao do registro na tabela';

create table loja.usuario ( 
  usuario_id integer
 ,pessoa_id  integer  
 ,senha      varchar(30) not null
 ,situacao   integer default 0
 ,tp_usuario integer default 0
 ,dt_insert  timestamp default systimestamp  
);

alter table loja.usuario add constraint usuario_pk primary key (usuario_id);
create sequence loja.seq_usuario;

comment on column loja.usuario.usuario_id is 'Identificador da tabela';
comment on column loja.usuario.pessoa_id  is 'Identificador da tabela loja.pessoa';
comment on column loja.usuario.senha      is 'Senha de acesso';
comment on column loja.usuario.situacao   is '0 - Ativo, 1 - Inativo';
comment on column loja.usuario.tp_usuario is '0 - Vendedor, 1 - ADM';
comment on column loja.usuario.dt_insert  is 'Data de inserçao do registro na tabela';

create table loja.vendedor ( 
  vendedor_id integer
 ,pessoa_id   integer
 ,situacao    integer default 0
 ,dt_insert   timestamp default systimestamp
); 

alter table loja.vendedor add constraint vendedor_pk primary key (vendedor_id);
create sequence loja.seq_vendedor;

comment on column loja.vendedor.vendedor_id is 'Identificador da tabela';
comment on column loja.vendedor.pessoa_id   is 'Identificador da tabela loja.pessoa';
comment on column loja.vendedor.situacao    is '0 - Ativo, 1 - Inativo';
comment on column loja.vendedor.dt_insert   is 'Data de inserçao do registro na tabela';


create table loja.fabricante ( 
  fabricante_id integer
 ,nome          varchar(200) not null
 ,cnpj          varchar(20) not null unique
 ,dt_insert     timestamp default systimestamp 
); 

alter table loja.fabricante add constraint fabricante_pk primary key (fabricante_id);
create sequence loja.seq_fabricante;

comment on column loja.fabricante.fabricante_id is 'Identificador da tabela';
comment on column loja.fabricante.nome          is 'Nome';
comment on column loja.fabricante.cnpj          is 'CNPJ';
comment on column loja.fabricante.dt_insert     is 'Data de inserçao do registro na tabela';

create table loja.caixa ( 
  caixa_id       integer 
 ,vendedor_id    integer  
 ,valor_recebido number(20,2) not null
 ,desconto       number(20,2) not null
 ,valor_final    number(20,2) not null
 ,dt_insert      timestamp default systimestamp  
); 

alter table loja.caixa add constraint caixa_pk primary key (caixa_id);
create sequence loja.seq_caixa;

comment on column loja.caixa.caixa_id       is 'Identificador da tabela';
comment on column loja.caixa.vendedor_id    is 'Identificador da tabela loja.vendedor';
comment on column loja.caixa.valor_recebido is 'Valor recebido do cliente';
comment on column loja.caixa.desconto       is 'Valor do desconto, se houver';
comment on column loja.caixa.valor_final    is 'Valor total pago';
comment on column loja.caixa.dt_insert      is 'Data de inserçao do registro na tabela';

create table loja.caixa_saida ( 
  caixa_saida_id integer
 ,produto_id     integer
 ,caixa_id       integer
 ,dt_insert      timestamp default systimestamp 
); 

alter table loja.caixa_saida add constraint caixa_saida_pk primary key (caixa_saida_id);
create sequence loja.seq_caixa_saida;

comment on column loja.caixa_saida.caixa_saida_id is 'Identificador da tabela';
comment on column loja.caixa_saida.produto_id     is 'Identificador da tabela loja.produto';
comment on column loja.caixa_saida.caixa_id       is 'Identificador da tabela loja.caixa';
comment on column loja.caixa_saida.dt_insert      is 'Data de inserçao do registro na tabela';

ALTER TABLE loja.Pessoa      ADD FOREIGN KEY(endereco_id)        REFERENCES loja.Endereco (endereco_id);
ALTER TABLE loja.Endereco    ADD FOREIGN KEY(bairro_id)          REFERENCES loja.Bairro (bairro_id);
ALTER TABLE loja.Bairro      ADD FOREIGN KEY(municipio_id)       REFERENCES loja.Municipio (municipio_id);
ALTER TABLE loja.Bairro      ADD FOREIGN KEY(tipo_logradouro_id) REFERENCES loja.Tipo_logradouro (tipo_logradouro_id);
ALTER TABLE loja.Produto     ADD FOREIGN KEY(grupo_produto_id)   REFERENCES loja.Grupo_produto (grupo_produto_id);
ALTER TABLE loja.Produto     ADD FOREIGN KEY(lote_id)            REFERENCES loja.Lote (lote_id);
ALTER TABLE loja.Produto     ADD FOREIGN KEY(fabricante_id)      REFERENCES loja.Fabricante (fabricante_id);
ALTER TABLE loja.Fornecedor  ADD FOREIGN KEY(endereco_id)        REFERENCES loja.Endereco (endereco_id);
ALTER TABLE loja.Lote        ADD FOREIGN KEY(fornecedor_id)      REFERENCES loja.Fornecedor (fornecedor_id);
ALTER TABLE loja.Usuario     ADD FOREIGN KEY(pessoa_id)          REFERENCES loja.Pessoa (pessoa_id);
ALTER TABLE loja.Vendedor    ADD FOREIGN KEY(pessoa_id)          REFERENCES loja.Pessoa (pessoa_id);
ALTER TABLE loja.Caixa       ADD FOREIGN KEY(vendedor_id)        REFERENCES loja.Vendedor (vendedor_id);
ALTER TABLE loja.Caixa_saida ADD FOREIGN KEY(produto_id)         REFERENCES loja.Produto (produto_id);
ALTER TABLE loja.Caixa_saida ADD FOREIGN KEY(caixa_id)           REFERENCES loja.Caixa (caixa_id);

commit;
