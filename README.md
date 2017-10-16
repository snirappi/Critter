# Critter
Decentralized Twitter

## Libraries Used
* __CryptoJS__ https://github.com/brix/crypto-js
* __ursa__ https://github.com/JoshKaufman/ursa
* __node-fs__ https://github.com/bpedro/node-fs
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
    <td>integer 0-infinity</td>
  </tr>
  <tr>
    <td>previousHash</td>
    <td>hash field of previous block  </td>
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
    <td>10172017</td>
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
    <td>Digital Signature produced from private key</td>
  </tr>
</table>

__Chain__
Each user (or more precisely Public Key) has an associated block chain. Only the owner of the private key is able to publish blocks to the the chain. Digital Signatures allow others to verify integrity/authenticity of blocks.

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
  
# Acknowledgements
* Julian Assange https://twitter.com/julianassange/status/916214469948248064
* Senior Software Design Team (Decentralized Spotify)
* Facebook, Twitter for censoring, inspiring this application
