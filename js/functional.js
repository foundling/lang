const R = require('ramda');


let names = ['Alex','Jan','Mike','Satya'];


console.log(

    R.compose(R.concat,R.reduce,R.reverse)(names),
    R.compose(x => x*2, x => x+1)(4)

);
