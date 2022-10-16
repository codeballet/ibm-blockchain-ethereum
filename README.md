# Ethereum Private Network

## Introduction

A blockchain is a distributed digital register in which all transactions are recorded in sequential order in the form of blocks. There are a limitless number of blocks, but there is always one separate block that gives rise to the whole chain i.e. the genesis block.

In order to setup your own private Ethereum Network, you need to:

1. Create a Genesis Block.
2. Execute the genesis file.
3. Initialize the private network.
4. Create an Externally Owned Account (EOA).
5. Mining your private chain of Ethereum.

## 1. Create a Genesis Block

The project is created in a separate directory, here called `./my_network/`. Inside that folder, create a configuration file for the Genesis Block as a `CustomGenesis.json` file.

Inside the above project directory, create another directory for the private Ethereum Network, in order to keep your Ethereum private network files separate from the public files. Here, that directory inside the docker container is `/root/my_network/my_private_chain/`, which is stored in the Docker Volume `ethereum_network`.

### Explanation of `CustomGenesis.json` file configuration

- `config`: It defines the blockchain configuration and determines how the network will work.
- `chainId`: This is the chain number used by several blockchains. The Ethereum main chain number is "1". Any random number can be used, provided that it does not match with another blockchain number.
- `homesteadBlock`: It is the first official stable version of the Ethereum protocol and its attribute value is "0".
- One can connect other protocols such as Byzantium, eip155B, and eip158. To do this, under the homesteadBlock, add the protocol name with the Block prefix (for example, eip158Block) and set the parameter "0" to them.
- `difficulty`: It determines the difficulty of generating blocks. Set it low to keep the complexity low and to avoid waiting during tests.
- `gasLimit`: Gas is the "fuel" that is used to pay transaction fees on the Ethereum network. The more gas a user is willing to spend, the higher will be the priority of his transaction in the queue. It is recommended to set this value to a high enough level to avoid limitations during tests.
- `alloc`: It is used to create a cryptocurrency wallet for our private blockchain and fill it with fake ether. In this case, this option will not be used to show how to initiate mining on a private blockchain.

## 2. Execute the genesis file

Command to connect Geth to the Genesis file:

```
geth --identity "yourIdentity" --datadir /root/my_network/my_private_chain init /root/my_network/CustomGenesis.json
```

The `--datadir` specifies the location of the folder in which the data of your private chain will be stored.

## 3. Initialize the private network

Launch the private network in which various nodes can add new blocks with command:

```
geth --datadir /root/my_network/my_private_chain --networkid 98674561 --nodiscover --maxpeers=0
```

The `-networkid` identifier should be an arbitrary number that is not equal to the identifier of the networks already created. For example, the identifier of the main network Ethereum is `-networkid 1`.

### Note

In the response from the above command, find the `geth.ipc` file location, listed as the `IPC endpoint`. It may be in your above specified private network directory.

## 4. Create an Externally Owned Account (EOA)

An EOA is needed to manage the blockchain network.

EOAs have the following features:

- Controlled by an External party or person
- Accessed through private keys.
- Contains Ether Balance.
- Can send transaction sas well as 'trigger' contract accounts.

### Create an EOA

Open a new terminal windows and run geth:

```
geth attach /root/my_network/my_private_chain/geth.ipc
```

That will start the Geth JavaScript console.

Inside the console, run:

```
personal.newAccount()
```

Then, you need to enter a passphrase, and in response, you get an account number which you need to save for future use!

To check the balance of your account:

```
eth.getBalance("<account_number>")
```

## 5. Mining your private chain of Ethereum

Start mining with command:

```
miner.start()
```

After a few seconds, check the balance again, as detailed above. When fake ether shows up, stop the mining with:

```
miner.stop()
```
