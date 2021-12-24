pragma solidity ^0.5.0;

contract Products {

    struct products {
        string manfacturer;
        string retailer;
        string pname;
        string owner; 
        uint pcode;
    }

    struct retailers {
        string rname;
        uint rcode;
    }

    struct manfacturers {
        string mname;
        uint mcode;
    }

    mapping( uint => products) public productsm;
    mapping (uint => manfacturers) manfacturersm;
    mapping (uint => retailers) retailersm;

    function new_product(string memory _manfacturer, uint _mcode, string memory _pname, uint _pcode) public {
        
        if( compareStrings( _manfacturer, manfacturersm[_mcode].mname)) {
            string memory _retailer;
            string memory _owner;
            productsm[_pcode].manfacturer= _manfacturer;
            productsm[_pcode].retailer=_retailer;
            productsm[_pcode].pname= _pname;
            productsm[_pcode].owner=_owner;
            productsm[_pcode].pcode=_pcode;
        }
    }

    function to_retailer(string memory _manfacturer, uint _mcode, string memory _retailer, uint _pcode) public {
        if( compareStrings( _manfacturer, manfacturersm[_mcode].mname))
            productsm[_pcode].retailer=_retailer;      
    }

    function product_sale( string memory _retailer, uint _rcode, string memory _customer, uint _pcode) public {
        if( compareStrings( _retailer, retailersm[_rcode].rname)) {
            productsm[_pcode].owner=_customer;
        }
    }

    function verify(string memory _name, uint _pcode) public view returns(bool) {
        if( compareStrings( _name, productsm[_pcode].owner))
        return true;
        return false;
    }

    function compareStrings(string memory a, string memory b) public view returns (bool) {
    return (keccak256(abi.encodePacked((a))) == keccak256(abi.encodePacked((b))));
    }

    function add_manfacturer(string memory _name, uint _code) public {
        manfacturersm[_code].mname=_name;
        manfacturersm[_code].mcode=_code;
    }

    function add_retailer(string memory _name, uint _code) public {
        retailersm[_code].rname=_name;
        retailersm[_code].rcode=_code;
    }
}