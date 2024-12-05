CREATE SCHEMA IF NOT EXISTS `empresaAvaliacao` DEFAULT CHARACTER SET utf8 ;
USE `empresaAvaliacao` ;

-- Table `empresaAvaliacao`.`transportadoras`

CREATE TABLE IF NOT EXISTS `empresaAvaliacao`.`transportadoras` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `numero_caminhoes` INT NOT NULL,
  `preco_medio_frete` FLOAT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

insert into transportadoras values 
  (0, 'TransJoi', '100', '150.80'),
  (0, 'Aceville', '50', '134.75'),
  (0, 'TransTusa', '37', '200.10'),
  (0, 'TransOliveira', '97', '148.98'),
  (0, 'Transao Transportes', '300', '160.00');
  
  update transportadoras set numero_caminhoes = '87' where id = 2;
  
  delete from transportadoras where id = 1;