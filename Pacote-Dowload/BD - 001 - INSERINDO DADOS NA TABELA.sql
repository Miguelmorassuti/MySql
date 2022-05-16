insert into pessoas                                   #inser into vai inserir dados na coluna da tabela pessoas
(nome, nascimento, sexo, peso, altura, nacionalidade) #ID NÃO PRECISA SER INSERIDO POIS ELE VAI PREENCHER SOZINHO (AUTO_INCREMENT)
values                                                #values é para demonstrar os dados que serão inseridos
("AMABILLY", "2010-12-26", "F", "37", "1.55", "BRASIL"); #QUANDOS OS VALORES ESTÃO EXATAMENTE NA MSM ORDEM QUE AS COLUNAS DA TABELA N É
											#NECESSARIO LISTAR TODOS OS NOMES DO TIPO DE DADOS, É SO COLOCAR insert into pessoas values
											#E INSERIR OS DADOS QUE VC QUER INSERIR NA LINHA A BAIXO
select * from pessoas;                      #seleciona todos cadastros realizados