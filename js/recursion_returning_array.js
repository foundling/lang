let obj = {
    name: 'l1a',
    children: [
        {
            name: 'l2a',
            children: [
                { 
                    name: 'l3a',
                    children: [
                        {
                            name: 'l4a' 
                        }
                    ]
                },
                { 
                    name: 'l3b',
                    children: [
                        {
                            name: 'l4a' 
                        }
                    ]
                },
                { 
                    name: 'l3c',
                    children: []
                }
            ]
        },
        {
            name: 'l2b',
            children: [
                { 
                    name: 'l3a',
                    children: []
                },
                { 
                    name: 'l3b',
                    children: []
                },
                { 
                    name: 'l3c',
                    children: []
                }
            ]
        },
        {   
            name: 'l2c'
        }
    ]
};

function rec(tree, results) {
    results.push(tree.name);
    if (tree.children && tree.children.length)
        return tree.children.map(child => rec(child));
}

rec(obj, []);
console.log(results);
