# Hyperledger-Fabric-Network
Step by step guide to setup hyperledger fabric network on your local machine without using docker.

### Prerequisites

Things you need to install

* [Fabric Binaries](https://hyperledger-fabric.readthedocs.io/en/release-1.4/install.html) 
* [Docker](https://www.docker.com/products/docker-desktop)
* [Go](https://golang.org/)

# 1. Get the binaries 

```
curl -sSL http://bit.ly/2ysbOFE | bash -s 1.4.0
```

Above command executes a bash script that will download and extract all of the platform-specific binaries 

* configtxgen,
* configtxlator,
* cryptogen,
* discover,
* idemixgen
* orderer,
* peer, and
* fabric-ca-client

# 2. Binaries --> Configurations

* cryptogen --> crypto-config.yaml
* configtxgen --> configtx.yaml
* Orderer --> orderer.yaml
* peer --> core.yaml

Binary files associated with their respective configutions.