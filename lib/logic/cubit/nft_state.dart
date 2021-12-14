part of 'nft_cubit.dart';

enum NftsStatus { initial, loading, success, failure }

class NftState extends Equatable {
  const NftState({this.status = NftsStatus.initial, List<Nft>? nftList})
      : nftList = nftList ?? const [];

  final NftsStatus status;
  final List<Nft> nftList;

  NftState copyWith({NftsStatus? status, List<Nft>? nftList}) {
    return NftState(
      status: status ?? this.status,
      nftList: nftList ?? this.nftList,
    );
  }

  @override
  List<Object> get props => [status, nftList];
}
