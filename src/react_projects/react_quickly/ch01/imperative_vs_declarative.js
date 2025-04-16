var getNestedValueImperatively = 
    function getNestedValueImperatively(object, propertyName) {
        var currentObject = object;
        var propertyNamesList = propertyName.split('.');
        var maxNestedLevel = propertyNamesList.length;
        var currentNestedLevel;
        for (currentNestedLevel = 0; currentNestedLevel < maxNestedLevel; currentNestedLevel++) {
            if (!currentObject || typeof currentObject === 'undefined') {
                return undefined
            }
            currentObject = currentObject[propertyNamesList[currentNestedLevel]];
        }
        return currentObject;
    };



var profile = {account: '47574416'};
var profileDeep = {account: {number: '47574416'}};

//console.log(getNestedValueImperatively(profile, 'account') === '47574416'); // 47574416

//console.log(getNestedValueImperatively(profileDeep, 'account.number') === '47574416'); // 47574416

// Doing things declaratively

var getValue = function getValue(object, propertyName) {
    return typeof object === 'undefined' ? undefined : object[propertyName];
};

var getNestedValueDeclaratively = 
    function getNestedValueDeclaratively(object, propertyName) {
        return propertyName.split('.').reduce(function(currentObject, property) {
            return currentObject[property];
        }, object);
    };

//console.log(getNestedValueDeclaratively({bar: 'baz'}, 'bar') === 'baz')

console.log(getNestedValueDeclaratively({bar: { baz: 1 }}, 'bar.baz')=== 1)