# Queries TPC 2

### Default para toda as queries

```sparql
PREFIX : <http://www.semanticweb.org/miguel/ontologies/2020/1/musica#>
```
## 1 Nomes dos compositores (ordem alfabetica)

```sparql
SELECT ?nome WHERE { 
    ?id a :Obra;
         :compositor ?nome .
}
ORDER BY ?nome
```

## 2 Títulos das obras do tipo **"Marcha de Desfile"**

```sparql
SELECT ?titulo WHERE {u
    ?id a :Obra;
         :tipo "Marcha de Desfile";
         :titulo ?titulo .
}
```
u
## 3 Para cada Obra quantas partituras estão catalogadas

```sparql
SELECT ?titulo (COUNT(?partidura) as ?nPartiduras) WHERE { 
	?id a :Obra;
     	:titulo ?titulo;
     	:utiliza ?inst .
    ?inst :pertence ?partidura .
}
GROUP BY ?titulo
```

## 4 Quais os títulos das obras com partitura para **"Bombo"**

```sparql
SELECT ?titulo WHERE { 
	?id a :Obra;
     	:titulo ?titulo;
     	:utiliza ?inst .
    ?inst :pertence ?partidura;
          :designacao "Bombo" .
}
```

