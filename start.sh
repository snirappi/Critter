#!/bin/bash
read -p 'Username: ' username
read -sp 'Password: ' password
if [[ ! -e $username ]]; then
	mkdir -p ./Users/$username/blockchains
fi
if [[ ! -e ./Users/$username/private_key.pem ]]; then
	openssl genrsa -aes128 -passout pass:$password -out ./Users/$username/private_key.pem 2048
	if	openssl rsa -in ./Users/$username/private_key.pem -passin pass:$password -pubout -out ./Users/$username/public_key.pub ; then
		node ./core/main.js $username $password
	fi
elif [[ -e ./Users/$username/private_key.pem ]]; then
	if 	openssl rsa -noout -in ./Users/$username/private_key.pem -passin pass:$password &>/dev/null ; then
		node ./core/main.js $username $password
	else
		echo "\nWrong Password"
	fi
fi
