-- Criação do banco de dados para o cenário E-Commerce - DDL;
create database ecommerce;
use ecommerce;
show tables;

-- Criar tabela cliente;
CREATE TABLE cliente(
	idClient int auto_increment primary key,
    Fname varchar(15),
    Mname varchar(15),
    Lname varchar(15),
    CPF char(11) not null,
    Address varchar(100),
    constraint unique_cpf_client unique (CPF) 
);

-- Criar tabela produto;
CREATE TABLE product(
	idProduct int auto_increment primary key,
    Pname varchar(15) not null,
    classification_kids bool default false,
    category enum ('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis') not null,
    avaliacao float default 0,
    size varchar(10)
);

-- Criar tabela pedido;
CREATE TABLE orders(
	idOrder int auto_increment primary key,
    idOrderClient int,
    OrderStatus enum('Cancelado','Confirmado','Em processamento') default 'Em processamento',
    OrderDescription varchar(255),
    sendValue float default 10,
    paymentCash bool default false,
    constraint fk_order_client foreign key (idOrderClient) references cliente(idClient)
		on update cascade
);

-- Criar tabela pagamentos;
CREATE TABLE pagamentos(
	idClient int,
    id_payment int,
    client_order_id int,
    TypePayment enum('Dinheiro','boleto','Cartão de Crédito','Cartão de Débito','Pix'),
    limitAvailable float,
    primary key (idClient, id_payment), 
    constraint fk_payment_order foreign key (client_order_id) references orders(idOrder)
);

-- Criar tabela estoque;
CREATE TABLE products_storage(
	idProdStorage int auto_increment primary key,
    StorageLocation varchar (255),
    quantity int default 0
);

-- Criar tabela fornecedor;
CREATE TABLE supplier(
	idSupplier int auto_increment primary key,
    SocialName varchar(255) not null,
    CNPJ char(15) not null,
    contact char(11) not null,
    constraint unique_supplier unique (CNPJ)
);

-- Criar tabela vendedor;
CREATE TABLE seller(
	idSeller int auto_increment primary key,
    SocialName varchar(255) not null,
    AbstName varchar(255),
    CNPJ char(15),
    CPF char(11),
    location varchar(255),
    contact char(11) not null,
    constraint unique_cnpj_seller unique (CNPJ),
    constraint unique_cpf_seller unique (CPF)
);

-- Criar tabela vendedor específico do produto;
CREATE TABLE productSeller (
	idPseller int,
    idProduct int,
	prodQuantity int default 1,
    primary key (idPseller, idProduct),
    constraint fk_product_seller foreign key (idPseller) references seller (idSeller),
    constraint fk_product_product foreign key (idProduct) references product (idProduct)
);

-- Criar tabela produto expedido;
CREATE TABLE productOrder(
	idPOproduct int,
    idPOorder int,
    PoQuantity int default 1,
    PoStatus enum ('Disponível','Sem estoque') default 'Disponível',
    primary key (idPOproduct, idPOorder),
    constraint fk_productOrder_seller foreign key (idPOproduct) references product (idProduct),
    constraint fk_productOrder_product foreign key (idPOorder) references orders (idOrder) 
);	

-- Criar tabela local armazenado;
CREATE TABLE storageLocation(
	idLproduct int,
    idLstorage int,
    location varchar(255) not null,
    primary key (idLproduct, idLstorage),
    constraint fk_productStorage_seller foreign key (idLproduct) references product (idProduct),
    constraint fk_productStorage_product foreign key (idLstorage) references products_storage(idProdStorage)
);

-- Criar tabela fornecedor/produto;
CREATE TABLE productSupplier(
	idPsSupplier int,
    idPsProduct int,
    quantity int not null,
    primary key (idPsSupplier, idPsProduct),
    constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier(idSupplier),
    constraint fk_product_supplier_product foreign key (idPsProduct) references product(idProduct)
);
