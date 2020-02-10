import csv

with open('alunos.csv', newline='') as csvfile:
    infile = csv.reader(csvfile, delimiter=',', quotechar="|")
    outfile = open('salaaula.ttl', 'a')
    counter = 0
    for row in infile:
        if (counter != 0):
            outfile.write('\n### http://www.semanticweb.org/miguel/ontologies/2020/1/aula1#'+row[0] + "\n" +
                          '<http://www.semanticweb.org/miguel/ontologies/2020/1/aula1#' +
                          row[0] + ">"
                          ' rdf:type owl:NamedIndividual ,'+"\n" +
                          '\t\t\t\t:Pessoa;'+"\n" +
                          '\t\t:frequenta :prc ;'+"\n" +
                          '\t\t:curso \"MEI\"^^xsd:string ;'+"\n" +
                          '\t\t:email \"' +
                          row[0] + '@alunos.uminho.pt\"^^xsd:string ;'+"\n" +
                          '\t\t:Ident \"' + row[0] + '\"^^xsd:string;'+"\n" +
                          '\t\t:nome \"' + row[1] + '\"^^xsd:string .\n\n'
                          )
        counter += 1
