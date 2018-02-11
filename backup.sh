#!/bin/bash
# Copyright (c) 2018 Pawel 'okno' Zorzan Urban
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
# #THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# #EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

<<EOF
        Created by:  Pawel 'okno' Zorzan Urban
        Report bugs: mail@pawelzorzan.eu
        Homepage:    https://www.pawelzorzan.eu
		License :    MIT 
EOF

SORGENTE="/media/okno/"			# Cosa copiare
TARGET="/media/veracrypt1"		# Dove copiare
EXCLUDE=""						# Lista file da escludere
TAG="Backup Logger" 			# tag dei log scritti in /var/log/messages

# VERIFICA MOUNT
MOUNTED=$(df | grep $TARGET |awk '{print $6}')

if [ "$MOUNTED" == "$TARGET" ]
then
	echo "Il disco è montato: eseguo il backup"
	logger Inizio backup di $SORGENTE per `hostname` -t $TAG
	rsync -av --exclude-from=$EXCLUDE $SORGENTE $TARGET/
	RSYNCERR=$?
	logger Fine backup per `hostname` rsync ha restituito $RSYNCERR -t $TAG
	exit 0
else
	echo "Il disco non è montato"
	logger Impossibile eseguire il backup di `hostname` disco non montato -t $TAG
	exit 1
fi
