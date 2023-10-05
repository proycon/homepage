+++
title = "Todo.txt More"
date = 2022-12-31T00:04:34+01:00
description = "Extensions for todo.txt: interactive rofi/fzf control, sync github issues, better colors, time tracking... and more! "

[extra]
url_code = "https://git.sr.ht/~proycon/todotxt-more"
cover =  "/img/covers/todotxtmore.jpg"
+++

This is a set of complementary extensions for todo.txt . I wrote an extensive [/posts/todo/](blog post about it) which should give a good impression of what it can do.
The following extensions are implemented:

* `more` -  Main entry point, shortcut invoking various underlying plugins. By default displays a list with better sorting (`relsort`) and colour highlighting (`format`)
* `edit` - Invokes editor to edit todo.txt. 
* `show` - Show a single task based on item number
* `priup` - Priority up
* `pridown` - Priority down (down to C, depriotitised after)
* `rofi` - Control todo.txt interactively via rofi (a menu program)
* `fzf` - Control todo.txt interactively via fzf (a terminal based fuzzy finder)
* `issue` - View and sync issues (sync with Github)
* `timetrack` - Track time on projects and contexts, and produce summary reports 
* `notmuch` - Sync with notmuch mail based on tags like 'todo' and/or 'reply' 
* `cal` - Import iCalendar/vCalendar (ics) files
* `autoprio` - Automatically assign priorities (mostly based on due dates) 
 
The following are usually not called directly:

* `format` - Better coloured output, supports ANSI colours, pango, and html
* `relsort` -  Better sorting with relative dates
* `actionmenu` - The menu used in the fzf and rofi interfaces. 
