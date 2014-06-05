Lingo-Tagger
============

A basic NSLinguisticTagger MacOS X App that tags a text and returns a JSON array of words and tags. 

Example
=======

Input:
```
How is the weather like in San Francisco?
```

Output:
```
[
  {
    "tag" : "Pronoun",
    "word" : "How"
  },
  {
    "tag" : "Verb",
    "word" : "is"
  },
  {
    "tag" : "Determiner",
    "word" : "the"
  },
  {
    "tag" : "Noun",
    "word" : "weather"
  },
  {
    "tag" : "Preposition",
    "word" : "like"
  },
  {
    "tag" : "Preposition",
    "word" : "in"
  },
  {
    "tag" : "PlaceName",
    "word" : "San Francisco"
  }
]
```
