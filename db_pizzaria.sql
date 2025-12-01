USE db_pizzaria;

ALTER TABLE tb_clientes
MODIFY COLUMN telefone VARCHAR(50);

INSERT INTO tb_clientes (nome, endereco, telefone)
VALUES ("André Lima", "Rua Rubi, 300, Jd. Nicea. Itaqua", "(11)913101452");
INSERT INTO tb_clientes (nome, endereco, telefone)
VALUES ("Julia Mendes", "Rua Diamante, 255, Jd. Lupita, Mogi das Cruzes", "(11)980763465");
INSERT INTO tb_clientes (nome, endereco, telefone)
VALUES ("Lupita Neres", "R. Reinos, 20, Jd. Andrade, Poa", "(11)976806901");
INSERT INTO tb_clientes (nome, endereco, telefone)
VALUES ("Nayara Borges", "R. dos Titãs, 30, Sta Isabel", "(11)976509872");
INSERT INTO tb_clientes (nome, endereco, telefone)
VALUES ("Luan Rodrigues", "Rua Neo, 65, Jd. Nair, São Miguel", "(11)987647623");

SELECT * FROM tb_clientes;

INSERT INTO tb_entrega (endereco_entrega, status_entrega, nome_entregador)
VALUES ("Rua Rubi, 300, Jd. Nicea. Itaqua", "Pendente", "Miguel");
INSERT INTO tb_entrega (endereco_entrega, status_entrega, nome_entregador)
VALUES ("Rua Diamante, 255, Jd. Lupita, Mogi das Cruzes", "Entregue", "Gabriel");
INSERT INTO tb_entrega (endereco_entrega, status_entrega, nome_entregador)
VALUES ("R. Reinos, 20, Jd. Andrade, Poa", "Atrasada", "Juan");
INSERT INTO tb_entrega (endereco_entrega, status_entrega, nome_entregador)
VALUES ("R. dos Titãs, 30, Sta Isabel", "Entregue", "Breno");
INSERT INTO tb_entrega (endereco_entrega, status_entrega, nome_entregador)
VALUES ("Rua Neo, 65, Jd. Nair, São Miguel", "A caminho", "João");

SELECT * FROM tb_entrega;

INSERT INTO tb_produto (nome, descricao, preco, estoque, tempo_preparo)
VALUES ("Peperoni", "Mussarela e Peperoni", 75, 25, "00:30:00");
INSERT INTO tb_produto (nome, descricao, preco, estoque, tempo_preparo)
VALUES ("Calabresa", "Calabresa e cebola", 55, 40, "00:30:00");
INSERT INTO tb_produto (nome, descricao, preco, estoque, tempo_preparo)
VALUES ("Mussarela", "Mussarela e molho de tomate", 60.80, 40, "00:25:00");
INSERT INTO tb_produto (nome, descricao, preco, estoque, tempo_preparo)
VALUES ("Milho c Mussarela", "Milho e mussarela", 65.90, 40, "00:30:00");

SELECT * FROM tb_produto;

INSERT INTO tb_itempedido (quantidade, subtotal)
VALUES (1, 64.5);
INSERT INTO tb_itempedido (quantidade, subtotal)
VALUES (3, 154.20);
INSERT INTO tb_itempedido (quantidade, subtotal)
VALUES (2, 123.2);
INSERT INTO tb_itempedido (quantidade, subtotal)
VALUES (2, 82);
INSERT INTO tb_itempedido (quantidade, subtotal)
VALUES (4, 229);

INSERT INTO tb_itempedido (id_pedido, id_produto)  
VALUES (1, 2);

UPDATE tb_itempedido
SET id_pedido = 1,
    id_produto = 1
WHERE id_item = 1;

UPDATE tb_itempedido
SET id_pedido = 2,
    id_produto = 2
WHERE id_item = 2;

UPDATE tb_itempedido
SET id_pedido = 3,
    id_produto = 3
WHERE id_item = 3;

UPDATE tb_itempedido
SET id_pedido = 4,
    id_produto = 4
WHERE id_item = 4;

UPDATE tb_itempedido
SET id_pedido = 5,
    id_produto = 3
WHERE id_item = 5;

SELECT * FROM tb_itempedido;

INSERT INTO tb_pedido (data, forma_pagamento, status, id_cliente, id_entrega)
VALUES ("2025-09-30", "PIX", "PREPARANDO", 1, 1);
INSERT INTO tb_pedido (data, forma_pagamento, status, id_cliente, id_entrega)
VALUES ("2025-09-25", "DINHEIRO", "PRONTA", 2, 2);
INSERT INTO tb_pedido (data, forma_pagamento, status, id_cliente, id_entrega)
VALUES ("2025-11-30", "DEBITO", "PREPARANDO", 3, 3);
INSERT INTO tb_pedido (data, forma_pagamento, status, id_cliente, id_entrega)
VALUES ("2025-11-29", "CREDITO", "PRONTA", 4, 4);
INSERT INTO tb_pedido (data, forma_pagamento, status, id_cliente, id_entrega)
VALUES ("2025-11-28", "PIX", "PREPARANDO", 5, 5);

SELECT * FROM tb_pedido;

SELECT * FROM tb_itempedido WHERE subtotal > 100;

SELECT * FROM tb_pedido WHERE status LIKE "PRONTA";

SELECT 
    tb_itempedido.quantidade,
    tb_itempedido.subtotal,
    tb_pedido.forma_pagamento,
    tb_produto.nome AS nome_produto
FROM tb_itempedido
INNER JOIN tb_pedido 
    ON tb_itempedido.id_pedido = tb_pedido.id_pedido
INNER JOIN tb_produto 
    ON tb_itempedido.id_produto = tb_produto.id_produto;

UPDATE tb_produto
SET preco = 80
WHERE id_produto = 1;

UPDATE tb_clientes
SET endereco = "R. Canada, 123, Jd. Buenos Aires, Poa"
WHERE id_cliente = 3;

UPDATE tb_entrega
SET nome_entregador = "Antonio"
WHERE id_entrega = 2;

DELETE FROM tb_pedido
WHERE status = 'PREPARANDO'
LIMIT 1;

SELECT * FROM tb_pedido;


