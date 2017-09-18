const match = what => str => Boolean(str.match(what));
const hasSpaces = match(/\s+/g);
console.log( hasSpaces('ab cde') );
console.log( hasSpaces('abcde') );
