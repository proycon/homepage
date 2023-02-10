+++
title = "Rant against centralised e-mail"
date = 2023-02-10T22:04:28+01:00
description = "In this post I vent my frustration with the trend to centralise mail solutions"

tags = ["e-mail", "M365"]
categories = []
+++

# Rant against centralised e-mail

Universities and research institutes used to be at the forefront when it comes
to development of the fundamental technologies that power the internet. As
early as 1965, researchers at MIT developed a kind of precursor to e-mail. In
1978, researchers at Berkeley leveraged the already existing unix tool 'mail'
(1971) to communicate over a larger network. Universities and research
institutes were among the first to embrace this new way to communicate with
peers across ever greater distances and eventually, with the advent of the
internet, all over the globe. Decentralised connections.

I'm a rather dismayed to see those same universities and institutes nowadays no
longer as pioneers and innovators in this area, but instead as mere consumers
of ready-made corporate solutions, following corporate interests and
centralising solutions. I have two employers, both academic, and both have
resorted to big-tech corporations that offer solutions like e-mail as a
service. E-mail "in the cloud", as they say. In these particular instances it's
Microsoft's Office 365 solution that is being adopted, but I'd be just as vocal
in my opposition it were Apple, Google or Facebook.

I don't know what their motivations were and who made the decisions, but I'm
sure parties like Microsoft know how to ply their wares enticingly. The promise
is, I would guess, most often *convenience* and *security*. You, the user, very
conveniently get great interoperability within a limited set of proprietary
software tools (the ones of the vendor of course). That may be great if you are
indeed a user of those tools and happy with it as you are. But as soon as you
leave a certain vendor's ecosystem, the experience becomes less than stellar
and often even a burden. Using one of their tools nudges you to also use the
others, because it's convenient. Worse, it may nudge your peers and they
instead apply peer pressure on you to use also those tools.

The average user may not care, but for those of us on the deep-end
of the geek spectrum, these trends have worrying implications for software
freedom, network federation, even net neutrality. Our concern is highly
political.

The other promise is security; now outsourcing your e-mail needs to a 3rd party
who has the expertise is of course not a bad idea if you lack the expertise
yourself. For institutes, this is also convenient. That in itself is not the
issue. The issue is everyone converging on a *the same extremely select group
of service providers*. We are willingly contributing to centralisation and if
done on such a scale, it fundamentally alters the nature and power-balance of a decentralised
network like the internet in essence is.

The centralisation has security implications as well, because not just
institutes and users converge on the select group of service providers, but so
do attackers. When (I dare say when rather than if) a vulnerability is
discovered and exploited by a malicious actor at one point, tremendous
amount of e-mails might be compromised.

However, this is not my main concern. As I already warned, my main concern is
political, let's take this further: what is fundamentally at stake here is who
owns the world's computing resources, the world's communication infrastructure,
who has access to them, and to what/whose benefit are they employed. It is
all about fair ownership and fair distribution, and in the end, a fairer world. In
a digitised society, computing power as well as raw data will become ever more
important resources. The question who owns (or has access to) both matters and
should not be trivialised. E-mail in particular is quite a treasure trove of
data, if accumulated by a centralised party.

Whenever you centralize something, especially on such a scale, you grant power
to a private company and you have to ask whether this trust is justified and
whose interests are really served. How will it play out over the long term?
What if some eccentric right-wing billionaire takes over the big-tech company
and enforces his own agenda? Or what if some state-actor takes a hold like in
China? Technology choices made today shape the internet, the digital society,
of the future. Putting all eggs in a single basket is a bad idea in principle,
even if it would be a nice comfy basket.

A few years ago, I already wrote in my post [Break free! Don't be a prisoner of
your software
platform!](https://proycon.anaproy.nl/posts/break-free-do-not-be-a-prisoner-of-your-software/)
that the internet is not in the best of states. It has become a
hyper-commercialised place in which users flock to free social media platforms,
usually advertisement companies at heart, and post their photos, blogs posts
and videos. This trend has developed for over almost two decades, in which
fundamental technologies that used to be fairly open were sealed off and turned
into walled-in gardens. Users were lured in en masse by the convenience of a
service free of charge, but they pay with their privacy by being tracked,
profiled and fed to an algorithm aimed to maximize their stay on their service.

It's taken a while but in recent years societal awareness has finally increased
that this may not be all for the better. Is the technology still serving us or
are we now serving the technology, or the companies providing it to us? 

I always maintain that technology choices and usage have real-life
implications; it's probably fair to say that social media, as an example,
brought an unparalleled upsurge in disinformation, hate-speech, and a whole
array of psychological disorders such as attention problems. Things that
eventually affect the real world. 

Are we going to make the same mistakes again with services like e-mail, or
computing in general? It is one thing (and bad enough) when casual users do it,
they have embraced services like gmail and hotmail for a long time already, but
it is a different thing when we as academic institutions follow suit and
abandon any pretence of contributing to a mature and properly decentralised
infrastructure.

If you are, like I am, deliberately an outsider to the centralised
communication platforms that lock you in, then you quickly hit a wall if you
don't play along. I'm already excluded (self-imposed) from various instant
messaging groups because I refuse to use WhatsApp ( = Facebook aka Meta). Now
at work my refusal to use M365 effectively locks me out of my corporate mail;
as a normal e-mail forward as I've always used everywhere isn't possible
anymore.

![The Oatmeal](https://s3.amazonaws.com/theoatmeal-img/comics/reaching_people/reaching_people.png)

Aside from the political objections, M365, or at least the policies that my
institute activated on it, makes several technical choices that go against my
idea of software freedom and how e-mail should be:

* Auto-forwarding is not allowed. I do get the security implications of not allowing
  everybody to wildly forward everything everywhere, but disabling it altogether is
  unnecessarily inflexible.
* M365 blocks various IP ranges which affect self-hosted SMTP server. The
  sender will have to explicitly register mail address and IP with M365 to be
  let through. I get the need to combat spam, which is the major cancer of
  e-mail. But this strictness breaks the decentralised spirit.
* M365 rewrites URLs in mails, it *modifies* the incoming mail (which in my
  view is a big no-go by definition and breaks cryptographic signatures). It
  makes all links go through their system (`safelinks.protection.outlook.com`).
  Again, I understand this is to protect against phishing, which is the 2nd
  most common problem with e-mail, but it misses the mark entirely, works
  counter productive, and introduces a huge privacy problem whilst it does so.
  Every link I click would go through their system and can potentially be
  tracked! Moreover, I only use text mails (no HTML, so far less prone to
  phishing) and their protection system obfuscates the URLs, making it *harder*
  for me to spot whether a link is legitimate or not. I can make that decision
  on my own, I don't need nor want MS to do it on my behalf.
* The IMAP login procedure with two-factor authentication breaks more
  traditional mail clients without OAuth2 support. Okay, then they should
  implement OAuth2, fine, I don't have an issue with 2FA in general. But the way it
  is implemented in OAuth2 by big mail providers like M365, according to
  [https://sourceforge.net/p/fetchmail/mailman/message/37724737/](the fetchmail
  developer), obliges mail clients to register with the mail provider. This
  gives more control to the companies and less to the user. The service
  provider shouldn't care what client I use, the only thing that matters is
  that I *as user* have the right credentials to access my mail. 
* I'm using a rather specific mail workflow which I've optimised over the years
  to work for me. Using my own mailserver, notmuch, neomutt and more. It's
  certainly not for everybody but it works for me (and it took me years to find
  something I'm actually comfortable with, most mail solutions suck pretty bad,
  or I suck at mail, probably a combination of both). Pulling in IMAP from M365
  into my mail workflow would require me to spend a few nights [setting up
  complex
  solutions](https://movementarian.org/blog/posts/fetchmail-and-office-365/)
  which I don't really want in the first place.

I may be a bit (okay, more than a bit) of an opinionated left-leaning idealist,
but the principles that formed the backbone of the internet are grounded in
interconnectivity of decentralised entities. Agreements (RFCs) establish
protocols that specify how communication should proceed and what is expected of
implementations. Communication especially should be open and interoperable, or
we end up communicating only with people in different walled-off corporate (or
governmental) silos. Which is sub-optimal. I strongly believe in federation,
but that's been under siege for well over two decades because it's 1)
technically much more difficult to get right 2) socially harder because it
requires communication and coordination and 3) harder to exploit commercially
(trapping users in your own platform is way more profitable).
