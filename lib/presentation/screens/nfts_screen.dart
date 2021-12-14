import 'package:elrondnft/logic/cubit/nft_cubit.dart';
import 'package:elrondnft/presentation/screens/widgets/nfts_failure.dart';
import 'package:elrondnft/presentation/screens/widgets/nfts_initial.dart';
import 'package:elrondnft/presentation/screens/widgets/nfts_loading.dart';
import 'package:elrondnft/presentation/screens/widgets/nfts_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NftsScreen extends StatelessWidget {
  const NftsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const NftsView();
  }
}

class NftsView extends StatelessWidget {
  const NftsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<NftCubit, NftState>(builder: (context, state) {
        switch (state.status) {
          case NftsStatus.initial:
            return const NftsInitial();
          case NftsStatus.success:
            return NftsSucces(
              listNft: state.nftList,
            );
          case NftsStatus.failure:
            return const NftsFailure();
          case NftsStatus.loading:
            return const NftsLoading();
          default:
            return Container();
        }
      }),
    );
  }
}
