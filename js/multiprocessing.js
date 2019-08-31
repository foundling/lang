const cluster = require('cluster')
const http = require('http')
const os = require('os')


const numCpus = os.cpus().length

if (cluster.isMaster) {
  for (let i = 0; i < numCpus; i++) {
    cluster.fork()
  }
  cluster.on('exit', (worker, code, signal) => {
    console.log(worker)
    console.log(code)
    console.log(signal)
  })
} else {

  http.createServer((req, res) => {
    res.writeHead(200)
    res.end(`${process.pid}`)
  }).listen(8000)


}

if (cluster.isMaster) {
  console.log(JSON.stringify(process.ppid, null, 2))
}


