#!/bin/bash 

export FABRIC_LOGGING_SPEC=debug
export CORE_PEER_TLS_ROOTCERT_FILE=../crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt
export CORE_PEER_LOCALMSPID="Org1MSP"
export CORE_PEER_ADDRESS=peer0.org1.example.com:7051
export CORE_PEER_MSPCONFIGPATH=../crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp

# ./peer node start

if [ "$1" = "list" ]; then
    ./peer channel list 
    # else echo "failed"
    fi

if [ "$1" = "run" ]; then
    ./peer node start 
    # else echo "failed"
    fi

if [ "$1" = "join" ]; then
    ./peer channel join -o orderer.example.com -b  ../mychannel.block 
    # else echo "failed"
    fi