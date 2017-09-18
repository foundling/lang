const fetch = require('node-fetch');

/*
fetch('http://jsonplaceholder.typicode.com/posts/1')
    .then(response => response.json())
    .then(console.log);
    */


function * get(url) {
    yield fetch(url).then(response => response.json());
}

fn = get('http://jsonplaceholder.typicode.com/posts/1');
val = fn.next()
val.value.then(console.log);
