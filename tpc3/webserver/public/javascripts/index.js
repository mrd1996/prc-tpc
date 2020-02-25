var prefixes = `PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
    PREFIX owl: <http://www.w3.org/2002/07/owl#>
    PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
    PREFIX noInferences: <http://www.ontotext.com/explicit>
    PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
`;

function query() {
  var repo = document.getElementById("rep").value;
  var url = `http://172.17.0.1:7200/repositories/${repo}?query=`;
  var query = document.getElementById("sparql").value;

  axios
    .get(`http://172.17.0.1:7200/repositories/${repo}/namespaces/.`)
    .then(prefix => {
      var p = prefixes.concat(`PREFIX : <${prefix.data}>`);
      var urlencoded = url + encodeURIComponent(p + query);
      var row = 0;

      axios
        .get(urlencoded)
        .then(({ data }) => console.log(data.results))
        .catch(error => console.log(error));
    })
    .catch(error => console.log(error));
}
