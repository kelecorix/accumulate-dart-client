import 'dart:convert';
import 'dart:typed_data';

import 'package:accumulate_api_ng/accumulate_api.dart';
import 'package:accumulate_api_ng/src/utils/merkle_root_builder.dart';
import 'package:test/test.dart';

void main() {
  test('should construct Merkle Root', () async {
    Uint8List testHash = utf8.encode("0x0f0a").asUint8List();

    final MerkleRootBuilder merkleRootBuilder = MerkleRootBuilder();
    merkleRootBuilder.addToMerkleTree(testHash);
    merkleRootBuilder.addToMerkleTree(testHash);
    Uint8List root = merkleRootBuilder.getMDRoot();

    print(testHash); // [48, 120, 48, 102, 48, 97]
    print(root);

    //expect(root, exp);
    final acmeClient = ACMEClient("https://mainnet.accumulatenetwork.io" + "/v2");

    try {
      final res = await acmeClient.queryUrl("acc://dodoj.acme");
      res.length;
      String atype = res["result"]["type"];
    } catch (e) {
      e.hashCode;
    }


  });


}
