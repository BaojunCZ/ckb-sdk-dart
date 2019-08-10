# CHANGELOG

## 0.18.0

Support [ ckb release v0.18.0](https://github.com/nervosnetwork/ckb/releases/tag/v0.18.0)

## 0.17.0

Support [ ckb release v0.17.0](https://github.com/nervosnetwork/ckb/releases/tag/v0.17.0)

### Feature

- Add hash_type to Script ([bd9007](https://github.com/BaojunCZ/ckb-sdk-dart/commit/bd900776e2dfdf1c955442f5601feda423e563c8))

- Update address format generator according recent RFC ([83ec45](https://github.com/BaojunCZ/ckb-sdk-dart/commit/83ec45168451f509942984b719eee6818fad32c6))

- Add get_cellbase_output_capacity_details rpc ([f845eb](https://github.com/BaojunCZ/ckb-sdk-dart/commit/f845ebdf8591d87ca72f4d69495480ba68cdbb75))

- Add get_header and get_header_by_number rpcs ([696fb4](https://github.com/BaojunCZ/ckb-sdk-dart/commit/696fb4d3db48c80d7c7c3a1bba11402c28f1752f))

- Add set_ban and get_banned_address rpcs ([2dd87c](https://github.com/BaojunCZ/ckb-sdk-dart/commit/2dd87cf22d12cb44de0f9fbce63b4c4e43e81f43))

## 0.16.0

Support [ ckb release v0.16.0](https://github.com/nervosnetwork/ckb/releases/tag/v0.16.0)

### Feature

- update epoch schema([406605f](https://github.com/BaojunCZ/ckb-sdk-dart/commit/406605f7d3138389d1d0e0a482162e74b0f72cc0))

## 0.15.0

Support [ ckb release v0.15.0](https://github.com/nervosnetwork/ckb/releases/tag/v0.15.0)

### Fix

- indexer rpc error([af3434](https://github.com/BaojunCZ/ckb-sdk-dart/commit/af3434dc796510d4f254fad033c82ca3920dc7de))

## 0.15.0

Support [ ckb release v0.14.0](https://github.com/nervosnetwork/ckb/releases/tag/v0.15.0)

### Features

- add Indexer rpc ([56](https://github.com/BaojunCZ/ckb-sdk-dart/pull/56))

- update get_blockchain_info rpc([a0c2b7](https://github.com/BaojunCZ/ckb-sdk-dart/pull/45/commits/a0c2b71776e6412ae41afeb873df9b82562752f1))

## 0.14.0

Support [ ckb release v0.14.0](https://github.com/nervosnetwork/ckb/releases/tag/v0.14.0)

### Features

- remove the args field in cell input type([7caac4](https://github.com/BaojunCZ/ckb-sdk-dart/pull/45/commits/7caac4a118cd5c3290e01f062ea224a0bed275ad))

- implement Secp256k1 recoverable sign([885e85](https://github.com/BaojunCZ/ckb-sdk-dart/commit/885e857cc9c493bfb2641777ef1527b96f083d07))

### Refactor

- clear up library([pull/47](https://github.com/BaojunCZ/ckb-sdk-dart/pull/47))

### Breaking Changes

- the type of cell input changes, its args field is removed
- make sdk more in line with the dart rules

## 0.13.0

Support [ ckb release v0.13.0](https://github.com/nervosnetwork/ckb/releases/tag/v0.13.0)

### Features

- update data type in RPC tx_pool_info ([41c412](https://github.com/BaojunCZ/ckb-sdk-dart/commit/41c4120ebc247d744d01113cb2785394445c5b1e))

## 0.12.0

Support [ ckb release v0.12.0](https://github.com/nervosnetwork/ckb/releases/tag/v0.12.0)

- add sign transaction hash to witness
- add RPC txPoolInfo,getPeers,epoch,dryTransaction,computeTransactionHash

## 0.11.0

Support [ ckb release v0.11.0](https://github.com/nervosnetwork/ckb/releases/tag/v0.11.0)

- add RPC getBlockByBlockNumber
- add RPC request time out
- add parse address

## 0.10.1

Support [ ckb release v0.10.0](https://github.com/nervosnetwork/ckb/releases/tag/v0.10.0)

- refactor RPCError

## 0.10.0

Support [ ckb release v0.10.0](https://github.com/nervosnetwork/ckb/releases/tag/v0.10.0)

- add since to cell input

## 0.9.0

Support [ ckb release v0.9.0](https://github.com/nervosnetwork/ckb/releases/tag/v0.9.0)

- add segregated witness structure
- refactor rpc types
- add Bech32
- format address
- fix hexStringToByteArray

## 0.8.0

Support [ ckb release v0.8.0](https://github.com/nervosnetwork/ckb/releases/tag/v0.8.0)

- adapt CKB v0.8.0

## 0.7.1

Support [ ckb release v0.7.0](https://github.com/nervosnetwork/ckb/releases/tag/v0.7.0)

- refactor script structure
- remove wallet part

## 0.7.0

Support [ ckb release v0.7.0](https://github.com/nervosnetwork/ckb/releases/tag/v0.7.0)

- add transaction trace RPC
- replace SHA3 with Blake2b

## 0.6.2

Support [ ckb release v0.6.0](https://github.com/nervosnetwork/ckb/releases/tag/v0.6.0)

- change pub name to ckb_sdk

## 0.6.1

Support [ ckb release v0.6.0](https://github.com/nervosnetwork/ckb/releases/tag/v0.6.0)

- fix dart pub warning

## 0.6.0

Support [ ckb release v0.6.0](https://github.com/nervosnetwork/ckb/releases/tag/v0.6.0)

- RPC
- asw account and transfer
- generate wallet
