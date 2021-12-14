import 'dart:convert';

import 'package:elrondnft/core/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:elrondnft/data/models/nft/nft.dart';

class NftApiProvider {
  Future<List<Nft>> fetchNfts(String address) async {
    final nftUri = Uri.https(
      Constants.API_BASE_URL,
      '/accounts/$address/nfts',
    );
    final nftsResponse = await http.get(nftUri);
    var json = jsonDecode(nftsResponse.body);
    return json.map<Nft>((i) => Nft.fromMap(i)).toList() as List<Nft>;
  }
}
