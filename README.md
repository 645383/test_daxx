# test_daxx
Solution based on dictionary tree. First dicrionary is loaded into tree(just in memory). Building words from numbers based on recursive walk through the tree where each node contains `value` like `{'a' => 2}` and `fin` - boolean attributes. `value` contains number which letter is mapped to and `fin` indicates whether this is can be last letter in the word.

1. `bundle install`
2. `rake test`
- The complete solution includes unit tests that include two provided examples: 6686787825, 2282668687

```bash
# Running:

178690 lines read from test_daxx/test/../dictionary.txt
..

Finished in 5.515695s, 0.3626 runs/s, 48.4073 assertions/s.

2 runs, 267 assertions, 0 failures, 0 errors, 0 skips

```
3. `rake bench` to get simple benchmarks output
```bash
       user     system      total        real
6686787825:  0.020000   0.000000   0.020000 (  0.017814)
2282668687:  0.010000   0.000000   0.010000 (  0.015070)
2282668799:  0.020000   0.000000   0.020000 (  0.010728)
```

Try pry to test:
1. `pry`
1. `new_words = Words.new(6686787825, dictionary)`
Provide 10-digits number and dictionary. The last one is the istance var from `.pryrc`. Since no persistance layer, dictionary tree loaded and stored in memory once pry session started, so dictonary is the instance of tree.
1. `new_words.build`

```bash
=> [["mot", "opt", "puck"],
 ["mot", "opt", "ruck"],
 ["mot", "opt", "suck"],
 ["mot", "ort", "puck"],
 ["mot", "ort", "ruck"],
 ["mot", "ort", "suck"],
 "motortruck",
 ["motor", "truck"],
 ["motor", "usual"],
 ["not", "opt", "puck"],
 ["not", "opt", "ruck"],
 ["not", "opt", "suck"],
 ["not", "ort", "puck"],
 ["not", "ort", "ruck"],
 ["not", "ort", "suck"],
 ["nouns", "truck"],
 ["nouns", "usual"],
 ["noun", "pup", "taj"],
 ["noun", "pur", "taj"],
 ["noun", "pus", "taj"],
 ["noun", "struck"],
 ["noun", "sup", "taj"],
 ["noun", "suq", "taj"],
 ["onto", "pup", "taj"],
 ["onto", "pur", "taj"],
 ["onto", "pus", "taj"],
 ["onto", "struck"],
 ["onto", "sup", "taj"],
 ["onto", "suq", "taj"],
 ["oot", "opt", "puck"],
 ["oot", "opt", "ruck"],
 ["oot", "opt", "suck"],
 ["oot", "ort", "puck"],
 ["oot", "ort", "ruck"],
 ["oot", "ort", "suck"]]

```
which is different than verification provided:

6686787825 should return the following list 
```bash
[["motor", "usual"],
 ["noun", "struck"],
 ["nouns", "truck"],
 ["nouns","usual"],
 ["onto", "struck"],
 motortruck]
```

Code seems to be not valid due to above reasons. Probably task is not understood corectly.
Although ["oot", "ort", "suck"] corresponds to "Words have to be at least 3 characters."
