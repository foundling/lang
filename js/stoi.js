function stoi(s) {

    let x = 0;

    for (let i = 0; i < s.length; ++i) {
        if (48 <= s.charCodeAt(i) <= 57) 
            x = 10 * x + s.charCodeAt(i) - 48;  
        else
            break
    }

    return x;
}

module.exports = stoi;
