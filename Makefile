# $Id$

SRCS = pprivsep.doc
FMTS = html
XSLTPROC = xsltproc
DOC2HTML = doc2html.xsl

.SUFFIXES: .html .doc

all: ${FMTS}

html: ${SRCS:.doc=.html}

.doc.html:
	${XSLTPROC} ${DOC2HTML} ${.IMPSRC} > ${.TARGET}

clean:
	rm -f ${SRCS:.doc=.html}
