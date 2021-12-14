import 'package:elrondnft/logic/cubit/nft_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class NftsFailure extends StatelessWidget {
  const NftsFailure({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                onSubmitted: (text) =>
                    text.isNotEmpty ? BlocProvider.of<NftCubit>(context).fetchNfts(text) : null,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Elrond Address',
                    hintStyle: TextStyle(color: Colors.black, fontSize: 16)),
                style: GoogleFonts.montserrat(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text('An error occured, try again')
        ],
      ),
    );
  }
}
