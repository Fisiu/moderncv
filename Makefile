NAME = moderncv
TOPDIR = $(HOME)/texmf/tex/latex
BASEDIR = $(TOPDIR)/base
PACKAGEDIR = $(TOPDIR)/$(NAME)

INSTALL = install -m 644

# Class
CLS = moderncv.cls
# Styles
STY = moderncvcollection.sty \
	  moderncvcolorblack.sty \
	  moderncvcolorblue.sty \
	  moderncvcolorgreen.sty \
	  moderncvcolorgrey.sty \
	  moderncvcolororange.sty \
	  moderncvcolorpurple.sty \
	  moderncvcolorred.sty \
	  moderncvcompatibility.sty \
	  moderncvdebugtools.sty \
	  moderncviconsawesome.sty \
	  moderncviconsletters.sty \
	  moderncviconsmarvosym.sty \
	  moderncvstylebanking.sty \
	  moderncvstylecasual.sty \
	  moderncvstyleclassic.sty \
	  moderncvstyleempty.sty \
	  moderncvstyleoldstyle.sty \
	  tweaklist.sty

.PHONY: info install prepare build clean updatedb remove

	  
info:
	@echo "'make install' to install"
	@echo "'make clean' to remove"
	  
install: prepare build updatedb

prepare: 
	@mkdir -p $(HOME)/texmf/tex/latex/{base,$(NAME)}

build:
	$(INSTALL) $(NAME)/$(CLS) $(BASEDIR)
	@for s in $(STY); do \
		cp $(NAME)/$$s $(PACKAGEDIR)/ ; \
	done

clean: updatedb remove
	
updatedb:
	@texhash

remove:
	@rm -rf $(HOME)/texmf/tex/latex/$(NAME)
	@rm -f $(HOME)/texmf/tex/latex/base/$(CLS)
