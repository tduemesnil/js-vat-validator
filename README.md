# js-vat-validator

SQL Anywhere (node) implementation of John Gardner's VAT validator from http://www.braemoor.co.uk/software/vat.shtml

## Change the original jsvat.ts to TypeScript

Better Type Checking generates more consistant Code.

## countryA2 as first Parameter 

This is neccessary to be able to check Tax ID's that don't have the Country Code as Prefix. China Tax ID for ex. 
Avoid the use of the eval function based on user Input. 

## Result is JSON formatted

I need to know if the code is valid and would like to get additionaly a formatted version of the VAT No. back.
As Functions are easier to implement I converted the Result to a JSON Object.

## Test SQL Code

To be sure that everything works as it should i copeied also the Test Script an implement it in SQL.
