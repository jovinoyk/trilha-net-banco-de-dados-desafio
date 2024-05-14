-- 1 - Buscar o nome e ano dos filmes

SELECT 
	Nome,
	Ano
FROM Filmes

-- -- 2 - Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano

SELECT
	Nome,
	Ano,
	Duracao
FROM Filmes
ORDER BY Ano

-- -- 3 - Buscar pelo filme de volta para o futuro, trazendo o nome, ano e a duração

SELECT
	Nome,
	Ano,
	Duracao
FROM Filmes
WHERE Nome = 'De Volta para o Futuro'

-- OR 

SELECT
	Nome,
	Ano,
	Duracao
FROM Filmes
WHERE Id = 28

-- -- 4 - Buscar os filmes lançados em 1997 

SELECT
	Nome,
	Ano,
	Duracao
FROM Filmes
WHERE Ano = 1997

-- -- 5 - Buscar os filmes lançados APÓS o ano 2000

SELECT
	Nome,
	Ano,
	Duracao
FROM Filmes
WHERE Ano > 2000

-- -- 6 - Buscar os filmes com a duracao maior que 100 e menor que 150, ordenando pela duracao em ordem crescente

SELECT
	Nome,
	Ano,
	Duracao
FROM Filmes
WHERE Duracao > 100 AND Duracao < 150
ORDER BY Duracao

-- -- 7 - Buscar a quantidade de filmes lançadas no ano, agrupando por ano, ordenando pela duracao em ordem decrescente

SELECT
	Ano,
	Count(*) Quantidade,
	SUM(Duracao) SomaDuracao -- Para vizualização do ordenamento
FROM Filmes
GROUP BY Ano
ORDER BY SUM(Duracao) DESC

-- OR ( Saida de acordo com imagem do enunciado, resultado difere do enunciado )

SELECT
	Ano,
	Count(*) Quantidade
FROM Filmes
GROUP BY Ano
ORDER BY Quantidade DESC

-- -- 8 - Buscar os Atores do gênero masculino, retornando o PrimeiroNome, UltimoNome

SELECT PrimeiroNome, UltimoNome
FROM Atores
WHERE Genero = 'M'

-- -- OR ( Feito de Acordo com a imagem, ao inves do enunciado)

SELECT PrimeiroNome, UltimoNome, Genero
FROM Atores
WHERE Genero = 'M'

-- -- 9 - Buscar os Atores do gênero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome

SELECT PrimeiroNome, UltimoNome
FROM Atores
WHERE Genero = 'F'
ORDER BY PrimeiroNome

-- -- OR ( Feito de acordo com a imagem do enunciado, ao inves do enunciado)

SELECT Id, PrimeiroNome, UltimoNome, Genero
FROM Atores
WHERE Genero = 'F'
ORDER BY PrimeiroNome

-- -- 10 - Buscar o nome do filme e o gênero

SELECT
	Filmes.Nome,
	Generos.Genero	
FROM Filmes
INNER JOIN FilmesGenero ON Filmes.Id = FilmesGenero.IdFilme
INNER JOIN Generos ON FilmesGenero.IdGenero = Generos.Id

-- -- 11 - Buscar o nome do filme e o gênero do tipo "Mistério"

SELECT
	F.Nome,
	G.Genero
FROM Filmes F
INNER JOIN FilmesGenero FG ON F.Id = FG.IdFilme
INNER JOIN Generos G ON G.Id = FG.IdGenero
WHERE G.Genero = 'Mistério'

-- -- 12 - Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel

SELECT
	Nome,
	Atores.PrimeiroNome,
	Atores.UltimoNome,
	ElencoFilme.Papel
FROM Filmes
INNER JOIN ElencoFilme ON ElencoFilme.IdFilme = Filmes.Id
INNER JOIN Atores ON Atores.Id = ElencoFilme.IdAtor



