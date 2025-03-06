# Function Recursion
from libtorrent import reason_t


def calculate_square_numbers(n):
    if n == 1: return 1
    return n * calculate_square_numbers(n - 1)

print(calculate_square_numbers(10))

# Bigger number
the_list = [
    143266561,
    1738152473,
    312377936,
    1027708881,
    1871655963,
    1495785517,
    1858250798,
    1693786723,
    374455497,
    430158267,
]
tmp = 0
for index, num in enumerate(the_list):
    if index == 0: tmp = num
    if num > tmp: tmp = num
print("Result is: ", tmp)

# Count word in paragraph
whetting_your_appetite = '''Python is an easy to learn, powerful programming language. 
                            It has efficient high level data structures and a simple but 
                            effective approach to object oriented programming. This tutorial 
                            introduces the reader informally to the basic concepts and 
                            features of the Python language and system. For a description 
                            of standard objects and modules...'''
result = whetting_your_appetite.split(" ") # Split sepeare witch spaces and save the word in array
print(len(result))

# Print a even numbers
def print_even_numbers(start, stop):
    for num in range(start, stop):
        if num % 2 == 0: print(num)

# Number 1000
print_even_numbers(0, 10)
num = 0
for i in range(1000):
    if num < 20:
        if i % 3 == 0 | i % 5 == 0: num += i * 78
    else:
        if i % 3 == 0 | i % 5 == 0: num += i

print(num)

# SHow aa, bb, ccc, ....
from string import ascii_lowercase
for letter1 in ascii_lowercase:
    for letter2 in ascii_lowercase:
        print(letter1 + letter2)

#Diffrence big number and lower number
def dist(points: list) -> float:
    max = 0
    min = 0
    for index, n in enumerate(points):
        if index == 0:
            max = n
            min = n
        if n > max: max = n
        if n < min: min = n
    return max - min

# Check number is prime ()
def is_prime(n):
    if n > 1:
        for i in range(2, int(n ** 0.5) + 1):
            if n % i == 0:
                return False
                break
        return True
    return False

# Rang
count = 0
for n in range(10000, 10050):
    re = 0

    for i in range(2, int(n ** 0.5) + 1):
        if n % i == 0:
            re = 1
            break
    if re == 1: continue

    if count == 0:
        print(f'{n}', end='')
        count = 1
    else:
        print(f', {n}', end='')
# Ranga
num = 100000000

while True:
    is_prime = True
    for i in range(2, int(num ** 0.5) + 1):
        if num % i == 0:
            is_prime = False
            break
    if is_prime:
        print(num)
        break

    num += 1
# rang find next prime than number passed in parameter
num = 100000000

while True:
    is_prime = True
    for i in range(2, int(num ** 0.5) + 1):
        if num % i == 0:
            is_prime = False
            break
    if is_prime:
        print(num)
        break

    num += 1
#
def from_roman_numeral(roman_numeral):
    value = 0
    letters = list(roman_numeral)
    list_roman = {'I': 1, 'V': 5, 'X': 10, 'L': 50, 'C': 100, 'D': 500, 'M': 1000}

    for i in range(len(letters)):
        if i < len(letters) - 1 and list_roman[letters[i]] < list_roman[letters[i + 1]]:
            value -= list_roman.get(letters[i])
        else:
            value += list_roman.get(letters[i])

    return value