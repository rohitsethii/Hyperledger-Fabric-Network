#!/bin/bash 

export CORE_PEER_TLS_ROOTCERT_FILE=../crypto-config/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt
export CORE_PEER_LOCALMSPID="Org2MSP"
export CORE_PEER_ADDRESS=0.0.0.0:7056
export CORE_PEER_GOSSIP_BOOTSTRAP=0.0.0.0:7056
export CORE_PEER_GOSSIP_EXTERNALENDPOINT=0.0.0.0:7056
export CORE_PEER_MSPCONFIGPATH=../crypto-config/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp

if [ "$1" = "list" ]; then
    ./peer channel list 
    else echo "failed"
    fi

if [ "$1" = "run" ]; then
    ./peer node start 
    else echo "failed"
    fi

if [ "$1" = "join" ]; then
    ./peer channel join -o orderer.example.com -b  ../mychannel.block 
    else echo "failed"
    fi