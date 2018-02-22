# Assume master file basename is the same as the parent folder
filename=$(notdir $(realpath $(dir $(realpath $(firstword $(MAKEFILE_LIST))))))

word-html :
	htlatex ${filename}.tex 'html,word' 'symbol/!' '-cvalidate'
	bibtex ${filename}.aux
	htlatex ${filename}.tex 'html,word' 'symbol/!' '-cvalidate'
	htlatex ${filename}.tex 'html,word' 'symbol/!' '-cvalidate'

clean-word-html :
	bash -c 'rm -vf ${filename}*.{4ct,4tc,aux,bbl,blg,css,dvi,htm,html,idv,lg,log,log,odt,out,pdf,png,ps,spl,svg,tmp,xref}'
	rm -vf texput.log

clean :	clean-word-html
