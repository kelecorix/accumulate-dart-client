import 'dart:core';
import 'dart:typed_data';

import 'package:accumulate_api_ng/src/client/acc_url.dart';
import 'package:accumulate_api_ng/src/model/factom/factom_ext_ref.dart';
import 'package:accumulate_api_ng/src/utils/hash_builder.dart';
import 'package:hex/hex.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class FactomEntry {
  Uint8List data = Uint8List.fromList([]);
  List<FactomExtRef> extRefs = [];

  FactomEntry.empty() {
    data = Uint8List.fromList([]);
  }

  FactomEntry(Uint8List init) {
    data = init;
  }

  void addExtRef(String val) {
    extRefs.add(FactomExtRef.fromString(val));
  }

  List<Uint8List> getExtRefs(){
    List<Uint8List> ll = [];
    for(FactomExtRef fref in extRefs){
      ll.add(fref.data);
    }
    return ll;
  }

  Uint8List calculateChainId() {
    var hashBuilder = HashBuilder();

    for (FactomExtRef extRef in extRefs) {
      hashBuilder.addBytes(extRef.data);
    }

    var chainId = hashBuilder.getCheckSum();
    return chainId;
  }

  AccURL getUrl() {
    return AccURL.parse(HEX.encode(calculateChainId())); // Url.parse(Hex.encodeHexString(calculateChainId()));
  }
}
