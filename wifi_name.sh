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

cat <<EOF
        Created by:  Pawel 'okno' Zorzan Urban
        Report bugs: mail@pawelzorzan.eu
        Homepage:    https://www.pawelzorzan.eu
		License :    MIT 
EOF

# Controllo Nome Rete Wifi Attiva # conky 1.9.0+ Compatibile
# 11/08/2013 

interface=wlan0

if [ -e ~/.rete ]; then
/sbin/iwconfig $interface | /sbin/iwconfig $interface | grep ESSID |cut -c 31-43 > .rete
else
touch ~/.rete
/sbin/iwconfig $interface | /sbin/iwconfig $interface | grep ESSID |cut -c 31-43 > .rete
fi
if [ "$(cat .rete)" = "" ]; then
echo "Non collegato!"
else 
cat .rete |  sed 's/ID:"//'
fi
