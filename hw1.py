#!/usr/bin/python3

import sys

# print("Number of arguments: ", len(sys.argv), 'arguments.')
# print('Argument List:', str(sys.argv))

# I can do it non recursive and put this in the function (using "while n > 1" and an avalanche of ifs),
# probably there is a way to have it recursive and this inside but i don't care atm.
crazy = ''


def crazySequence(n):
    global crazy
    if n == 1:
        crazy += (str(int(n)))
        print(crazy)
        # crazy.append(int(n))
        # THIS IS TOTALLY RANDOMLY USELESS, WHY NOT AN ARRAY???
        # x = " ".join(str(item) for item in crazy)
        # print(x)
        # print(" ".join(crazy))
        # return crazy
    elif n % 2 == 0:  # even
        crazy += str(int(n)) + " "
        # crazy.append(int(n))
        crazySequence(0.5 * n)
    else:
        crazy += (str(int(n))) + " "
        # crazy.append(int(n))
        crazySequence(3 * n + 1)


if len(sys.argv) > 1 and int(sys.argv[1]) <= 0:
    print("invalid value")
elif len(sys.argv) == 1:
    print("missing value")
else:
    crazySequence(int(sys.argv[1]))
