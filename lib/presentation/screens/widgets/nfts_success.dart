import 'package:carousel_slider/carousel_slider.dart';
import 'package:elrondnft/data/models/nft/nft.dart';
import 'package:elrondnft/logic/cubit/nft_cubit.dart';
import 'package:elrondnft/presentation/screens/widgets/nft_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class NftsSucces extends StatelessWidget {
  const NftsSucces({Key? key, required this.listNft}) : super(key: key);

  final List<Nft> listNft;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                onSubmitted: (text) => text.isNotEmpty
                    ? BlocProvider.of<NftCubit>(context).fetchNfts(text)
                    : null,
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
        ),
        const SizedBox(
          height: 20,
        ),
        Center(
            child: CarouselSlider(
          options: CarouselOptions(
            height: 400,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
          ),
          items: listNft.map((nft) => NftCard(nft: nft)).toList(),
        )),
      ],
    );
  }
}
