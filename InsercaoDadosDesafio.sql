-- Inserção de dados;
use ecommerce;
show tables;

insert into cliente (Fname, Mname, Lname, CPF, Address) values
	('Maria','M','Silva',12346789,'rua silva de prata 29, Carangola - Cidade das flores'),
    ('Matheus','O','Pimentel',987654321,'rua alameda 289, Centro - Cidade das flores'),
    ('Ricardo','F','Silva',45678913,'avenida alameda vinha 1009, Centro - Cidade das flores'),
    ('Julia','S','França',789123456,'rua Laranjeiras 861, Centro - Cidade das flores'),
    ('Roberta','G','Assis',98745631,'avenida koller 19, Centro - Cidade das flores'),
    ('Isabela','M','Cruz',654789123,'rua alameda das flores 28, Centro - Cidade das flores');
    
insert into product (Pname, classification_kids, category, avaliacao, size) values
	('Fone de ouvido',false,'Eletrônico','4',null),
    ('Barbie elsa',true,'Brinquedos','3',null),
	('Body Carters',true,'Vestimenta','5',null),
    ('Microfone Vedo',false,'Eletrônico','4',null),
    ('Sofá retrátil',false,'Móveis','3','3x57x80'),
    ('Farinha trigo',false,'Alimentos','2',null),
    ('Fire Stick',false,'Eletrônico','3',null); 

insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) values
	(1, default, 'compra via aplicativo', null,1),
    (2, default, 'compra via aplicativo', 50,0),
    (3, 'Confirmado', null, null,1),
    (4, default, 'compra via web site', 150,0),
	(2, default, 'compra via aplicativo', 50,0),
	(2, default, 'compra via aplicativo', 50,0),
	(2, default, 'compra via aplicativo', 50,0),
	(4, default, 'compra via web site', 150,0),
	(4, default, 'compra via web site', 150,0);

insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus) values
	(1,1,2,null),
    (2,2,1,null),
    (3,3,1,null);

insert into products_storage (storageLocation, quantity) values
	('Rio de Janeiro', 1000),
    ('Rio de Janeiro', 500),
    ('São Paulo', 10),
    ('São Paulo', 100),
    ('São Paulo', 10),
    ('Brasília', 60); 
    
insert into storageLocation (idLproduct, idLstorage, location) values
	(1, 2, 'RJ'),
    (2, 6, 'GO');
    
insert into supplier (SocialName, CNPJ, contact) values
	('Almeida e filhos', 123456789123456, '21985474'),
    ('Eletrônicos Silva', 854519649143457, '21985484'),
    ('Eletrônicos Valma', 934567893934695, '21975474'),
    ('MarketPlace', 345345567567999, '21997899');

insert into productSupplier (idPsSupplier, idPsProduct, quantity) values
	(1,1,500),
    (1,2,400),
    (2,4,633),
    (3,3,5),
    (2,5,10),
	(3, 5, 250),
    (4, 4, 150),
    (2, 3, 250),
    (4, 5, 150);
    
insert into seller (SocialName, AbstName, CNPJ, CPF, location, contact) values
	('Tech eletronics', null, 123456789456321, null, 'Rio de Janeiro', 219946287),
    ('Botique Durgas', null, null, 123456783, 'Rio de Janeiro', 219567895),
	('Kids World', null, 456789123654485, null, 'São Paulo', 1198657484),
    ('MarketPlace', null, 345345567567999, null, 'Rio de Janeiro', '21997899');
    
insert into productSeller (idPseller, idProduct, prodQuantity) values
	(1,6,80),
    (2,7,10);



    