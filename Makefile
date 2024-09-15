.PHONY: serve deploy bib

serve:
	zola serve

build:
	zola build

deploy: bib build
	cp auth* public/
	cp key.asc public/
	cp proycon.vcf public/
	cp id_ed25519.pub public/
	rsync -avz --delete public/ anaproy.nl:/home/www/proycon.anaproy.nl/html

proycon.ris:
	bib2xml proycon.bib | xml2ris > proycon.ris #requires bibutils

proycon.bib.json:
	pandoc proycon.bib -t csljson -o proycon.bib.json

bib: proycon.ris proycon.bib.json

