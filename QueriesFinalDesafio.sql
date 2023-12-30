-- Queries Desafio:
use ecommerce;

-- Quantos pedidos foram feitos por cada cliente? 
select concat(Fname,' ',Mname,' ',Lname) as cliente, count(idOrderClient) as qte_pedidos
	from cliente inner join orders
		on idOrderClient = idClient
			group by idOrderClient;

-- Algum vendedor também é fornecedor?
select seller.SocialName as Vendedores, supplier.SocialName as Fornecedores,
	case
		when seller.SocialName = supplier.SocialName then 'Sim'
			else 'Não'
				end as Vendedor_e_Fornecedor
					from seller inner join supplier
						on idSeller = idSupplier;
				
-- Relação de produtos, fornecedores e quantidade:
select a.SocialName as nome_fornecedor, pd.Pname as nome_produto, ps.quantity as quantidade_estoque
	from product pd inner join productsupplier ps
		on pd.idProduct = ps.idPsProduct
			inner join (select * from supplier s inner join productsupplier ps on ps.idPsSupplier = s.idSupplier) a
				on ps.idPsSupplier = a.idSupplier
					group by a.SocialName, pd.Pname, ps.quantity; 

-- Relação de nomes dos fornecedores e nomes dos produtos;
select s.SocialName as nome_fornecedor, pd.Pname as nome_produto
	from product pd inner join productsupplier ps
		on  pd.idProduct = ps.idPsProduct
			inner join supplier s on ps.idPsSupplier = s.idSupplier 
					group by s.SocialName, pd.Pname;