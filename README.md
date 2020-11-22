In HODL2_patch1/migrations/2_deploy_contracts.js
before the last line add the following code:

var stream = fs.createWriteStream("../addresses.txt");
    stream.once('open', function(fd) {
    stream.write("HTETHUSD="+tokenAddress+"\n");
    stream.write("HODLDEX_PROXY=" + upgradableHodlDex.address+"\n");
    stream.write("HTOKENRESERVE_PROXY="+upgradableTokenReserve.address+"\n");
    stream.end();
    });

add file startUITest.sh and truffleScript.js to the root directory that
contains the dex folder and HODL2_patch1 folder.

in the root directory run:

./startUITest.sh 
