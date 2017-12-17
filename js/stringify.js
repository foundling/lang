function stringify(o) {

    // string
    if (typeof o === 'string')
        return `"${o}"`;

    // number
    if (typeof o === 'number')
        return o.toString();

    // boolean
    if (typeof o === 'boolean')
        return o.toString();

    // array
    if (typeof o === 'object' && 'length' in o) {
        return stringifyArray(o);
    } 

    // object
    if (typeof o === 'object') {
        return stringifyObject(o);
    }

}

function stringifyObject(o) {

    const toAdd = [];

    for (prop in o) {
        if (o.hasOwnProperty(prop)) {

            const val = o[prop];

            if (typeof val === 'object') {

                // array
                if ('length' in val)
                    toAdd.push(`"${prop}":${ stringifyArray(val) }`);

                // object
                else 
                    toAdd.push(`"${prop}":${ stringifyObject(val) }`);

            } 

            // num
            else if (typeof val === 'number')
                toAdd.push(`"${prop}":${ val.toString() }`);

            // string
            else if (typeof val === 'string') 
                toAdd.push(`"${prop}":"${val}"`);

            // boolean
            else if (typeof val === 'boolean') 
                toAdd.push(`"${prop}":${ val.toString() }`);

        }
    }

    return `{${ toAdd.join(',') }}`;

}

function stringifyArray(arr) {

    const toAdd = [];

    for (let i = 0; i < arr.length; ++i) {

        const val = arr[i];
        const valType = typeof val; 

        if (valType === 'object') {
            if ('length' in val) 
                toAdd.push(stringifyArray(val));
            else
                toAdd.push(stringifyObject(val)); 
        }

        else if (valType === 'number')
            toAdd.push(val.toString());

        else if (valType === 'string')
            toAdd.push(`"${val.toString()}"`);

        else if (valType === 'boolean')
            toAdd.push(val.toString());

    }

    return `[${ toAdd.join(',') }]`;

}

console.log('number: ', JSON.stringify(12) === stringify(12));
console.log('string: ', JSON.stringify('abc') === stringify('abc'));
console.log('boolean: ', JSON.stringify(true) === stringify(true));
console.log('array: ', JSON.stringify([]) === stringify([]));
console.log('array2: ', JSON.stringify([1]) === stringify([1]));
console.log('array2: ', JSON.stringify([[]]) === stringify([[]]));
console.log('obj: ', JSON.stringify({data: {names: ['alex','ramsdell']}}) === stringify({data: {names: ['alex','ramsdell']}}));
