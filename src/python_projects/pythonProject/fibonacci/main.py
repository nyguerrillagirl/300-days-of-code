class Fibonacci:
    def __init__(self, max):
        self.max = max

    def __iter__(self):
        self.a, self.b = 0, 1
        return self

    def __next__(self):
        if self.a > self.max:
            raise StopIteration

        current = self.a
        self.a, self.b = self.b, self.a + self.b
        return current


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    fib = Fibonacci(10)
    for number in fib:
        print(number)

# See PyCharm help at https://www.jetbrains.com/help/pycharm/
