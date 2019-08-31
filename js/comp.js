a = x => x*2
b = x => x+1
c = a => b => x => b(a(x))
d = (a,b) => x => b(a(x))

console.log( d(a,b)(1) )
