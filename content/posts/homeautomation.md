+++
title = "Home Automation"
date = 2014-01-10T22:10:53+01:00
draft = false

# Tags and categories
# For example, use `tags = []` for no tags, or the form `tags = ["A Tag", "Another Tag"]` for one or more tags.
tags = []
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

# Home Automation

I've just recently started my do-it-yourself home automation project, it's great fun! My goal is to have as much scriptable as possible, I'm mostly a software guy so want to delegate as much to my scripts as I can. Hardware-wise I want to keep things cheap and simple, so no expensive commercial solutions, but DIY work (well, I delegate some of the more practical tasks such as soldering and screwing things in place to my boyfriend) and 100% open-source.

Everything is controlled by my home server (Linux) and two Raspberry pi's, though in theory a single Raspberry Pi would be sufficient as well. It's all a fairly cheap solution if you're okay with getting your hands dirty with electronics and programming. What I have thus-far:

* 433.92Mhz RF transmitter (4 eur) hooked up to raspberry pi (35 eur), for remote-controlled lights and other electrical appliances (http://www.elroshop.eu/3-schakelaars-met-afstandsbediening-ab440s-3c.html) (17 eur for 3 switches).
* Door/window sensors (simple wired reed switches), hooked up to Raspberry Pi (4 eur per sensor)
* Standard doorbell (1 eur), hooked up to Raspberry Pi. A standard cheap PC speaker near the door to produce ding-dong sound.
* Detection whether boyfriend or I are home based on presence of mobile phones in our wireless network.
* Alarm sounds and mail notifications in case doors open when nobody is homs.
* Lights automatically turn on and off based on time and presence, computed relative to sunrise & sunset.
* Text-to-speech greeting me whenever we come home, get a visitor, or for other announcements :)
* IP Cam (170eur) and normal static webcams (12eur) for surveillance, patrolling based on time-of-day and presence, automated snapshots (the IP cam is the only expensive part in this story). I'm using my own scripts to control the cam, rather than built-in firmware for patrols etc.
* Media center on TVs (via Raspberry Pis), allowing viewing of videos, youtube, music (mpd daemon & icecast stream), images (fbi), etc.. TV can turn on automatically through CEC, for the other older model I'm gonna hook an IR led to the pi and pretend to be a remote.
* Server-side consists of a master Python script and some additional services (light daemon, door daemon)
* Front-end is a nice and secure web-based interface (custom built), to access it all from computer, tablet, or phone

Projects still planned:

* Build my own thermostat (I just received my temperature sensors (1 eur each) in the mail, going to hook them up to Raspberry Pi soon)
* Speech recognition / Voice commands
* More logging and nice graphs
* Tracking of our whereabouts (phones) using GPS
* Smoke detectors connected to server

