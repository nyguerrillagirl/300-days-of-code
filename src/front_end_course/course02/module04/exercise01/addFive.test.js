const addFive = require('./addFive');

test('returns the number plus 5', () => {
    expect(addFive(5)).toBe(10);
    expect(addFive(0)).toBe(5);
    expect(addFive(-5)).toBe(0);
});