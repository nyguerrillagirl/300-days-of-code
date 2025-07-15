def countdown(n):
    """Generator that counts down from n to 0."""
    while n >= 0:
        yield n
        n -= 1

for number in countdown(5):
    print(number)