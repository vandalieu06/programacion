def sum_primes(number: int) -> int:
    sum_nums = 0
    if number < 1: return sum_nums

    for num in range(2, number):
        for i in range(2, int(num ** 0.5) + 1):
            if num % i != 0:
                sum_nums += num

    return sum_nums

print(sum_primes(20))