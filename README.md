**EBACsql**

Kaggle: https://www.kaggle.com/code/cristinaamaral/sql-projeto-cristina-ebac

Exploração e análise de dados de transações com SQL.

Os dados: Os dados representam informações de clientes de uma editora com foco em educação academica e contam com as seguintes colunas:

- idade = idade do client
- sexo = sexo do cliente (F ou M)
- escolaridade = nível de escolaridade do clientes
- curso = área que o cliente está cursando ou que já se formou
- universidade = universidade onde está cursando ou onde concluiu o curso
- qtd_produtos = quantidade de produtos comprados nos últimos 12 meses
- tipo_produto = curso, livro ou e-book
- meses_inativo_12m = quantidade de meses que o cliente ficou inativo
- valor_transacoes_12m = valor das transações dos ultimos 12 meses
- A tabela foi criada no AWS Athena junto com o S3 Bucket com uma versão dos dados disponibilizados em:

https://projeto-cris-ebac.s3.sa-east-1.amazonaws.com/Projeto+Cris+EBAC+-+P%C3%A1gina1+(3).csv

Criação de tabela:

A primeira fase consiste em criar uma tabela de dados no Athena: CriacaoTabela.sql

- Para visualizarmos toda a tabela basta usar a Query:
SELECT * FROM "default"."transacoes" limit 20;

- Também podemos verificar apenas qual a quantidade de informações que temos na nossa tabela:
Query: SELECT count(*) FROM transacoes
Resultado no caso análisado: 20

- Podemos verificar quais são os tipos de escolaridade existentes no grupo de compradores
Query: SELECT DISTINCT escolaridade FROM transacoes

+ OU Podemos verificar as universidades em que estes clientes se formaram ou que estão cursando
Query: SELECT DISTINCT universidade FROM transacoes

- Nesse banco de dados, quantos clientes são homens e quantos são mulheres:
Query: select count(*), sexo from transacoes group by sexo
Desta forma, podemos concluir que a maioria dos clientes dessa editora são mulheres.

- Além disso, podemos verificar qual o curso que mais aparece entre os clientes que compram nesta editora:
Query: select count(*), curso from transacoes group by curso
Assim, podemos concluir que os cursos mais populares entre os clientes são medicina, seguido por direito e administração, que estão empatados com 3 clientes.

+ OU também, verificar qual universade mais aparece entre os clientes, para quem sabe, criar algum tipo de incentivo de desconto com as mais presentes e fiéis entre os alunos compradores da editora.
Query: select count(*), universidade from transacoes group by universidade
Podemos ver que os alunos que mais compram são da USP e do Mackenzie.

- Para verificar a idade destes clientes:
Query: select avg(idade) as media_idade, min(idade) as min_idade, max(idade) as max_idade, sexo from transacoes group by sexo
Assim, podemos concluir que a média de idade das clientes mulheres dessa editora é de aproximadamente 40 anos e dos clientes homens é de aproximadamente 37 anos.

- Algo interessante de se observar é a idade de acordo com o nível de escolaridade.
Query: select avg(idade) as idade, escolaridade from transacoes group by escolaridade
Podemos concluir que em média, os clientes mais jovens da editora possuem graduação e os mais velhos possuem doutorado.

- Outro ponto muito importante na hora das vendas é saber qual tipo de produto é o mais vendido entre os clientes.
Query: select count(*), tipo_produto from transacoes group by tipo_produto
Podemos observar que o campeão de vendas são os livros, seguido peos e-books e por fim, os cursos.


**Quais as características dos clientes que realizaram compras com os menores valores?**
Query: select max(valor_transacoes_12m) as valor_transacoes_12m, curso, universidade, sexo from transacoes where curso != 'na' and universidade != 'na' group by curso, universidade, sexo order by valor_transacoes_12m asc
Podemos concluir com essa pesquisa que até a 6º posição do raking a maior parte dos clientes com transações de pequeno valor são mulheres de universidades mais populares e com aparições repetidas dos cursos de marketing e contabilidade.

**Quem gasta mais em compras na editora? Homens ou mulheres?**
Query: select max(valor_transacoes_12m) as maior_valor_gasto, avg(valor_transacoes_12m) as media_valor_gasto, min(valor_transacoes_12m) as min_valor_gasto, sexo from transacoes group by sexo
Podemos concluir que as mulheres são o público que mais gasta em compras na editora.

**CONCLUSÕES**
- A maioria dos clientes da editora são mulheres.
- Os clientes que mais gastam em compras na editora são mulheres.
- O curso mais popular entre os clientes é o de medicina.
- A universidade mais presente entre os clientes é a USP.
- A média de idade das clientes mulheres é de aproximadamente 40 anos e dos clientes homens é de aproximadamente 37 anos.
- Os clientes mais jovens da editora possuem graduação e os mais velhos possuem doutorado.
- O produto campeão de vendas da editora são os livros.

