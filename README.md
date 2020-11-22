ASSUMPTIONS:
1) the dex folder and HODL2_patch1 folder are in the same directory
2) we all have the same network-config.js file if not line 24-26 in
startUITest.sh will need to have the correct "private" address line numbers
for HODLDEX_PROXY address, HTETHUSD address, and HTOKENRESERVE_PROXY address

In HODL2_patch1/migrations/2_deploy_contracts.js
before the last line add the following code:

var stream = fs.createWriteStream("../addresses.txt");
    stream.once('open', function(fd) {
    stream.write("HTETHUSD="+tokenAddress+"\n");
    stream.write("HODLDEX_PROXY=" + upgradableHodlDex.address+"\n");
    stream.write("HTOKENRESERVE_PROXY="+upgradableTokenReserve.address+"\n");
    stream.end();
    });

CAUTION, you will need to use the same mnemonic in .secret file and line 11
of startUITest.sh file.

add file startUITest.sh and truffleScript.js to the root directory that
contains the dex folder and HODL2_patch1 folder.

in the root directory run:

sudo chmod +x startUITest.sh

then:

./startUITest.sh 
