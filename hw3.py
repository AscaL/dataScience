#!/usr/bin/python
import sys

over = False
letters = []
numberOfFiles = -1
files = []
for i in range(1, len(sys.argv)):
    if over == False:
        numberOfFiles += 1
    if over == True:
        letters.append(sys.argv[i])
    if sys.argv[i] == '-l':
        over = True


def countOccurrences(letter, text):
    return text.lower().count(letter.lower())


def histogramCounter(vector, text):
    c = 0
    histo = []
    for i in range(0, len(vector)):
        c += countOccurrences(vector[i], text)
    for j in range(0, len(vector)):
        if c == 0:
            histo.append(0.00)
        else:
            histo.append(round(countOccurrences(vector[j], text) / c, 2))
    return histo


def distance(v1, v2):
    dist = sum([(x - y)**2 for (x, y) in zip(v1, v2)])**(0.5)
    return dist


def textDistance():
    sol = ''
    for i in range(0, numberOfFiles):
        file = open(sys.argv[i + 1], 'r+')
        files.append(file.read())
    for j in range(0, len(files)):
        histo1 = histogramCounter(letters, files[j])
        for k in range(0, j + 1):
            histo2 = histogramCounter(letters, files[k])
            dist = round(distance(histo1, histo2), 2)
            if dist == 0.0:
                dist = '{0:.2f}'.format(float(dist))
            sol += str(dist) + ' '
        if j != len(files) - 1:
            sol += '\n'
    print(sol)


textDistance()
