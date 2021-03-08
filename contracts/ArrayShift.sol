pragma solidity ^0.7;

contract ArrayShift {
    address[] arr;
    mapping(address => bool) inserted;
    // copy of arr for test
    address[] copy;

    function add(address x) public {
        require(!inserted[x], "inserted");

        arr.push(x);
        inserted[x] = true;
    }

    function remove(address x) public {
        require(inserted[x], "!inserted");

        // find index
        for (uint i = 0; i < arr.length; i++) {
            if (arr[i] == x) {
                // shift elements to the left by one
                for (uint j = i; j < arr.length - 1; j++) {
                    arr[j] = arr[j + 1];
                }
                arr.pop();
                inserted[x] = false;
                break;
            }
        }
    }

    // echidna test //
    /*
    echidna-test contracts/ArrayShift.sol --config config/assert.yaml
    */
    function test_remove(address x) public {
        require(inserted[x], "!inserted");

        // reset copy
        delete copy;

        uint len = arr.length;
        // copy elements except ith element
        for (uint i = 0; i < arr.length; i++) {
            if (arr[i] != x) {
                copy.push(arr[i]);
            }
        }

        remove(x);

        assert(arr.length == len - 1);
        for (uint i = 0; i < arr.length; i++) {
            assert(arr[i] == copy[i]);
        }
    }
}