function anagramList(list) {

    let map = {};
    let seen = {};
    let results = [];

    for (let i = 0; i < list.length; ++i) {

        let item = list[i];
        let sortedItem = item.slice().split('');

        sortedItem = sortedItem.sort();
        sortedItem.join('');

        if (seen[item])
            continue;
        else 
            seen[item] = true;

        if (map[sortedItem]) 
            map[sortedItem].push(item);
        else 
            map[sortedItem] = [item];
    }

    for (k in map) {
        results.push(map[k]);
    }
    return results;
}

const items = ['abc','bac','abc','def','fed','dfe','fed',''];
const result = anagramList(items);
console.log(result);
