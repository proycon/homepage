+++
title = "Hanzigrid: Learning chinese characters"
date = 2020-01-04T19:38:28+01:00
draft = false

# Tags and categories
# For example, use `tags = []` for no tags, or the form `tags = ["A Tag", "Another Tag"]` for one or more tags.
tags = ["hanzi", "chinese"]
categories = []

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
[image]
  # Caption (optional)
  caption = ""

  # Focal point (optional)
  # Options: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight
  focal_point = ""

+++

大家好！

I've been trying to learn Mandarin Chinese for quite a while, following the
vocabulary compiled for the HSK (汉语水平考试) tests. As every Chinese learner
will surely know, memorising all the characters is quite a daunting task. I
often find myself mixing up similar looking characters (like 牛 and 午).

In order to learn these properly, I need to see them next to eachother,
following a more horizontal vocabulary learning strategy nicely described by
[Hacking
Chinese](https://www.hackingchinese.com/horizontal-vocabulary-learning/).

To facilitate my learning, I've compiled a list of hanzi I wish to study (based
on HSK mostly) and ordered them based on similarity, or my subjective notion of
it. Then I wrote a little [software tool](https://github.com/proycon/hanzigrid)
to generate what I call *hanzi grid*s. A hanzi grid is a study grid or matrix
of chinese characters along with (optionally) pinyin and/or words, often
coloured according to tone. The tool I wrote enables anyone to generate hanzi
grids in all kinds of sizes, also nice for printing on A1/A0 and hanging on
your wall as a poster!

The resulting hanzi grid using my confusible ordering looks as shown below. It
contains all of HSK 1 to 3 and some characters from higher levels:

![Hanzi Grid](https://proycon.anaproy.nl/pub/hanzigrid/hanzigrid.png)

The above is a just an example, you'll want to use [the scalable (SVG)
version](https://proycon.anaproy.nl/pub/hanzigrid/output/confusibleorder_a1_1.svg)
for printing. The character colours corresponds to the tones (red = first,
yellow = second/rising, green = third, blue = fourth/falling, black = neutral
or ambiguous), the background colours give an indication of the HSK level, so
you can skip the higher levels if you're not up to it yet.

I also made an [Interactive Clickable Variant (desktop version)](https://proycon.anaproy.nl/pub/hanzigrid/output/confusibleorder_a4.html), on mobile devices you will want to try the [Mobile Clickable Variant](https://proycon.anaproy.nl/pub/hanzigrid/output/confusibleorder_narrow.html) instead. In these versions you can click characters and get a list of all HSK words that use the character:
![Screenshot Interactive Hanzi Grid](https://proycon.anaproy.nl/pub/hanzigrid/hanzigrid_interactive.png)

If you're more interested in a conventional ordering by level or pinyin then that's possible too:

* [Example HSK 1 to 4 in pinyin order](https://proycon.anaproy.nl/pub/hanzigrid/output/hsk1to4_pinyinorder_a1_1.svg)
* [Example HSK 1 to 4 in level/frequency order](https://proycon.anaproy.nl/pub/hanzigrid/output/hsk1to4_a1_1.svg)

The tool allows you to include the pinyin in the grid itself, but I
deliberately did not make that the default, as the pinyin is something I need
to learn. Traditional characters instead of simplified is also possible.

For the software itself (free & open source), more grids, and a more detailed
explanation, see [hanzigrid on github](https://github.com/proycon/hanzigrid).

我希望这个《汉字格》对你有用！
Happy learning! :)













