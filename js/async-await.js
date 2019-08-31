const fetch = require('node-fetch')

async function fn() {
  let res = await fetch('https://google.com')
  return res
}

fn().then(res => console.log(res.body));
