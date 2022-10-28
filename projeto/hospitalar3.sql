-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.24-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para rede_hospitalar
CREATE DATABASE IF NOT EXISTS `rede_hospitalar` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `rede_hospitalar`;

-- Copiando estrutura para tabela rede_hospitalar.anamnese
CREATE TABLE IF NOT EXISTS `anamnese` (
  `idAnamnese` int(11) NOT NULL AUTO_INCREMENT,
  `Paciente_idPaciente` int(11) NOT NULL,
  `DataPrimeiraDialise` date DEFAULT NULL,
  `TerminoEstimado` date DEFAULT NULL,
  `FatorRH` varchar(45) DEFAULT NULL,
  `DoencaCronica` varchar(45) DEFAULT NULL,
  `Remedios` varchar(45) DEFAULT NULL,
  `Alergia` varchar(45) DEFAULT NULL,
  `IMC` double DEFAULT NULL,
  `CondicoesEspecial` varchar(45) DEFAULT NULL,
  `Status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idAnamnese`),
  KEY `fk_Anamnese_Paciente1_idx` (`Paciente_idPaciente`),
  CONSTRAINT `fk_Anamnese_Paciente1` FOREIGN KEY (`Paciente_idPaciente`) REFERENCES `paciente` (`idPaciente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela rede_hospitalar.anamnese: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rede_hospitalar.aplica_medicamento
CREATE TABLE IF NOT EXISTS `aplica_medicamento` (
  `idAplica_Medicamento` int(11) NOT NULL AUTO_INCREMENT,
  `Pre_Dialise` int(11) DEFAULT NULL,
  `Durante_Dialise` int(11) DEFAULT NULL,
  `Pos_Dialise` int(11) DEFAULT NULL,
  PRIMARY KEY (`idAplica_Medicamento`),
  KEY `FK1_pre_med` (`Pre_Dialise`),
  KEY `FK2_durante_med` (`Durante_Dialise`),
  KEY `FK3_pos_med` (`Pos_Dialise`),
  CONSTRAINT `FK1_pre_med` FOREIGN KEY (`Pre_Dialise`) REFERENCES `medicamento` (`idMedicamento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK2_durante_med` FOREIGN KEY (`Durante_Dialise`) REFERENCES `medicamento` (`idMedicamento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK3_pos_med` FOREIGN KEY (`Pos_Dialise`) REFERENCES `medicamento` (`idMedicamento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela rede_hospitalar.aplica_medicamento: ~0 rows (aproximadamente)

-- Copiando estrutura para procedure rede_hospitalar.Cadastro_USER
DELIMITER //
CREATE PROCEDURE `Cadastro_USER`(UserN VARCHAR(32), SenhaN VARCHAR(32), PessoaN INT, cargoR INT)
root: BEGIN 
INSERT INTO login (UserName, Senha, Pessoa_IDPessoa, Cargo_idCargo) VALUES (UserN, SenhaN, PessoaN,cargoR);
END//
DELIMITER ;

-- Copiando estrutura para tabela rede_hospitalar.cargo
CREATE TABLE IF NOT EXISTS `cargo` (
  `idCargo` int(11) NOT NULL AUTO_INCREMENT,
  `Cargo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCargo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela rede_hospitalar.cargo: ~1 rows (aproximadamente)
INSERT IGNORE INTO `cargo` (`idCargo`, `Cargo`) VALUES
	(1, 'Root'),
	(2, 'Recepcionista'),
	(3, 'Médico'),
	(4, 'Enfermeiro'),
	(5, 'Técnico Enfermagem'),
	(6, 'Nutricionista'),
	(7, 'Psicólogo'),
	(8, 'Terapeuta Ocupacional'),
	(9, 'Fisioterapeuta'),
	(10, 'Assistente Social');

-- Copiando estrutura para tabela rede_hospitalar.clinica
CREATE TABLE IF NOT EXISTS `clinica` (
  `idClinica` int(11) NOT NULL AUTO_INCREMENT,
  `CNPj` bigint(20) NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Razao_Social` varchar(45) DEFAULT NULL,
  `IE` varchar(45) DEFAULT NULL,
  `Endereco_idEndereco` int(11) DEFAULT NULL,
  PRIMARY KEY (`idClinica`),
  KEY `fk_Clinica_Endereco1_idx` (`Endereco_idEndereco`),
  CONSTRAINT `fk_Clinica_Endereco1` FOREIGN KEY (`Endereco_idEndereco`) REFERENCES `endereco` (`idEndereco`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela rede_hospitalar.clinica: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rede_hospitalar.consulta
CREATE TABLE IF NOT EXISTS `consulta` (
  `idConsulta` int(11) NOT NULL AUTO_INCREMENT,
  `Clinica_idClinica` int(11) NOT NULL,
  `Paciente_idPaciente` int(11) NOT NULL,
  `DataConsulta` datetime NOT NULL,
  PRIMARY KEY (`idConsulta`),
  KEY `fk_Consulta_Clinica1_idx` (`Clinica_idClinica`),
  KEY `fk_Consulta_Paciente1_idx` (`Paciente_idPaciente`),
  CONSTRAINT `fk_Consulta_Clinica1` FOREIGN KEY (`Clinica_idClinica`) REFERENCES `clinica` (`idClinica`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Consulta_Paciente1` FOREIGN KEY (`Paciente_idPaciente`) REFERENCES `paciente` (`idPaciente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela rede_hospitalar.consulta: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rede_hospitalar.endereco
CREATE TABLE IF NOT EXISTS `endereco` (
  `idEndereco` int(11) NOT NULL AUTO_INCREMENT,
  `CEP` bigint(20) DEFAULT NULL,
  `Cidade` varchar(45) DEFAULT NULL,
  `Rua` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idEndereco`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela rede_hospitalar.endereco: ~1 rows (aproximadamente)
INSERT IGNORE INTO `endereco` (`idEndereco`, `CEP`, `Cidade`, `Rua`) VALUES
	(1, 0, NULL, NULL);

-- Copiando estrutura para tabela rede_hospitalar.especialidade
CREATE TABLE IF NOT EXISTS `especialidade` (
  `idEspecialidade` int(11) NOT NULL AUTO_INCREMENT,
  `Especialidade` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idEspecialidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela rede_hospitalar.especialidade: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rede_hospitalar.exame
CREATE TABLE IF NOT EXISTS `exame` (
  `idExame` int(11) NOT NULL AUTO_INCREMENT,
  `Paciente_idPaciente` int(11) NOT NULL,
  `DataPedido` date DEFAULT NULL,
  `DataResult` date DEFAULT NULL,
  `Tipo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idExame`),
  KEY `fk_Exame_Paciente1_idx` (`Paciente_idPaciente`),
  CONSTRAINT `fk_Exame_Paciente1` FOREIGN KEY (`Paciente_idPaciente`) REFERENCES `paciente` (`idPaciente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela rede_hospitalar.exame: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rede_hospitalar.funcionarios
CREATE TABLE IF NOT EXISTS `funcionarios` (
  `idFuncionarios` int(11) NOT NULL AUTO_INCREMENT,
  `Pessoa_IDPessoa` int(11) NOT NULL,
  `Hora_Entrada` time DEFAULT NULL,
  `Hora_Saida` time DEFAULT NULL,
  `Cargo_idCargo` int(11) NOT NULL,
  `Especialidade_idEspecialidade` int(11) NOT NULL,
  `Tipo_Certificado_idtipo_certificado` int(11) NOT NULL,
  `Codigo_Certificado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idFuncionarios`),
  KEY `fk_Funcionarios_Pessoa1_idx` (`Pessoa_IDPessoa`),
  KEY `fk_Funcionarios_Cargo1_idx` (`Cargo_idCargo`),
  KEY `fk_Funcionarios_Especialidade1_idx` (`Especialidade_idEspecialidade`),
  KEY `fk_Funcionarios_Tipo_Certificado1_idx` (`Tipo_Certificado_idtipo_certificado`),
  CONSTRAINT `fk_Funcionarios_Cargo1` FOREIGN KEY (`Cargo_idCargo`) REFERENCES `cargo` (`idCargo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Funcionarios_Especialidade1` FOREIGN KEY (`Especialidade_idEspecialidade`) REFERENCES `especialidade` (`idEspecialidade`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Funcionarios_Pessoa1` FOREIGN KEY (`Pessoa_IDPessoa`) REFERENCES `pessoa` (`IDPessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Funcionarios_Tipo_Certificado1` FOREIGN KEY (`Tipo_Certificado_idtipo_certificado`) REFERENCES `tipo_certificado` (`idtipo_certificado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela rede_hospitalar.funcionarios: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rede_hospitalar.login
CREATE TABLE IF NOT EXISTS `login` (
  `idLogin` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(45) NOT NULL,
  `Senha` varchar(45) NOT NULL,
  `Pessoa_IDPessoa` int(11) NOT NULL,
  `Cargo_idCargo` int(11) NOT NULL,
  PRIMARY KEY (`idLogin`),
  UNIQUE KEY `idLogin_UNIQUE` (`idLogin`),
  KEY `fk_Login_Pessoa1_idx` (`Pessoa_IDPessoa`),
  KEY `fk_Login_Cargo1_idx` (`Cargo_idCargo`),
  CONSTRAINT `fk_Login_Cargo1` FOREIGN KEY (`Cargo_idCargo`) REFERENCES `cargo` (`idCargo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Login_Pessoa1` FOREIGN KEY (`Pessoa_IDPessoa`) REFERENCES `pessoa` (`IDPessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela rede_hospitalar.login: ~1 rows (aproximadamente)
INSERT IGNORE INTO `login` (`idLogin`, `UserName`, `Senha`, `Pessoa_IDPessoa`, `Cargo_idCargo`) VALUES
	(1, 'root', 'root', 1, 1);

-- Copiando estrutura para tabela rede_hospitalar.medicamento
CREATE TABLE IF NOT EXISTS `medicamento` (
  `idMedicamento` int(11) NOT NULL AUTO_INCREMENT,
  `Nome_Medicamento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idMedicamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela rede_hospitalar.medicamento: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rede_hospitalar.paciente
CREATE TABLE IF NOT EXISTS `paciente` (
  `idPaciente` int(11) NOT NULL AUTO_INCREMENT,
  `Pessoa_IDPessoa` int(11) NOT NULL,
  `Responsavel_idResponsavel` int(11) NOT NULL,
  `CNS` varchar(45) DEFAULT NULL,
  `Etnia` varchar(45) DEFAULT NULL,
  `Profissao` varchar(45) DEFAULT NULL,
  `NumeroProntuario` bigint(20) DEFAULT NULL,
  `EstadoCivil` varchar(45) DEFAULT NULL,
  `Status` tinyint(4) DEFAULT NULL,
  `Motivo` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`idPaciente`),
  KEY `fk_Paciente_Pessoa1_idx` (`Pessoa_IDPessoa`),
  KEY `fk_Paciente_Responsavel1_idx` (`Responsavel_idResponsavel`),
  CONSTRAINT `fk_Paciente_Pessoa1` FOREIGN KEY (`Pessoa_IDPessoa`) REFERENCES `pessoa` (`IDPessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Paciente_Responsavel1` FOREIGN KEY (`Responsavel_idResponsavel`) REFERENCES `responsavel` (`idResponsavel`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela rede_hospitalar.paciente: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rede_hospitalar.pessoa
CREATE TABLE IF NOT EXISTS `pessoa` (
  `IDPessoa` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(64) NOT NULL,
  `Sobrenome` varchar(64) DEFAULT NULL,
  `CPF` bigint(20) NOT NULL,
  `RG` varchar(45) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `DataNascimento` date DEFAULT NULL,
  `Endereco_idEndereco` int(11) NOT NULL,
  PRIMARY KEY (`IDPessoa`),
  KEY `fk_Pessoa_Endereco_idx` (`Endereco_idEndereco`),
  CONSTRAINT `fk_Pessoa_Endereco` FOREIGN KEY (`Endereco_idEndereco`) REFERENCES `endereco` (`idEndereco`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela rede_hospitalar.pessoa: ~1 rows (aproximadamente)
INSERT IGNORE INTO `pessoa` (`IDPessoa`, `nome`, `Sobrenome`, `CPF`, `RG`, `email`, `DataNascimento`, `Endereco_idEndereco`) VALUES
	(1, 'Admin', NULL, 0, NULL, NULL, NULL, 1);

-- Copiando estrutura para procedure rede_hospitalar.Reconfig_Admin
DELIMITER //
CREATE PROCEDURE `Reconfig_Admin`(UserN VARCHAR(32), SenhaN VARCHAR(32) )
root: BEGIN 
UPDATE login SET login.UserName = UserN, login.Senha = SenhaN WHERE idLogin = 1;
END//
DELIMITER ;

-- Copiando estrutura para procedure rede_hospitalar.Registrar_Clinica
DELIMITER //
CREATE PROCEDURE `Registrar_Clinica`(
	IN `NOME` VARCHAR(32),
	IN `razao` VARCHAR(32),
	IN `CNPJ` BIGINT,
	IN `ie` VARCHAR(32),
	IN `Cep` BIGINT,
	IN `CIDADE` VARCHAR(32),
	IN `RUA` VARCHAR(32),
	IN `Tipo` VARCHAR(32),
	IN `TelN` BIGINT,
	IN `email` VARCHAR(32)
)
root: BEGIN
DECLARE e INT;
DECLARE ee INT;
DECLARE cl INT;

SET e = (SELECT COUNT(idEndereco) FROM endereco);
SET ee = e+1; 

SET cl = (SELECT idClinica FROM clinica WHERE Nome=NOME AND Endereco_idEndereco=idEndereco);

INSERT INTO endereco (idEndereco, CEP, Cidade, Rua) VALUES (ee, Cep, CIDADE, RUA);

INSERT INTO clinica (CNPj, Nome, Email, Razao_Social, IE, Endereco_idEndereco) 
VALUES (CNPJ, NOME, email, razao, ie, ee);

INSERT INTO telefone (idTelefone, Tipo_Telefone, Tel, Clinica_IDClinica) VALUES (T, Tipo, TelN, cl);
END//
DELIMITER ;

-- Copiando estrutura para tabela rede_hospitalar.responsavel
CREATE TABLE IF NOT EXISTS `responsavel` (
  `idResponsavel` int(11) NOT NULL AUTO_INCREMENT,
  `Pessoa_IDPessoa` int(11) NOT NULL,
  PRIMARY KEY (`idResponsavel`),
  KEY `fk_Responsavel_Pessoa1_idx` (`Pessoa_IDPessoa`),
  CONSTRAINT `fk_Responsavel_Pessoa1` FOREIGN KEY (`Pessoa_IDPessoa`) REFERENCES `pessoa` (`IDPessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela rede_hospitalar.responsavel: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rede_hospitalar.sessao
CREATE TABLE IF NOT EXISTS `sessao` (
  `idSessao` int(11) NOT NULL AUTO_INCREMENT,
  `Tratamento_idTratamento` int(11) NOT NULL,
  `Exame_idExame` int(11) NOT NULL,
  `Paciente_idPaciente` int(11) NOT NULL,
  `Pressao_Pre` varchar(45) DEFAULT NULL,
  `Pressao_Pos` varchar(45) DEFAULT NULL,
  `MedPerdaPeso` double DEFAULT NULL,
  `PesoSeco` double DEFAULT NULL,
  `Acesso` varchar(45) DEFAULT NULL,
  `Filtracao` varchar(45) DEFAULT NULL,
  `TesteCapilar` varchar(45) DEFAULT NULL,
  `intercorrencia` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`idSessao`),
  KEY `fk_Sessao_Tratamento1_idx` (`Tratamento_idTratamento`),
  KEY `fk_Sessao_Exame1_idx` (`Exame_idExame`),
  KEY `fk_Sessao_Paciente1_idx` (`Paciente_idPaciente`),
  CONSTRAINT `fk_Sessao_Exame1` FOREIGN KEY (`Exame_idExame`) REFERENCES `exame` (`idExame`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sessao_Paciente1` FOREIGN KEY (`Paciente_idPaciente`) REFERENCES `paciente` (`idPaciente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sessao_Tratamento1` FOREIGN KEY (`Tratamento_idTratamento`) REFERENCES `tratamento` (`idTratamento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela rede_hospitalar.sessao: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rede_hospitalar.telefone
CREATE TABLE IF NOT EXISTS `telefone` (
  `idTelefone` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo_Telefone` varchar(45) DEFAULT NULL,
  `Tel` bigint(20) DEFAULT NULL,
  `Pessoa_IDPessoa` int(11) DEFAULT NULL,
  `Clinica_IDClinica` int(11) DEFAULT NULL,
  PRIMARY KEY (`idTelefone`),
  KEY `fk_Telefone_Pessoa1_idx` (`Pessoa_IDPessoa`),
  KEY `fk_Telefone_Clinica1_idx` (`Clinica_IDClinica`),
  CONSTRAINT `fk_Telefone_Clinica1` FOREIGN KEY (`Clinica_IDClinica`) REFERENCES `clinica` (`idClinica`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Telefone_Pessoa1` FOREIGN KEY (`Pessoa_IDPessoa`) REFERENCES `pessoa` (`IDPessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela rede_hospitalar.telefone: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rede_hospitalar.tipo_certificado
CREATE TABLE IF NOT EXISTS `tipo_certificado` (
  `idtipo_certificado` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo_Certificacao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtipo_certificado`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela rede_hospitalar.tipo_certificado: ~0 rows (aproximadamente)
INSERT IGNORE INTO `tipo_certificado` (`idtipo_certificado`, `Tipo_Certificacao`) VALUES
	(1, 'CRM'),
	(2, 'COREN'),
	(3, 'CRN'),
	(4, 'CRP'),
	(5, 'CREFITO'),
	(6, 'CRESS'),
	(7, 'Registro Técnico especialista em nefrologia');

-- Copiando estrutura para tabela rede_hospitalar.tratamento
CREATE TABLE IF NOT EXISTS `tratamento` (
  `idTratamento` int(11) NOT NULL AUTO_INCREMENT,
  `Paciente_idPaciente` int(11) NOT NULL,
  `Exame_idExame` int(11) NOT NULL,
  `Medicamento_idMedicamento` int(11) NOT NULL,
  PRIMARY KEY (`idTratamento`),
  KEY `fk_Tratamento_Paciente1_idx` (`Paciente_idPaciente`),
  KEY `fk_Tratamento_Exame1_idx` (`Exame_idExame`),
  KEY `fk_Tratamento_Medicamento1_idx` (`Medicamento_idMedicamento`),
  CONSTRAINT `fk_Tratamento_Exame1` FOREIGN KEY (`Exame_idExame`) REFERENCES `exame` (`idExame`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tratamento_Medicamento1` FOREIGN KEY (`Medicamento_idMedicamento`) REFERENCES `aplica_medicamento` (`idAplica_Medicamento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tratamento_Paciente1` FOREIGN KEY (`Paciente_idPaciente`) REFERENCES `paciente` (`idPaciente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela rede_hospitalar.tratamento: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
