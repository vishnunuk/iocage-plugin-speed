#!/usr/local/bin/bash
########################################################################
# Type: Installation file for shirosaidevÂ´s Diskover
# ----------------------------------------------------------------------
# Summary: Batch file to run inside a Jail @ FreeNAS or FreeBSD
# ----------------------------------------------------------------------
# Warning: I have NOT tighten the security of the jail
# ----------------------------------------------------------------------
# Description:
#    This is installes all Elasticsearch 5.6 , Redis 4.x , Python 3.7
#    with required modules , and PHP 7.2 with extenshions, and modules.
#    It also creates a Nginx webserver for the diskover-web module. 
#    You must run #pkg install bash and use bash to run the script.
#    
#    diskover is written and maintained by Chris Park (shirosai) 
#    and runs on Linux and OS X/macOS using Python 2/3.
#    
#    This sh file for FreeBSD is made by Andreas M Aanerud ( Aanerud )
# ----------------------------------------------------------------------
# changelist:
#    2019/02/18: 1st version
########################################################################

# Installing Nginx
    clear
    echo '--------------------------------------------------------------------------------'
    echo ' INSTALLING  Nginx'
    echo '--------------------------------------------------------------------------------'
    echo
    #pkg install -y nginx
     