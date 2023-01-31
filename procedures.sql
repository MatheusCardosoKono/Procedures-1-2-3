create database infoC25

use infoc25

create table aluno(
	idaluno int primary key identity,
	nome varchar(100),
	nascimento date
)
create table disciplina(
	iddisciplina int primary key identity,
	disciplina varchar(100)
)
create table matricula(
	idmatricula int primary key identity,
	ano char(4),
	disciplina_iddisciplina int foreign key references disciplina,
	aluno_idaluno int foreign key references aluno,
	nota1 float,
	nota2 float,
	nota3 float,
	nota4 float,
	mensalidade float,
	turma varchar(50)
)


create procedure sp_inseriraluno @nome varchar(50),
	@nascimento date,@idaluno as 
begin
	insert into aluno(nome,nascimento) values(@nome,@nascimento,@idaluno)
end

execute sp_inseriraluno 'Rafael','2001-05-12'
execute sp_inseriraluno 'Jaco','2002-07-12'
execute sp_inseriraluno 'Small','2000-01-11'
execute sp_inseriraluno 'Pep','1998-05-02'
execute sp_inseriraluno 'Nathan','1999-07-06'


	create procedure sp_insertdisciplina1 @disciplina varchar(50) as 
	begin
		insert into disciplina values (@disciplina)
	end
	
		execute sp_insertdisciplina1 'logica'
		execute sp_insertdisciplina1 'portugues'
		execute sp_insertdisciplina1 'educação fisica'
		execute sp_insertdisciplina1 'matematica'
		execute sp_insertdisciplina1 'filosofia'
	
		create procedure sp_insertmatricula @ano char(4),@nota1 float,@nota2 float,@nota3 float,
		 @nota4 float,@mensalidade float,@turma varchar(50),@disciplina_iddisciplina int,@aluno_idaluno int as 
		begin
			insert into matricula values (@ano,@nota1,@nota2,@nota3,@nota4,@mensalidade,@turma,@disciplina_iddisciplina,@aluno_idaluno)
		end	
			execute sp_insertmatricula '2010',7.5,3.0,10.,7.0,768.00,'2C','5','5'
			execute sp_insertmatricula '2011',9.5,10.0,7.5,5.0,768.00,'3C','4','5'
			execute sp_insertmatricula '2013',3.0,5.0,7.0,8.0,1068.00,'1A','3','2'
			execute sp_insertmatricula '2009',5.0,6.0,8.0,10.0,1068.00,'3A','2','1'
			execute sp_insertmatricula '2010',7.0,8.0,9.0,0.5,1068.00,'2B','1','1'


--1 - A stored procedure que atualizará a disciplina receberá o nome novo da disciplina e o nome antigo, atualizando do antigo para o novo.
create procedure sp_atualizadisc
	@discinova varchar (50)
	@discipant varchar (100)
begin 
	update disciplina set disciplina=@discinova
	where disciplina=@discipant
	end
--2 - A stored procedure que atualizará o aluno receberá o nome do aluno e o nascimento e usará o id como comparação.
create procedure sp_ex2 @novnome varchar (50), @antnome varchar (50) , @novnasc date
as begin 
	if idaluno1 is null
	print 'o aluno não exisite'
	else
	update aluno set nome=@novnome,nascimento=@novnasc
	where nome=@antnome
	end
execute sp_xe2 'Pep','1998-05-02'
--3 - A stored procedure que atualizará a matrícula, receberá o nome do aluno, o nome da disciplina e todos os dados da tabela matrícula.
-- Selecionará o id do aluno dentro da procedure conforme o nome do mesmo e usará o id na atualização. 


