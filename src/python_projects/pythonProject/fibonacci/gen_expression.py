from collections.abc import Iterable
from collections.abc import Iterator

squares = ( x * x for x in range(10) )
print("Is squares an Iterable?", isinstance(squares, Iterable))
print("Is squares an Iterator?", isinstance(squares, Iterator))
print("Type of squares:", type(squares))

print(next(squares))
print(next(squares))