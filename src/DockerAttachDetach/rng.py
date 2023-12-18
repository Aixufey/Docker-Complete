from random import randint

min_num = int(input("Enter the minimum number: "))
max_num = int(input("Enter the maximum number: "))

if (max_num < min_num):
    print('Invalid input')
else:
    rnd_num = randint(min_num, max_num)
    print(rnd_num)