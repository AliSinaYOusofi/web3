pragma solidity ^0.8.17;

contract RemovingElements {
    
    enum ShippingStatus {
        one, // 0
        two, // 1
        three, // 2
        four // 3
    }

    ShippingStatus constant current = ShippingStatus.one;
    ShippingStatus public nums;

    function get() public view returns (ShippingStatus) {
        return nums;
    }

    function set(ShippingStatus _newStatus) public {
        nums = _newStatus;
    }

    function cancel () public {
        nums = ShippingStatus.one;
    }

    function reset() public {
        delete nums;
    }
}