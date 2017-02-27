# Solution to "Hamming" Python Exercise
# Written by David Andrews

def distance(strand1, strand2):
    if len(strand1) != len(strand2):
        raise ValueError

    distance = 0

    for index, tide in enumerate(strand1):
        if strand1[index] != strand2[index]:
            distance += 1

    return distance
