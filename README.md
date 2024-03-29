
# Accumulate Dart Client

![Pub Version](https://img.shields.io/pub/v/accumulate_api)
![GitHub](https://img.shields.io/github/license/kelecorix/accumulate-dart-client)
[![Tests](https://github.com/kelecorix/accumulate-dart-client/actions/workflows/dart.yml/badge.svg)](https://github.com/kompendium-ano/accumulate-dart-client/actions/workflows/dart.yml)

Dart client for [Accumulate](https://github.com/AccumulateNetwork/accumulate) blockchain, a novel blockchain network designed to be hugely scalable while maintaining security.
This library supports all API class and basic data types that reflect network types and structures and utility functions to ease up creation of specific requests.

Full API reference available here: https://docs.accumulatenetwork.io/accumulate/developers/api/api-reference

## Installation

With Dart:
```
$ dart pub add accumulate_api_ng
```

With Flutter:
```
$ flutter pub add accumulate_api_ng
```

This will add a line like this to your package's pubspec.yaml (and run an implicit dart pub get):

```
dependencies:
  accumulate_api: any
```
Alternatively, your editor might support dart pub get or flutter pub get. Check the docs for your editor to learn more.
Import it

Now in your Dart code, you can use:
```
import 'package:accumulate_api_ng/accumulate_api.dart';
```

## Usage
See [examples](EXAMPLE.md) on how to use library.

## Contributions
This library [initially](https://github.com/kompendium-ano/accumulate-dart-client) developed by [Kelecorix, Inc](https://github.com/kelecorix) and [Sergey Bushnyak](https://github.com/sigrlami) for Kompendium LLC, 
however this is opinionated fork with goal to maintain *idiomatic* Dart/Flutter approach.

Contributions are welcome, open new PR or submit new issue.


