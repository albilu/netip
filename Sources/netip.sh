#!/bin/sh

#Developed by Bilu
#January 2016

if [ "$1" = "--help" ]; then {
    echo ""
    echo NETIP 2.0
    echo DEVELOPPEUR : Bilu
    echo COPYRIGHT JANVIER 2016
    echo ""
    echo OPTIONS
    echo "      without_option              = user_IP"
    echo "      --help                      = Manual"
    echo "      IP_format(Don't use [A-Z])  = 0.0.0.0" 
    echo ""
    echo Exemple
    echo "      netip 122.0.56.6"
    echo "      netip --help"
    echo ""
}
else {
    error=$(ping -c 2 google.fr 2> /dev/null)
    if [ "$error" ]; then {
        if [ "$1" = "" ]; then
            echo ""
            echo This tool show you differents informations about your Public IP !
            echo "Try <--help> for more details !"
            var=$(curl --silent icanhazip.com);lynx -dump "http://whatismyipaddress.com/ip/$var" | grep --color=always -wE "General IP Information|IP:|Decimal:|Hostname:|ASN:|ISP:|Organization:|Services:|Type:|Assignment:|Geolocation Information|Continent:|Country:|State/Region:|City:|Latitude:|Longitude:|Postal Code:|Invalid" | sed '/Geolocation Information/{x;p;x;}'
            echo ""
        fi
           
        if [ "$1" != "" ] && [ "$1" != "--help" ]; then 
        	echo ""
        	echo This tool show you differents informations about your Public IP
        	echo "Try <--help> for more details !"
        	lynx -dump "http://whatismyipaddress.com/ip/$1" | grep --color=always -wE "General IP Information|IP:|Decimal:|Hostname:|ASN:|ISP:|Organization:|Services:|Type:|Assignment:|Geolocation Information|Continent:|Country:|State/Region:|City:|Latitude:|Longitude:|Postal Code:|Invalid" | sed '/Geolocation Information/{x;p;x;}'
        	echo ""
        fi
    }
    else {
        echo ""
        echo Connexion Unreacheable ! Try to connect to your Network !
        echo ""
    } fi
} fi