'use strict';

var fs = require('fs');
var crypto = require('crypto-js');
var ursa = require('ursa');

var username = process.argv[2];
var password = process.argv[3];

var key, pub;

function loadKeys(username, password){
	key = ursa.createPrivateKey(fs.readFileSync('Users/'+username+'/private_key.pem'), password);
	pub = ursa.createPublicKey(fs.readFileSync('Users/'+username+'/public_key.pub'));
}

loadKeys(username, password);
