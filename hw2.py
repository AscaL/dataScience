#!/usr/bin/python
asd = None
matrixArr = []
mat = []
n = 0
m = 0
while not asd:
    try:
        tmp = input()
        if tmp != '':
            tmp = tmp.strip()
            tmp = tmp.split(" ")
            rowlist = [int(x) for x in tmp]
            rowlist2 = [int(x) for x in tmp]
            mat.append(rowlist)
            matrixArr.append(rowlist2)
            if len(tmp) > 1:
                m = len(matrixArr[0])
                n += 1
    except EOFError:
        break


def countMatrix(matrix):
    for i in range(n):
        for j in range(m):
            x = 0
            for k in range(i + 1):
                for l in range(j + 1):
                    x += matrix[k][l]
                mat[i][j] = x
    # print(mat)
    flatString = [item for sublist in mat for item in sublist]
    finalString = ' '.join(map(str, flatString))
    superfinal = ''

    for i in range(n):
        superfinal = superfinal.strip()
        if i != 0:
            superfinal += '\n'
        for j in range(m):
            superfinal += str(mat[i][j]) + ' '
    superfinal = superfinal.strip()
    print(superfinal)


countMatrix(matrixArr)
