import 'package:bloc/bloc.dart';
import 'package:elrondnft/data/models/nft/nft.dart';
import 'package:elrondnft/data/repository/nfts_repository.dart';
import 'package:equatable/equatable.dart';

part 'nft_state.dart';

class NftCubit extends Cubit<NftState> {
  NftCubit(this._nftsRepository) : super(const NftState());

  final NftsRepository _nftsRepository;

  Future<void> fetchNfts(String address) async {
    emit(state.copyWith(status: NftsStatus.loading));

    try {
      final nfts = await _nftsRepository.fetchNfts(address);
      emit(state.copyWith(status: NftsStatus.success, nftList: nfts));
    } catch (e) {
      emit(state.copyWith(status: NftsStatus.failure));
    }
  }
}
