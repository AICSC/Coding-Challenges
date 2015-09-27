#-----------------------------------------------------------------------
# Program name: Pig Latin Translator
# Author:       Pat Hawks
# Date:         9/21/2015
# Purpose:      Translate a line of text from the user into Pig Latin
#-----------------------------------------------------------------------

import re

def PigLatinify( word ):
    word = re.sub(r'\W+', r'', str(word))
    vowels = re.compile(r'[aeiouy]', re.IGNORECASE)
    consonants = re.compile(r'\A[^aeiouy]+', re.IGNORECASE)

    if word.istitle():
        titlecase = True
    else:
        titlecase = False

    if vowels.match(word):
        translatedWord = word.rstrip("y") + "yay"
    else:
        prefix = consonants.search(word)
        word = re.sub(r'\A[^aeiouy]+', r'', word)
        translatedWord = word + str(prefix.group(0)) + "ay"

    if titlecase:
        return translatedWord.title()
    else:
        return translatedWord.lower()

#-----------------------------------------------------------------------
# PROGRAM'S MAIN LOGIC

outputLine = ""
inputLine = input("Please enter a line of text:\n")

for word in inputLine.split():
    outputLine += PigLatinify(word) + " "

print(outputLine)

input("\nRun complete. Press the Enter key to exit.")
