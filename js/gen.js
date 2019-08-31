const makeIterator = (start=0, end=Infinity, step=1) => {

  const rangeIterator = {
    next() {
      let rv
      if (start >= end) {
        rv = {
          done: true,
          value: null
        }
      } else {
        rv = {
          done: false,
          value: start
        }
      }
      start += 1
      return rv
    }
  }

  return rangeIterator

}

const it = makeIterator(0,10)
let value = it.next()
while (!value.done) {
  console.log(value)
  value = it.next()
}

function * makeGenerator(start=0,end=Infinity,step=1) {
  for (let i = start; i < end; i += step) {
    yield i
  }
}

const gen = makeGenerator()
console.log(gen.next())
console.log(gen.next())

const irange = (start=0, end=Infinity, step=1) => {

  return {
    *[Symbol.iterator]() {
      for (let i = start; i < end; i += step) {
        yield i
      }
    }
  }

}

for (let n of irange(1,10,2)) {
  console.log(n)
}
