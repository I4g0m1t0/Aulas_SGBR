CREATE SCHEMA IF NOT EXISTS `Academia` DEFAULT CHARACTER SET utf8 ;
USE `Academia` ;

CREATE TABLE IF NOT EXISTS `Academia`.`Instrutor` (
  `id_instrutor` INT NOT NULL AUTO_INCREMENT,
  `cpf` varchar(13) not null,
  `nome` VARCHAR(45) NOT NULL,
  `nascimento` date not null,
  `titulacao` float NOT NULL,
  PRIMARY KEY (`id_instrutor`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Academia`.`Atividade` (
  `id_atividade` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_atividade`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Academia`.`Turma` (
  `id_turma` INT NOT NULL AUTO_INCREMENT,
  `horario` time not null,
  `duracao` time NOT NULL,
  `data_inicio` date not null,
  `data_fim` date not null,
  `id_atividade` int not null,
  `id_instrutor` int not null,
  PRIMARY KEY (`id_turma`),
  foreign key (id_atividade) references Atividade (id_atividade),
  foreign key (id_instrutor) references Instrutor (id_instrutor))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Academia`.`Aluno` (
  `id_aluno` INT NOT NULL AUTO_INCREMENT,
  `data_matricula` date not null,
  `nome` VARCHAR(45) NOT NULL,
  `data_natricula` date not null,
  `altura` float NOT NULL,
  `peso` FLOAT NOT NULL,
  `id_turma` int not null,
  PRIMARY KEY (`id_aluno`),
  foreign key (id_turma) references Turma (id_turma))
ENGINE = InnoDB;

create table if not exists `Academia`.`Matricula` (
  id_aluno int not null,
  id_turma int not null,
  primary key (id_aluno, id_turma),
  foreign key (id_aluno) references Aluno (id_aluno),
  foreign key (id_turma) references Turma (id_turma))
  engine = InnoDB;
  
  insert into Instrutor values 
  (0, '34567843521', 'Beto Alberto', '1988-04-03', 'Fisioterapeuta'),
  (0, '12356543222', 'Caio Levanto', '1988-06-06', 'Educação Física'),
  (0, '67278678736', 'Halterino Halteres', '1989-07-07', 'Educação Física');
  
ALTER TABLE Instrutor CHANGE COLUMN titulacao titulacao varchar (100);

update Instrutor set titulacao = 'Fisioterapeuta' where id_instrutor = 1;
update Instrutor set titulacao = 'Educação Física' where id_instrutor = 2;
update Instrutor set titulacao = 'Educação Física' where id_instrutor = 3;

insert into Atividade values 
  (0, 'Musculação'),
  (0, 'Pilates'),
  (0, 'Corrida');
  
insert into Turma values 
  (0, '14:00', '02:00', '2019-08-08', '2019-12-20', 2, 1),
  (0, '09:00', '01:00', '2019-09-09', '2020-01-01', 1, 2),
  (0, '10:30', '01:00', '2019-10-07', '2020-02-01', 3, 2);
  
insert into Aluno values 
  (0, '2019-07-01', 'Fulano da Silva', '1990-05-01', '1,76', '80', 3),
  (0, '2019-07-04', 'Joseph Climber', '1991-06-01', '1,65', '75', 2),
  (0, '2019-07-05', 'Allan Lee', '1992-07-07', '1,69', '68', 1);  

ALTER TABLE Aluno CHANGE COLUMN data_natricula data_nascimento date;

update Aluno set altura = '1.76' where id_aluno = 1;
update Aluno set altura = '1.65' where id_aluno = 2;
update Aluno set altura = '1.69' where id_aluno = 3;


insert into Matricula values 
  (1, 2),
  (2, 3),
  (3, 1);
  
  
  
  
  