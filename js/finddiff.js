// are elements within a given array unique to that array?

function findDifference(a,b) {

    let length = (a.length >= b.length) ? a.length : b.length;

    a.sort();
    b.sort();

    for(let i = 0; i < length; ++i) {
        if (a[i] !== b[i]) 
            return a[i] == null ? b[i] : a[i];
    } 
}

function f2(a,b) {

    let map = {};
    for (let i = 0; i < b.length; ++i) {
        map[ b[i] ] = true; 
    }

    for (let i = 0; i < a.length; ++i) {
        if (!map[a[i]])
            return a[i];
    }

}

function f3(a,b) {
    const sum = arr =>  arr.reduce((acc,x) => acc + x);
    let {a_sum, b_sum} = [a,b].map(sum);
    return a_sum - b_sum;
}

function f4(a,b) {

    let result = 0;

    // update difference incrementally
    for (let i = 0; i < b.length; ++i) {
        result += (a[i] - b[i]); 
    }  

    // add last element
    result += a[a.length - 1] 

    return result;
}

let x = [1];
let y = [];
let result2 = f4(x, y);
console.log(result2);
