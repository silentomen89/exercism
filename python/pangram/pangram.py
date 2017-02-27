# Solution to "Pangram" Python Exercise
# Written by David Andrews

import string

def is_alpha(character):
    try:
        return character.encode('ascii').isalpha()
    except:
        return False

def is_pangram(sentence):
    alpha_list = []

    for char1 in string.ascii_lowercase:
        alpha_list.append(char1)

    for char2 in sentence:
        if is_alpha(char2):
            try:
                alpha_list.remove(char2.lower())
            except ValueError:
                pass

    if len(alpha_list) == 0:
        return True

    return False
