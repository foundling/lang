function binarySearch(arr, target) {

    let li = 0;
    let ri = arr.length - 1; 
    let result = -1;
    let mid;

    while (li <= ri) {

        mid = Math.floor(li + (ri - li)/2); // calculate offset of li to reduce potential for integer overflow

        if (target === arr[mid]) {
            result = mid;
            break;
        } 
        else if (target < arr[mid])
            ri = mid - 1; 
        else 
            li = mid + 1;

    }

    return result;

}

const nums = [1,4,6,20,33,61,77]; 
console.log(binarySearch(nums, 61));
console.log(binarySearch(nums, 70));
