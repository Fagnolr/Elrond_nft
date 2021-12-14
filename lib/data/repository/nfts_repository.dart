import 'package:elrondnft/data/data_provider/nfts_api_provider.dart';
import 'package:elrondnft/data/models/nft/nft.dart';

class NftsRepository {
  NftsRepository({NftApiProvider? nftsApi})
      : _nftsRepository = nftsApi ?? NftApiProvider();

  final NftApiProvider _nftsRepository;

  Future<List<Nft>> fetchNfts(String address) async {
    return _nftsRepository.fetchNfts(address);
  }
}
