const fs = require('fs')
const parseData = (err, data) => {

  if (err) throw err

  const [ headers, ...records ] = data.split('\n').filter(line => line.length)
  const columnNames = headers.split(',')

  console.log('parseData')
  return {
    people: records.map(record => 
      record.split(',')
        .reduce((person, columnValue, index) => {
          person[ columnNames[index] ] = columnValue.trim()
          return person
        }, {})
    )
  }

}

fs.readFile('./test.txt', 'utf-8', (e, data) => console.log(parseData(e, data)))
setTimeout(() => {
  console.log('set timeout')
}, 0)

setImmediate(() => {
  console.log('set immediate')
})

