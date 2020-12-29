+++
title = "GPS tracker integreren in home automation"
date = 2018-12-09T12:38:28+01:00
draft = false

# Tags and categories
# For example, use `tags = []` for no tags, or the form `tags = ["A Tag", "Another Tag"]` for one or more tags.
tags = ["gps", "home automation"]
categories = []

lang = "nl"

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
[image]
  # Caption (optional)
  caption = ""

  # Focal point (optional)
  # Options: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight
  focal_point = ""

+++

# GPS tracker integreren in home automation

Ik heb de GPS tracker die o.a. verkocht wordt als [Reptrek Minitrek](https://www.reptrek.com/huisdieren/gps-tracker-voor-kat-en-hond-minitrek/) aangeschaft
om onze hond te kunnen tracken.

In plaats van de standaard beschreven SeTracker2 software (Chinese closed-source app voor Android en iOS) te gebruiken
wilde ik als home-automation hobbyist deze gps tracker in mijn home automation systeem integreren en wilde ik pertinent
niet dat de tracker via een server van derden (namelijk die van de SeTracker2 app) communiceert waarbij ik totaal niet
weet wat er met mijn data gebeurt.  Dit wil ik dus in eigen beheer hebben ook ivm privacy en veiligheid. (Let wel,
de tracker communiceert sowieso over GPRS zonder enige encryptie!)

Dit documentje biedt wat instructies en technische details om deze tracker met je eigen GPS tracking platform op te
zetten. Het geheel werkt goed, enige minpunt is dat de GPS module toch af en toe wat moeite heeft goed signaal te
krijgen.


Benodigdheden
---------------

* De GPS tracker
* Een SIM kaart met mogelijkheid tot bellen, SMS en data (GPRS), (KPN prepaid voldeed prima bij mij). Let op dat 2G
  netwerk ondersteund is/blijft  (is niet bij alle providers zo)
     * Zet de pincode vergrendeling uit (via bv. een andere mobiele telefoon) voor het gebruik in de tracker
* Een eigen server (bv. een raspberry pi voldoet al)
     * Installeer [Traccar](https://www.traccar.org) - Open-source GPS tracking platform met web interface en eventueel app voor Android en iOS.
     * Open TCP poort 5093 voor de GPS tracker, en 8082 voor de webinterface

Technische Details
--------------------

* De tracker is de q36 (of een afgeleide daarvan) van chinese makelij, oorspronkelijk in de vorm van een gps horloge.
* De chipset is MTK2503 van MediaTek.
* Het GPRS communicatieprotocol is [hier](https://dl.dropboxusercontent.com/s/2hid9vaa2vno4jr/Communication%20Protocol.doc) beschreven, binnen de Traccar software wordt dit protocol als *watch* aangeduid.
    * De verschillende instructies kunnen als ook SMS naar de tracker gestuurd worden, het standaardwachtwoord is
        ``123456``. De syntax bestaat dan uit komma-gescheiden instructries/parameters en een hekje als afsluiting.
    * SMS Voorbeeldinstructries:
        * ``pw,123456,ts#`` - rapporteert (per SMS) de status en huidige instellingen, gebruik dit om te verifiëren of de
            SIM werkt, en in later stadium of er GPRS en GPS verbinding is.
        * ``pw,123456,pw,987654#`` - wijzig het wachtwoord (in 987654, gebruik dus iets anders)
        * ``pw,123456,lz,0,1#`` - stelt taal en tijdszone in
        * ``pw,123456,apn,portalmmm.nl,,,20408#`` - Activeert GPRS verkeer door het access point (APN) in te stellen, dit voorbeeld is voor
            KPN. Zoek de APN gegevens van je SIM provider op.
        * ``pw,123456,sos,+31612345678#`` - stel één of meerder SOS telefoonnummers in
        * ``pw,123456,whitelist1,+31612345678#`` - stel één of meerdere telefoonnummers in die mogen bellen naar de tracker
        * ``pw,123456,upload,120#`` - zet de upload interval in seconden (120 hier)
        * ``pw,123456,ip,127.0.0.1,5093#`` - *Stel hier je eigen server in waar de GPS gegevens naartoe gestuurd worden* (vervang het lokale IP hier door het IP van je eigen Traccar server, we hanteren hier standaardpoort 5093)
        * ``pw,123456,url#`` - De tracker SMSt een google maps link terug met de huidige lokatie gemarkeerd (handig als
            je puur via SMS wil werken en geen enkele app of server wil gebruiken).
        * ``pw,123456,reset#`` - Reboot de tracker
        * ``pw,123456,poweroff#`` - Zet de tracker uit (daar is immers geen knopje voor)


Home Automation
------------------

Traccar integreert mooi met de open-source software [Home Assistant](https://www.home-assistant.io), middels het [traccar component](https://www.home-assistant.io/components/device_tracker.traccar/).




