import 'dart:convert';
import 'dart:typed_data';

import 'package:accumulate_api_ng/src/payload/base_payload.dart';
import 'package:accumulate_api_ng/src/transaction.dart';
import 'package:accumulate_api_ng/src/utils/utils.dart';
import 'package:test/test.dart';

class TestPayload extends BasePayload {
  int _counter = 0;

  @override
  Uint8List extendedMarshalBinary() {
    this._counter++;
    return utf8.encode("").asUint8List();
  }
}

void main() {
  test('should populate timestamp', () {
    final header = Header("acc://hello");

    expect(header.timestamp, greaterThan(0));
  });

  test('should marshal binary Transaction', () {
    var ho = HeaderOptions();
    ho.timestamp = 55; // work as `nonce` in protocol
    var header = Header("acc://hello", ho);
    TestPayload payload = TestPayload();

    var tx = Transaction(payload, header);

    //expect(payload.extendedMarshalBinary(), [0]);
  });
}
