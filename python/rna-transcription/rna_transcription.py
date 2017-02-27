# Solution to "RNA Transcription" Python Exercise
# Written by David Andrews

def to_rna(strand):
    complement = ''

    for tide in strand:
        if tide == "A":
            complement += "U"
        elif tide == "C":
            complement += "G"
        elif tide == "G":
            complement += "C"
        elif tide == "T":
            complement += "A"
        else:
            return ''

    return complement
