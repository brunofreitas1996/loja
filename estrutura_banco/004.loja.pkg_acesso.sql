create or replace package loja.pkg_acesso is

function fnc_val_login(p_cpf          loja.usuario.cpf%type
                      ,p_senha        loja.usuario.senha%type)
return integer;

procedure prc_alt_senha(p_cpf          loja.usuario.cpf%type
                       ,p_nova_senha   loja.usuario.senha%type
                       ,p_result       out integer);

procedure prc_ins_usuario(p_nome         loja.usuario.nome%type
                         ,p_email        loja.usuario.email%type
                         ,p_cpf          loja.usuario.cpf%type
                         ,p_senha        loja.usuario.senha%type
                         ,p_tipo_usuario loja.usuario.tipo_usuario%type);

procedure prc_alt_usuario(p_usuario_id   loja.usuario.usuario_id%type
                         ,p_nome         loja.usuario.nome%type
                         ,p_email        loja.usuario.email%type
                         ,p_cpf          loja.usuario.cpf%type
                         ,p_senha        loja.usuario.senha%type
                         ,p_tipo_usuario loja.usuario.tipo_usuario%type);
                     
procedure prc_del_usuario(p_usuario_id   loja.usuario.usuario_id%type);
end;
/
create or replace package body loja.pkg_acesso is

function fnc_val_login(p_cpf          loja.usuario.cpf%type
                      ,p_senha        loja.usuario.senha%type)
return integer is
    v_cont integer := 0;
begin

    select count(1) 
      into v_cont
      from loja.usuario u
     where u.cpf = p_cpf;
     
     if v_cont <> 0 then
            select count(1) 
              into v_cont
              from loja.usuario u
             where u.cpf = p_cpf
               and u.senha = p_senha;
        if v_cont <> 0 then
            return 1;
        else
            return 0;
        end if;
    else
        return 9;
    end if;

end;

procedure prc_alt_senha(p_cpf          loja.usuario.cpf%type
                       ,p_nova_senha   loja.usuario.senha%type
                       ,p_result       out integer) is
begin
 p_result := 0;
end;

procedure prc_ins_usuario(p_nome         loja.usuario.nome%type
                         ,p_email        loja.usuario.email%type
                         ,p_cpf          loja.usuario.cpf%type
                         ,p_senha        loja.usuario.senha%type
                         ,p_tipo_usuario loja.usuario.tipo_usuario%type)is
begin
 return;
end;

procedure prc_alt_usuario(p_usuario_id   loja.usuario.usuario_id%type
                         ,p_nome         loja.usuario.nome%type
                         ,p_email        loja.usuario.email%type
                         ,p_cpf          loja.usuario.cpf%type
                         ,p_senha        loja.usuario.senha%type
                         ,p_tipo_usuario loja.usuario.tipo_usuario%type) is
begin
 return;
end;
                     
procedure prc_del_usuario(p_usuario_id   loja.usuario.usuario_id%type) is
begin
 return;
end;

end;
/