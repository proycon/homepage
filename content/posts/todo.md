+++
title = "Todo.txt-more: Efficiently managing your todo list and your time"
date = 2022-12-30T21:55:28+01:00
description = "This post introduces todo.txt-more, a set of extensions I wrote for todo.txt-cli to improve my productivity"
+++

# Todo.txt More: Efficiently managing your todo list and your time

## Introduction

I tend to get fairly enthusiastic when it comes to lists, even more so when there's a chance to optimise my productivity, even though it's doubtful whether all the time spent on it really pays off. I've tried various ways of keeping todo lists over many years, some methods were more successful than others. Too often I found myself abandoning the lists I had because it introduced too much overhead (or I simply lacked the discipline to maintain them), or the lists themselves got too cluttered and I lost overview, or they were too detached from the places where I needed them.

Two things that did work well for me in recent years are the use of Github issues for software related tasks, and keeping track of todo tasks related to mails by tagging the mails (using [notmuch](https://notmuchmail.org). However, that is already two different systems, and they don't cover all possible todo tasks. Aside from Github I also use Sourcehut and Gitlab for software development, and at work they use Jira, so that would introduce even more systems to check. Especially these *context switches* have a negative impact on productivity. My aim is to minimize these.

What I want is one unified way to see and organise my todo tasks, regardless of where they're from. I also want to add tasks like simple household chores or hobby projects, with the main aim so I don't forget them. I want to be able to efficiently search through them so I can easy get tasks pertaining to a specific project, a specific employer, a specific priority, etc..

I'm now coming back to [todo.txt](http://todotxt.org/) to do all this. This is a simple minimalistic solution that's already been around since 2006. It keeps todo tasks in a simple plain text file and introduces some syntax for tagging, a command line shell script is provided for various basic operations. It requires no complicated database solutions, no complex software implementations, and it can just be used from your favourite text editor (vim in my case) even without any bells and whistles.

Todo.txt has a simple tag syntax, tags starting with ``+`` are *projects*, tags starting with ``@`` indicate *contexts*, and I add ``#`` for other kinds of tags (hashtags). Then there is a simple tag for priorties. With todo.txt I'm making use of priorities A, B and C only (and D as a special category). I use them as follows in a kind of kanban-style:

* *(A)* for tasks to do today
* *(B)* for tasks to do later this week
* *(C)* for tasks after this week (limited)
* *(D)* for tasks that are temporarily blocked/waiting on hold
* Then there's a whole *backlog* of tasks without a priority, these also act as a trove storing ideas I might or might not get to.

Priorities are adjusted as needed, corresponding to moving tasks between columns on a kanban board. I'm using three main *contexts* `@work` and `@hobby` and `@chore` to attempt to create a bit of a distinction between my work and private life.

## Todo.txt More

The ``todo.txt`` CLI implementation offers a nice way to extend it. I have done so to implement various extensions which I felt were missing. I call this [Todo.txt More](https://git.sr.ht/~proycon/todotxt-more). Go the its [Sourcehut page](https://git.sr.ht/~proycon/todotxt-more) to find the source code repository and installation instructions.

Todotxt More contains the following extensions to todo.txt-cli:

* `more` -  Main entry point, shortcut invoking various underlying plugins. By default displays a list with better sorting (`relsort`) and colour highlighting (`format`)
* `edit` - Invokes editor to edit todo.txt. 
* `show` - Show a single task based on item number
* `priup` - Priority up
* `pridown` - Priority down (down to C, deprioritised after)
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


One of the primary additions is a simple interactive interface powered by either `fzf` (terminal) or `rofi` (GUI). Both are fuzzy finders and allow to quickly navigate the todo tasks.

To display your tasks non-interactively, we recommend you use `todo.sh more` (short for `todo.sh more list`) rather than the traditional `todo.sh list`; `todo.sh more` redefines several built-in commands. A quick recommended way to use this from your shell is to set an alias `t="todo.sh more"`, you can then do `t list` (or just `t` as a shortcut),`t add`,`t done` etc... All the regular commands as well as the extensions should be available.

Todo.txt-more will invoke the `format` and `relsort` extensions to do better colour highlighting and better relative sorting. You can pass any actions you also pass to `todo.sh`. Here is an example:

![todo.sh more list](https://git.sr.ht/\~proycon/todotxt-more/blob/master/doc/morelist.png)

You can note the following in this example:

* todo.txt-more adds hashtags (starting with #) and will colour them differently (`todo.sh format`), context (`@`) and projects (`+`) will also get a distinctive colour.
* tasks with priority will always be shown before any items without priority (`todo.sh relsort`)
* tasks with a creation date will be shown using their relative date in days (e.g. *6d*) , and sorted accordingly.
    * though not shown in this example, tasks with a due date (`due:` attribute) will be shown using their relative date in days (e.g. 6d+), and sorted accordingly, this takes precedence over creation date.
* you see tasks synced from GitHub (`issue`) and from my mail (`notmuch`), more about this later...

Between the `more` and `lists` actions, you can inject the format you want for the output and the colouring.

* `ansi` - ANSI escape sequences, good for terminals, this is the default
* `pango` - Pango markup, good when used with GUI applications like rofi, dmenu with pango patch, [wayout](https://git.sr.ht/~proycon/wayout)
* `html` - HTML, good for exporting to the web
* `markdown` - Markdown syntax 
* `slack` - Slack's butchered version of markdown syntax, good for pasting into Slack.

You might, however, prefer a more interactive view that allows you to do fuzzy search and makes the tasks directly actionable.
If you run `todo.sh fzf list @work`, you'd the see same view as the static one, but interactively using fzf:

![todo.sh fancy list](https://git.sr.ht/\~proycon/todotxt-more/blob/master/doc/fzf.png)

Or run `todo.sh rofi list @work`, for the same thing in rofi, which opens a graphical menu. This is great to tie to a keybinding in your (tiling?) window manager: 

![todo.sh rofi list](https://git.sr.ht/\~proycon/todotxt-more/blob/master/doc/rofi.png)

Note that your rofi may look different depending on the theme you are using.

The rofi method even binds some shortcuts keys for quick actions like prioritisation and editing. Moreover, you can directly add new entries with rofi by just typing the full task entry in the search field and pressing enter. For existing items, once you select an item in either rofi or fzf, you're presented with an action menu (`todo.sh actionmenu`)

![action menu](https://git.sr.ht/\~proycon/todotxt-more/blob/master/doc/actionmenu.png)

### Issue syncing

If you use Github extensively, like I do, its issue tracker is likely an important source of information for your todo tasks. However, it's cumbersome to have issues separate from your todo.txt and effectively have two systems you need to check. The `issue` extension should solve this problem. Its job is to sync issues (including pull requests) from github with your todo.txt. It will sync *all issues assigned to you*. 

The sync works as follows:

* All tasks that are issues are marked with `issue:` and the *full path* to the issue.
* A sync is done by calling `todo.sh issue sync`, in order for this to work you need to have the environment variable `$GITHUB_TOKEN` set to a Github API token.
* Any github issue that is *assigned to you* and not yet in `todo.txt` or `done.txt` will be added (without prioritisation)
* The Github repository name is translated to a project name (e.g `proycon/codemeta-harvester` becomes `+codemetaharvester`, punctuation etc is stripped and all is lowercased) and will be shown at the beginning of the task line.
* The `todo.txt` contains just the issue title, its labels, project, not the body or comments. The rofi and fzf extensions offer an easy way to inspect an issue in the browser.
* If you close a task that is also a github issue via the action menu in rofi/fzf or via `task.sh issue done`, an API call will go out to GitHub to close the issue.
* Projects may also translate to further projects or contexts, you can customize this in a JSON file and pass the JSON filename in environment variable `$TODO_ISSUE_INFERMAP`. Example:

```json
{
    "codemetapy": ["@work","@huc","@clariah","+wp2tooldiscovery"],
    "codemetaharvester": ["@work","@huc","@clariah","+wp2tooldiscovery"],
    "codemetaserver": ["@work","@huc","@clariah","+wp2tooldiscovery"],
}
```

These will all be appended to the end.

* Github labels will be added as hashtags immediately after the project name.
You can optionally translate these through another map defined in a JSON file and filename in `$TODO_ISSUE_LABELMAP`. Example:

```json
{
    "feature": "feat",
    "enhancement": "feat"
}
```

* Tasks will have a creation date corresponding to the creation data of the issue.
* An extra `updated:`  attribute is added with the last updated time. This is updated on sync.

There are a few limitations to be aware of:

* The task description/issue subject is synced from github to task.txt only once, editing it in either has no effect on the other.
* When Github labels change, they will be synced back to todo.txt (but will appear at the end when they're new). You can't sync hashtags to github labels the other way round.
* When an issue is closed and reopened, it won't be detected in the sync

Though currently limited to Github, I hope to add Gitlab and Sourcehut support as well at a later stage.

### Mail syncing

Another common source of todo tasks is email. I often receive mails that require some kind of follow-up action, or that I simply have to reply to. I am using [notmuch](https://notmuchmail.org) as a means to add tags to my mail and make it quickly searchable. I use a *reply* tag for mail I still have to reply to, and *todo* for mail that requires another follow-up actions. Of course, I want both in my `todo.txt` so I have everything in one place again. 

The `todo.txt notmuch` extension syncs with your notmuch database. It runs a query (defined in environment variable `$TODOTXT_NOTMUCH_SEARCH`, which defaults to `tag:todo or tag:reply` fitting my own use-case) and adds all threads it finds to `todo.txt`. It is a one-way sync. Synced mails receive the context `@mail` and the notmuch tag translates to a hashtag. Any further mappings between notmuch tags and todo.txt can be configured in a JSON file, filename stored in `$TODOTXT_NOTMUCH_MAP`. Example:

```json
{
    "work": ["@work"],
    "personal": ["@hobby"],
    "sxmo": ["+sxmo", "@hobby"],
    "folia": ["+folia","@huc","@work"]
}
```

### Time tracking

Employers often require you to track your working hours, especially if you are working on a variety of distinct projects. Keeping track of this manually is a waste of time. If you have your `todo.txt` workflow in place, we can simply take advantage of this for tracking time as well. This is done using `todo.txt timetrack` and it can be invoked interactively via the action menu as presented by fzf or rofi. When you say *start task* a simply eentry of the full task line, prepended with the current date and time, is registered to a file `timetrack.txt` that lives alongside your `todo.txt` and `done.txt`. Only one task can be tracked at any given time (people suck at multitasking anyway, so better not pretend you can do it). When you start a new task the previous one ends. There is also `todo.sh timetrack stop` to stop tracking, which will simply register an *idle* entry in `timetrack.txt`. I recommend to automatically trigger this action when your screensaver/screenlock kicks in so you don't have to worry about it. The tracking will also be stopped automatically if you mark the currently tracked task as done via `todo.sh more done` or fzf/rofi.

To see the task you are currently working on, run `todo.sh timetrack current`. This may be worth adding to whatever bar (waybar/polybar/dwm's bar/etc) you use so you can see it at all times.

```
$ todo.sh timetrack current -d                  
1h13m +todotxtmore implement timetrack summary options @hobby
```

The `timetrack.txt` log can be visualised with `todo.sh timetrack log`, it optionally takes a start date and an end date (non-inclusive) as parameters (YYYY-MM-DD). Add the `-d` option if you want to have relative time (durations), use `-s` instead if you want it in raw seconds, these are also available for `timetrack current` as shown above.

Using `todo.sh timetrack daysummary` you can get a summary of total time spent, per day, on specific contexts or projects. It aggregates for each day all projects (``+``) and contexts (`@`) mentioned in the log.

Example output:

```
$ todo.sh timetrack daysummary 2022-12-29
2022-12-29 Thu 8h52m @hobby
2022-12-29 Thu 4h8m +todotxtmore
2022-12-29 Thu 14m @generic
2022-12-29 Thu 14m @entertainment
```

Be aware that the contexts and projects used in aggregation are not mutually exclusive. You can use any combination you want.

Similarly, there is a `weeksummary` and `monthsummary` that aggregates per week/month. You may add the `-all` parameter to see individual tasks again (rather than just contexts and projects).

### Calendar

There is a fair degree of overlap between todo lists and calendars, even though they are distinct perspectives on your time planning. Todo.txt traditionally caters towards todo lists  and not calendars, due dates are not in the initial design but can be easily using a `due` attribute, as many other implementations also do. Todo.txt-more follows this convention and takes `due` dates into account when sorting (`relsort`) and highlighting.

This opens up the road to expressing calendar items in `todo.txt`. The `cal` extension allows importing iCalendar (ics) format via `todo.sh cal import`. 

Similarly, you can export todo items to iCalendar format using `todo.sh cal export`.

## Contribute

If you want to contribute, git clone the [source code repository](https://git.sr.ht/~proycon/todotxt-more) and send patches to my [public inbox](mailto:~proycon/public-inbox@lists.sr.ht). Read about [the git e-mail workflow](https://git-send-email.io/) if you are not yet familiar with it.

The code is currently in a fairly early stage of development and needs further testing and cleanup.
