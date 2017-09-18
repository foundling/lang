module.exports = exports = function memoize(fn) {

    const cache = {};

    return function() {
        const arg_string = JSON.stringify(arguments);
        cache[arg_string] = cache[arg_string] || fn.apply(fn, arguments);
        return cache[arg_string];
    };

};
