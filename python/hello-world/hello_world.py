# Solution for Hello World
# Written by David Andrews


def hello(name=''):
    if name is None or name == '':
        fullsent = "Hello, World!"
    else:
        fullsent = "Hello, " + name + "!"
    return fullsent
