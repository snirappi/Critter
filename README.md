# Critter
Decentralized Social Media.
## Purpose
Centralized Social Media websites such as Facebook and Twitter have full control of all content published by their users. This leaves a significant amount of power left in the hands of such companies, as they are able to control what is shown to users and what users are allowed to say on their platforms. This application is a direct response to such censorship by giving power back to the users instead of giving it all to the platform owners. 

## Critter Terminology
* User - Can refer to Publisher or Follower.
* Blockchain - The complete record of a publisher's posts. 
* Post/Block - Each 'block' in the block chain contains the 'post' and other information to maintain blockchain integrity. In this document they will often be used interchangeably.
* Publisher - Owner of a public/private key pair. Has a blockchain they can post to and share with peers.
* Follower - Keeps a copy of a publisher's blockchain. Will receive and send new blocks with other peers. Followers will only see posts from publishers they "follow."

## Underlying Technology
In Critter, the blockchain is the cornerstone of the platform. Instead of having a central authority/server manage the publications of an individual, the publisher and peers that 'follow' the publihser maintain/store posts. Each publisher has their own blockchain in which they are the only ones able to add new posts to. This is upheld by using digital signatures that users can verify with the publisher's public key. If a malicious user wished to append a post to a blockchain they do not know the private key for, peers will reject their addition because it will not pass verification.
Instead of traditional user accounts with emails, usernames, and passwords, Critter users have a Public Key and Private Key generated with RSA SHA256 Encryption. These keys *are*  the user's identity and is solely maintained by the user. Should the private key be lost or stolen, a user should no longer associate oneself with the corresponding public key and make a new Key Pair.
__There is no lost password option. If you lose your private key, the corresponding public key and blockchain should no longer be trusted.__

## Proof-of-Authority
Unlike cryptocurrencies that need to keep a global ledger of all transactions, Critter is only interested in keeping a trustworthy log of all posts made by a publisher. Since there is no consensus needed, followers only need to be sure that they are seeing authentic messages from the publisher. 

## Drawbacks
With the all the strengths of the blockchain, there are drawbacks
* Publishers __cannot__ delete posts once other peers have received the post
* Publishers __cannot__ edit posts once other peers have received the post
* Once a private key is lost, the publisher has lost all authority over the corresponding public key and blockchain
* Publishers are able to post __anything__. "Followers" should be certain of who they follow!

## Libraries
* __CryptoJS__ https://github.com/brix/crypto-js
* __ursa__ https://github.com/JoshKaufman/ursa
* __Peerjs__ https://github.com/peers/peerjs
## Structures
__Block__
Based on __naivechain__ https://github.com/lhartikk/naivechain
<table>
  <tr>
    <th>Field</th>
    <th>Description</th> 
  </tr>
  <tr>
    <td>index</td>
    <td>integer</td>
  </tr>
  <tr>
    <td>previousHash</td>
    <td>hash field of previous block</td>
  </tr>
  <tr>
    <td>timestamp</td>
    <td>time of block creation</td>
  </tr>
  <tr>
    <td>data</td>
    <td>generic</td>
  </tr>
  <tr>
    <td>hash</td>
    <td>SHA256 of index, previousHash, timestamp, and data</td>
  </tr>
  <tr>
    <td>signature</td>
    <td>Digital Signature produced from private key</td>
  </tr>
</table>

__Genesis Block__

<table>
  <tr>
    <th>Field</th>
    <th>Value</th> 
  </tr>
  <tr>
    <td>index</td>
    <td>0</td>
  </tr>
  <tr>
    <td>previousHash</td>
    <td>"0"</td>
  </tr>
  <tr>
    <td>timestamp</td>
    <td>916214469948248064</td>
  </tr>
  <tr>
    <td>data</td>
    <td>"Genesis"</td>
  </tr>
  <tr>
    <td>hash</td>
    <td>{PUBLIC KEY}</td>
  </tr>
  <tr>
    <td>signature</td>
    <td>"0"</td>
  </tr>
</table>

__Chain__
Each user (or more precisely Public Key) has an associated block chain. Only the owner of the private key is able to publish blocks to the the chain that will be accepted by other users. Digital Signatures allow others to verify integrity/authenticity of blocks.

__Table__
Using Javascript Maps we make a table of key value pairs like this
<table>
  <tr>
    <td>Key</td>
    <td>Block</td>
    <td>Block</td>
    <td>Block</td>
    <td>Block</td>
  </tr>
  <tr>
    <td>{PUBLIC KEY}</td>
    <td>Block 0</td>
    <td>Block 1</td>
    <td>Block ...</td>
    <td>Block N</td>
  </tr>
 </table>

## Peer Discovery
A separate PeerJS server which must be hosted others will handle pairing peers together. Peers will recieve lists of all other Peers using the same PeerJS Server. *may change*

## Syncing Chains
On connecting to a peer, peers will exchange chains they are 'following'. If the total length is different, the peer with the smaller chain will add new blocks, one-by-one, verifying each message to ensure authenticity. 

# Acknowledgements
* Julian Assange https://twitter.com/julianassange/status/916214469948248064
* Senior Software Design Team (Decentralized Spotify)
* Facebook, Twitter for censoring, inspiring this application
