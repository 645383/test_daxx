# test_daxx

1. `bundle install`
1. `pry`
2. `new_words = Words.new(6686787825, dictionary)`
Provide 10-digits number and dictionary. The last one is the istance var from `.pryrc`. Since no persistance layer, dictionary tree loaded and stored in memory once pry session started, so dictonary is the instance of tree.
3. `new_words.build`

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

6686787825 should return the following list [[&amp;quot;motor&amp;quot;,

&amp;quot;usual&amp;quot;], [&amp;quot;noun&amp;quot;, &amp;quot;struck&amp;quot;],

[&amp;quot;nouns&amp;quot;, &amp;quot;truck&amp;quot;], [&amp;quot;nouns&amp;quot;,

&amp;quot;usual&amp;quot;], [&amp;quot;onto&amp;quot;, &amp;quot;struck&amp;quot;],

&amp;quot;motortruck&amp;quot;]

No tests commited since code seems to be not valid due to above reasons. Probably task is not understood corectly.
Although ["oot", "ort", "suck"] corresponds to "Words have to be at least 3 characters."
