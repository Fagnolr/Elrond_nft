import 'package:elrondnft/data/repository/nfts_repository.dart';
import 'package:elrondnft/logic/cubit/nft_cubit.dart';
import 'package:elrondnft/presentation/screens/nfts_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(NftsApp(nftsRepository: NftsRepository()));
}

class NftsApp extends StatelessWidget {
  const NftsApp({Key? key, required NftsRepository nftsRepository})
      : _nftsRepository = nftsRepository,
        super(key: key);

  final NftsRepository _nftsRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _nftsRepository,
      child: BlocProvider(
        create: (context) =>
            NftCubit(context.read<NftsRepository>()),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData.dark(),
          home: const NftsScreen(),
        ),
      ),
    );
  }
}
