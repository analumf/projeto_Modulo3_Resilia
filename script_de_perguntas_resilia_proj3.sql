-- PERGUNTAS EXTRAS

-- Adicionar uma coluna chamada dt_inicio na tabela turmas
alter table tb_turmas add dt_inicio date;

-- Selecionar as descrições tech e soft do curso de Data Analytics da Resilia
SELECT id_curso, descricao_tech, descricao_soft FROM tb_modulos
WHERE id_curso = 2;

-- Selecionar os nomes dos facilitadores e alunos, e as respectivas turmas que atuam. Com exceção da turma T3.
select fac.nome_fac, al.nome_aluno, tu.nome_turma from tb_facilitadores fac 
inner join tb_facilitador_turma factu on fac.matricula_facilitador = factu.matricula_facilitador
inner join tb_turmas tu on factu.id_turma = tu.id_turma inner join tb_alunos al
on al.id_turma = tu.id_turma and tu.nome_turma not in ('T3') group by fac.nome_fac, al.nome_aluno;

-- Selecionar os facilitadores que estão sem turmas cadastrado.
select fac.nome_fac, factu.id_turma from tb_facilitadores fac inner join tb_facilitador_turma factu 
on fac.matricula_facilitador = factu.matricula_facilitador and factu.id_turma is null;

-- selecionar o nome e email dos facilitadores e nome dos departamentos 
-- que tenham "Sucesso" ou "Marketing" no nome.
select fac.nome_fac, fac.email_fac, dep.nome_departamento from tb_facilitadores fac 
inner join tb_departamentos dep on fac.id_departamento = dep.id_departamento
and (dep.nome_departamento like '%Sucesso%' or dep.nome_departamento like '%Marketing%');

-- Atualizar o email da facilitadora tais para tais_soft@gmail.com e Tomaz para tmalbuquerque@protonmail.com
update tb_facilitadores set email_fac = 'tais_soft@gmail.com' where nome_fac like 'Ta_s';
select nome_fac, email_fac from tb_facilitadores where nome_fac like 'Ta_s';

--------------------------------------------------------------------------------------
-- PERGUNTAS COMO REQUISITO

-- Selecionar a quantidade total de estudantes cadastrados no banco;
select count(matricula_aluno) as total_alunos from tb_alunos;
 
-- Selecionar todos os estudantes com os respectivos cursos que eles estão cadastrados;
select nome_aluno, nome_curso from tb_alunos al inner join tb_turmas tu on al.id_turma = tu.id_turma 
inner join tb_cursos c on tu.id_curso = c.id_curso;

-- Selecionar quais pessoas facilitadoras atuam em mais de uma turma
select fac.* from tb_facilitadores fac inner join 
(select matricula_facilitador, count(id_turma) as total_turma from tb_facilitador_turma 
group by matricula_facilitador) tu
on fac.matricula_facilitador = tu.matricula_facilitador and total_turma > 1;
