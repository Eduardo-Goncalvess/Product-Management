
# Table `TbCliente`
CREATE TABLE IF NOT EXISTS `TbCliente` (
  `idCliente` INT NOT NULL,
  `NmCliente` VARCHAR(100) NOT NULL,
  `senha` VARCHAR(40) NOT NULL,
  `email` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


# Table `TbEmpresa`

CREATE TABLE IF NOT EXISTS `TbEmpresa` (
  `idEmpresa` INT NOT NULL,
  `dtCriacao` DATE NOT NULL,
  `Telefone` CHAR(11) NOT NULL,
  `Cidade` VARCHAR(50) NOT NULL,
  `Bairro` VARCHAR(50) NOT NULL,
  `Rua` VARCHAR(50) NOT NULL,
  `Num` INT NOT NULL,
  PRIMARY KEY (`idEmpresa`),
  CONSTRAINT `fk_TbEmpresa_TbCliente`
    FOREIGN KEY (`idEmpresa`)
    REFERENCES `TbCliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



# Table `TbFornecedor`

CREATE TABLE IF NOT EXISTS `TbFornecedor` (
  `idFornecedor` INT NOT NULL,
  `NmFornecedor` VARCHAR(100) NOT NULL,
  `Email` VARCHAR(60) NOT NULL,
  `Telefone` CHAR(11) NOT NULL,
  PRIMARY KEY (`idFornecedor`))
ENGINE = InnoDB;



# Table `TbCategoria`

CREATE TABLE IF NOT EXISTS `TbCategoria` (
  `idCategoria` INT NOT NULL,
  `NmCategoria` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idCategoria`))
ENGINE = InnoDB;



# Table `tbProduto`

CREATE TABLE IF NOT EXISTS `tbProduto` (
  `idProduto` INT NOT NULL,
  `NmProduto` VARCHAR(100) NOT NULL,
  `Preco` DECIMAL(10,2) NOT NULL,
  `Status` VARCHAR(50) NOT NULL,
  `QuantBuscas` INT NOT NULL,
  `idEmpresa` INT NOT NULL,
  `idFornecedor` INT NOT NULL,
  `idCategoria` INT NOT NULL,
  PRIMARY KEY (`idProduto`),
  CONSTRAINT `fk_tbProduto_TbEmpresa1`
    FOREIGN KEY (`idEmpresa`)
    REFERENCES `TbEmpresa` (`idEmpresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbProduto_TbFornecedor1`
    FOREIGN KEY (`idFornecedor`)
    REFERENCES `TbFornecedor` (`idFornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbProduto_TbCategoria1`
    FOREIGN KEY (`idCategoria`)
    REFERENCES `TbCategoria` (`idCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



# Table `TbNotificacao`

CREATE TABLE IF NOT EXISTS `TbNotificacao` (
  `idNotificacao` INT NOT NULL,
  `Mensagem` VARCHAR(100) NOT NULL,
  `dtEnvio` DATE NOT NULL,
  `idProduto` INT NOT NULL,
  PRIMARY KEY (`idNotificacao`),
  CONSTRAINT `fk_TbNotificacao_tbProduto1`
    FOREIGN KEY (`idProduto`)
    REFERENCES `tbProduto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



# Table `TbClienteNotificacao`

CREATE TABLE IF NOT EXISTS `TbClienteNotificacao` (
  `idNotificacao` INT NOT NULL,
  `idCliente` INT NOT NULL,
  PRIMARY KEY (`idNotificacao`, `idCliente`),
  CONSTRAINT `fk_TbClienteNotificacao_TbNotificacao1`
    FOREIGN KEY (`idNotificacao`)
    REFERENCES `TbNotificacao` (`idNotificacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TbClienteNotificacao_TbCliente1`
    FOREIGN KEY (`idCliente`)
    REFERENCES `TbCliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



# Table `TbRelatorio`

CREATE TABLE IF NOT EXISTS `TbRelatorio` (
  `idRelatorio` INT NOT NULL,
  `dtGeracao` DATE NOT NULL,
  `Conteudo` MEDIUMTEXT NOT NULL,
  `idEmpresa` INT NOT NULL,
  PRIMARY KEY (`idRelatorio`),
  CONSTRAINT `fk_TbRelatorio_TbEmpresa1`
    FOREIGN KEY (`idEmpresa`)
    REFERENCES `TbEmpresa` (`idEmpresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



# Table `TbEmpresaCategoria`

CREATE TABLE IF NOT EXISTS `TbEmpresaCategoria` (
  `idCategoria` INT NOT NULL,
  `idEmpresa` INT NOT NULL,
  PRIMARY KEY (`idCategoria`, `idEmpresa`),
  CONSTRAINT `fk_TbEmpresaCategoria_TbCategoria1`
    FOREIGN KEY (`idCategoria`)
    REFERENCES `TbCategoria` (`idCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TbEmpresaCategoria_TbEmpresa1`
    FOREIGN KEY (`idEmpresa`)
    REFERENCES `TbEmpresa` (`idEmpresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



# Table `TbEmpresaFornecedor`

CREATE TABLE IF NOT EXISTS `TbEmpresaFornecedor` (
  `idFornecedor` INT NOT NULL,
  `idEmpresa` INT NOT NULL,
  PRIMARY KEY (`idFornecedor`, `idEmpresa`),
  CONSTRAINT `fk_TbEmpresaCategoria_TbFornecedor1`
    FOREIGN KEY (`idFornecedor`)
    REFERENCES `TbFornecedor` (`idFornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TbEmpresaCategoria_TbEmpresa2`
    FOREIGN KEY (`idEmpresa`)
    REFERENCES `TbEmpresa` (`idEmpresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



# Table `TbClienteProduto`

CREATE TABLE IF NOT EXISTS `TbClienteProduto` (
  `idProduto` INT NOT NULL,
  `idCliente` INT NOT NULL,
  PRIMARY KEY (`idProduto`, `idCliente`),
  CONSTRAINT `fk_TbClienteProduto_tbProduto1`
    FOREIGN KEY (`idProduto`)
    REFERENCES `tbProduto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TbClienteProduto_TbCliente1`
    FOREIGN KEY (`idCliente`)
    REFERENCES `TbCliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


#INSERTS
#1. TABELA TbCliente
INSERT INTO TbCliente (idCliente, NmCliente, senha, email) VALUES
(1, 'TechMaster Ltda', 'senha123', 'contato@techmaster.com'),
(2, 'ModaPlus SA', 'abc123', 'contato@modaplus.com'),
(3, 'Alimix Foods', 'pass321', 'contato@alimix.com'),
(4, 'BrinqueFácil Comércio', 'senha789', 'contato@brinquefacil.com'),
(5, 'FarmaHelp', 'senha555', 'farmahelp@email.com'),
(6, 'Carla Ribeiro', 'carla321', 'carla@email.com'),
(7, 'Diego Moraes', 'diegopass', 'diego@email.com'),
(8, 'Fernanda Alves', 'senha777', 'fer@email.com');

#2. TABELA TbEmpresa
INSERT INTO TbEmpresa (idEmpresa, dtCriacao, Telefone, Cidade, Bairro, Rua, Num) VALUES
(1, '2022-01-10', '11999999999', 'São Paulo', 'Centro', 'Rua A', 100),
(2, '2022-02-15', '11988888888', 'São Paulo', 'Bela Vista', 'Rua B', 200),
(3, '2022-03-20', '11977777777', 'Rio de Janeiro', 'Copacabana', 'Rua C', 300),
(4, '2022-04-25', '11966666666', 'Curitiba', 'Batel', 'Rua D', 400),
(5, '2022-01-11', '11955555555', 'Timóteo', 'Centro', 'Rua E', 130);


#3. TABELA TbFornecedor

INSERT INTO TbFornecedor (idFornecedor, NmFornecedor, Email, Telefone) VALUES
(1, 'Fornecedor Alpha', 'alpha@forn.com', '11911111111'),
(2, 'Fornecedor Beta', 'beta@forn.com', '11922222222'),
(3, 'Fornecedor Gama', 'gama@forn.com', '11933333333'),
(4, 'Fornecedor Delta', 'delta@forn.com', '11944444444');


#4. TABELA TbCategoria

INSERT INTO TbCategoria (idCategoria, NmCategoria) VALUES
(1, 'Eletrônicos'),
(2, 'Vestuário'),
(3, 'Alimentos'),
(4, 'Brinquedo');


# 5. TABELA tbProduto

INSERT INTO tbProduto (idProduto, NmProduto, Preco, Status, QuantBuscas, idEmpresa, idFornecedor, idCategoria) VALUES
(1, 'Notebook Gamer', '4500.00', 'Ativo', 18, 1, 1, 1),
(2, 'Carrinho Robô', '129.90', 'Ativo', 15, 2, 2, 4), 
(3, 'Camiseta Básica', '49.90', 'Ativo', 10, 3, 3, 2),  
(4, 'Chocolate Amargo', '9.50', 'Ativo', 22, 4, 4, 3), 
(5, 'Quebra-cabeça 500 peças', '39.90', 'Ativo', 17, 1, 3, 4),
(6, 'Mouse Sem Fio', '89.90', 'Ativo', 27, 2, 1, 1);  


# 6. TABELA TbNotificacao

INSERT INTO TbNotificacao (idNotificacao, Mensagem, dtEnvio, idProduto) VALUES
(1, 'Promoção especial!', '2024-01-10', 2),
(2, 'Produto em falta!', '2024-01-12', 3),
(3, 'Seu relatório está pronto.', '2024-01-15', 1),
(4, 'Atualização de sistema.', '2024-01-20', 4);


# 7. TABELA TbClienteNotificacao

INSERT INTO TbClienteNotificacao (idNotificacao, idCliente) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);


#  8. TABELA TbRelatorio

INSERT INTO TbRelatorio (idRelatorio, dtGeracao, Conteudo, idEmpresa) VALUES
(1, '2024-02-01', 'Relatório do mês de janeiro.', 1),
(2, '2024-02-05', 'Relatório financeiro.', 2),
(3, '2024-02-10', 'Relatório de vendas.', 3),
(4, '2024-02-12', 'Relatório de estoque.', 4);


#  9. TABELA TbEmpresaCategoria

INSERT INTO TbEmpresaCategoria (idCategoria, idEmpresa) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);


#  10. TABELA TbEmpresaFornecedor

INSERT INTO TbEmpresaFornecedor (idFornecedor, idEmpresa) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);


#  11. TABELA TbClienteProduto

INSERT INTO TbClienteProduto (idProduto, idCliente) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

# 5 SQLS

# (a1) Listar os produtos, sua categoria e fornecedor cuja categoria seja “Eletrônicos”, ordenando por preço.
SELECT P.NmProduto, P.Preco, C.NmCategoria, F.NmFornecedor
FROM tbProduto P, TbCategoria C, TbFornecedor F
WHERE P.idCategoria = C.idCategoria
  AND P.idFornecedor = F.idFornecedor
  AND C.NmCategoria = 'Eletrônicos'
ORDER BY P.Preco;

# (a2) Listar as empresas e os produtos cadastrados por elas, ordenando pelo nome do empresa.
SELECT Cl.NmCliente AS NmEmpresa, E.Cidade, P.NmProduto
FROM TbCliente Cl, TbEmpresa E, tbProduto P
WHERE Cl.idCliente = E.idEmpresa
  AND E.idEmpresa = P.idEmpresa
ORDER BY Cl.NmCliente;

# b)Listar todas as cidades das empresas (sem repetição).
SELECT DISTINCT Cidade
FROM TbEmpresa;

# c)Encontrar o maior preço de produto para categoria brinquedos.
SELECT P.nmProduto, max(P.Preco) AS maiorPreco
FROM tbProduto P, TbCategoria C
WHERE P.idCategoria = C.idCategoria
AND C.NmCategoria = 'Brinquedo';
  
  
# (d1)Quantidade de produtos por categoria.
SELECT C.NmCategoria AS nmCategoria, COUNT(P.idProduto) AS qtdProdutos
FROM TbCategoria C
JOIN tbProduto P ON C.idCategoria = P.idCategoria
GROUP BY C.NmCategoria;

# (d2)Quantidade de produtos de um fornecedor que possuem L no nome de sua categoria.
SELECT F.NmFornecedor, COUNT(P.idProduto) AS QtdProdutos
FROM TbFornecedor F inner join TbProduto P on F.idFornecedor = P.idFornecedor inner join tbcategoria C on P.idCategoria = C.idCategoria
WHERE C.NmCategoria like '%l%' 
GROUP BY F.NmFornecedor;

# e)Listar todas as empresas em que a soma do valor de seus produtos é maior que 100
SELECT C.nmCliente as NmEmpresa, sum(preco) as Total
FROM TbEmpresa E, TbProduto P, TbCliente C
WHERE C.idCliente = E.idEmpresa and E.idEmpresa = P.idEmpresa
GROUP BY E.idEmpresa
HAVING Total > 100;

# f)Listar todas as empresas e seus produtos (mesmo aquelas que não têm produtos).
SELECT C.nmCliente as NmEmpresa, E.Cidade, P.NmProduto
FROM TbEmpresa E LEFT JOIN tbProduto P ON P.idEmpresa = E.idEmpresa 
join TbCliente C on C.idCliente = E.idEmpresa;

# g)Listar todos os nomes de clientes e fornecedores em um único resultado.
SELECT NmCliente AS Nomes
FROM TbCliente
UNION
SELECT NmFornecedor AS Nomes
FROM TbFornecedor;

# h)Visão de produtos com categoria.
CREATE VIEW vwProdutosDetalhados AS
SELECT P.idProduto, P.NmProduto, P.Preco, C.NmCategoria
FROM tbProduto P JOIN TbCategoria C ON P.idCategoria = C.idCategoria;

# i)Listar empresas que não possuem nenhum produto cadastrado.
SELECT E.idEmpresa, C.nmCliente as NmEmpresa, E.Cidade, E.Rua
FROM TbEmpresa E, TbCliente C
WHERE C.idCliente = E.idEmpresa and E.idEmpresa NOT IN (SELECT P.idEmpresa FROM tbProduto P);