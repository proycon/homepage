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

proycon.ris: proycon.bib
	bib2xml $< | xml2ris > $@ #requires bibutils

proycon.bib.json: proycon.bib
	pandoc proycon.bib -t csljson -o $@ && sed -i 's/"dropping-particle"/"non-dropping-particle"/g' $@

bib: proycon.ris proycon.bib.json

