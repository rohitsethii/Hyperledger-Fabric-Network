'use strict';

const shim = require('fabric-shim');
const util = require('util');
const ClientIdentity = shim.ClientIdentity;


let Chaincode = class {
    
    async Init(stub) {
        return shim.success();
    }

    async Invoke(stub) {
        let ret = stub.getFunctionAndParameters();
        
        let method = this[ret.fcn];
        
        if (!method) {
            console.error('no function of name:' + ret.fcn + ' found');
            throw new Error('Received unknown function ' + ret.fcn + ' invocation');
        }
        try{
            let payload = await method(stub,ret.params);
            return shim.success(payload);
        } catch (err) {
            console.log(err);
            return shim.error(err);
        }
    }

    async guessNumber(stub,args) {
        let cid = new ClientIdentity(stub); // "stub" is the ChaincodeStub object passed to Init() and Invoke() methods

        let cert = await cid.getX509Certificate();
        
        if (args.length != 2) {
            throw new Error('Incorrect number of arguments. Expecting 1');
        } 
        let number = args[1];

        await stub.putState(cert.subject.commonName, Buffer.from(number));
    }

    async getNumber(stub,args) {
        let cid = new ClientIdentity(stub); // "stub" is the ChaincodeStub object passed to Init() and Invoke() methods

        let cert = await cid.getX509Certificate();
        
        if (args.length != 1) {
            throw new Error('Incorrect number of arguments. Expecting 1');
        } 

        let numberAsBytes = await stub.getState(cert.subject.commonName);
        if (!numberAsBytes || numberAsBytes.toString().length <= 0) {
            throw new Error('no guess found');
          }
          return numberAsBytes;
    }
};

shim.start(new Chaincode());