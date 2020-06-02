#!/bin/sh

while :
do

if [ -z "$USER" ]
then
	echo "No user was set. Use -u=username"
	exit 10
fi

if [ -z "$PASSWORD" ]
then
	echo "No password was set. Use -p=password"
	exit 20
fi


if [ -z "$HOSTNAME" ]
then
	echo "No host name. Use -h=host.example.com"
	exit 30
fi


VALUE=$(ip -6 a show eth0 scope global | grep -o "[0-9a-f\:]\{8,\}")


if [ -z $VALUE ]
then
	echo "Could not detect external IP."
    break
fi


if [ -z $INTERVAL ]
then
	INTERVAL=300
fi


SERVICEURL="freedns.io/request"


echo "$SERVICEURL $HOSTNAME.freedns.io $VALUE"


RESULT=$(wget --no-check-certificate -qO- --post-data "username=$USER&password=$PASSWORD&host=$HOSTNAME&record=$HOSTTYPE&value=$VALUE" $SERVICEURL)


echo $RESULT


if [ $INTERVAL -eq 0 ]
then
    break
else
    sleep $INTERVAL
fi

done

exit 0
