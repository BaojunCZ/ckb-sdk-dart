# CKB SDK Dart

[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2FCKBalance%2Fckb-sdk-dart.svg?type=shield)](https://app.fossa.io/projects/git%2Bgithub.com%2FCKBalance%2Fckb-sdk-dart?ref=badge_shield)
[![pub package](https://img.shields.io/pub/v/ckb_sdk.svg)](https://pub.dartlang.org/packages/ckb_sdk)

Dart SDK for [CKB](https://github.com/nervosnetwork/ckb).Nervos test network has not been released yet，so it is very early stage.Be careful when using this library.

## Prerequisites

To build CKB SDK, you'll need:

- Dart sdk: ">=2.2.2 <3.0.0"

## Usage

### JSON-RPC

```dart
final apiClient = CKBApiClient(nodeUrl: NodeUrl);
String blockHash = await apiClient.getBlockHash("1");
```

You can see more JSON-RPC requests from [RPC Document](https://github.com/nervosnetwork/ckb/blob/develop/rpc/README.md)

### Address

```dart
 final ckbAddress = CKBAddress(Network.TestNet);
 final address = ckbAddress.generate(PublicKey);
```

You can find more in here.

[api_client_example](example/api_client_example.dart)

[address_example](example/address_example.dart)

[test](test/)

## [License](LICENSE)

[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2FBaojunCZ%2Fckb-sdk-dart.svg?type=large)](https://app.fossa.com/projects/git%2Bgithub.com%2FBaojunCZ%2Fckb-sdk-dart?ref=badge_large)

## Changelog

See [CHANGELOG.md](CHANGELOG.md) file.
