+++
title = "Homepage update: from Hugo to Zola"
date = 2020-12-29T18:56:34+01:00
description = "The story about the latest incarnation of my homepage"
+++

# Homepage update: from Hugo to Zola

At the start of 2019, I launched a new incarnaton of homepage (yes, I still
call it "homepage", it has a nice nostalgic touch to it of a time where people
still bothered to create their own little corner on the internet instead of
joining corporate social networks en masse) .  I had chucked away my old site
that still relied on server-side processing (I believe it was Django-based at
the time), which stopped being the hip thing to do many years ago.  Instead, my
2019 site was statically generated with [Hugo](https://gohugo.io) and powered
by the [Academic theme](https://themes.gohugo.io/academic/), which I heavily modified
to suit my needs.

Things looked pretty slick and I was happy with the end result, but as always,
happiness is fleeting. As time progressed, both Hugo and the theme I was using
saw various updates, mostly consisting of features and additions I didn't need
or want anyways, and I found that my site would no longer generate with either
the latest Hugo or the latest Academic theme.

My aim had been to build a website that was more manageable over time, but that
failed. Getting rid of server-side processing was a good thing, but my website
was still too complex. Moreover, it contained some javascript and external
resources that I really wanted to get rid of as this became more and more of an
affront to my ethical sensibilities.

One thing I never liked about Hugo was its templating syntax, but I do see the
value of having a good and powerful templating system. There are countless
static site generators out there, as evidenced by for example
[Jamstack](https://jamstack.org/generators/), so I set out to investigate a
bit. I wanted to have a solution where I could do most of the actual content
writing in Markdown, but still have some decent control over how things end up.

Drawn by minimalism, I even contemplated solutions such as [ssg by Roman
Zolotarev](https://www.romanzolotarev.com/ssg.html) or
[mkws](https://mkws.sh/), but the former foregoes on templating altogether and
just sticks on a header and footer, and the latter uses shell scripting as
templating, which is not a syntactic improvement.

Although generating a site isn't very performance-critical for me, I did want
something efficient and compiled in a single binary, in the hope that this
would be closer to achieving simplicity and minimalism.  Therefore, static site
generators in interpreted languages, like Ruby, Python or Javascript, were out
of scope for me. That ruled out things like [Jekyll](https://jekyllrb.com/),
which I have some experience with for some other websites.

To make a long story short, I opted for [Zola](https://getzola.org) in the end.
A fairly simply static site generator written in Rust. This is one that looked
simple enough and up to do the job, without doing much more than that. It
features a nice templating engine with a decent Jinja2-like syntax and
[shortcodes](https://www.getzola.org/documentation/content/shortcodes/). The
fact that it's in Rust was a compelling argument for me too, as I know and like
Rust, so I'll be able to contribute to the generator if needed.

I also decided I shouldn't rely on an external template as a basis, but
make something from scratch and for my specific purpose, that way it can't diverge
and it won't contain things I won't need or need to strip out.

I'll summarise my experience with Zola in a pro and cons list:

### Pro

* Simple
* No unnecessary bloat, things you may want (like galleries) are not predefined but you can accomplish easily through templates)
* Good intuitive template syntax
* Written in Rust, single binary
* Responsive developer

### Con

* The distinction between sections and pages was a bit limiting in some regards, can't I have a section be a page at the same time? Building a navigation menu over both was a bit convoluted for me, but I may have misunderstood something perhaps.
* Error feedback could be better in general, it would also be nice if we could set verbosity a bit higher whilst zola is running.
* I had one actual crash/panic (but I submitted an issue and this is already being fixed by the developer)

I think most of these issues come down to lacking some maturity still, but I'm
confident of the direction the development is proceeding in. I hope backward
compatibility will be better guaranteed than my experience with Hugo.

## References

I'm not the only one two has made the jump from Hugo to Zola, I found two other blog posts on the topic and found their stories insightful:

* [by xypnox](https://www.xypnox.com/blag/posts/migrating-to-zola/)
* [by Karan Sharma](https://mrkaran.dev/posts/migrating-to-zola/)









