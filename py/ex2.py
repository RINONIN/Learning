# 查询 n 到 m 间的所有素数
def find_prime_number(n, m):
    if isinstance(n, int) and isinstance(m, int):
        if m <= 1:
            return "error range"
        if 1 >= n > m:
            return "error start"
        numbers = list()
        num = n
        while num <= m:
            i = 2
            while i < num:
                if (num % i == 0) and (num != i):
                    break
                else:
                    i += 1
            if num == i:
                numbers.append(num)
            num += 1
        return numbers
    else:
        return "error input"
print(find_prime_number(1, 100))