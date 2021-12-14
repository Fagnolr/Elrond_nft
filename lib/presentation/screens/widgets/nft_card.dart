import 'package:cached_network_image/cached_network_image.dart';
import 'package:elrondnft/data/models/nft/nft.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:convert';

import 'package:video_player/video_player.dart';

class NftCard extends StatefulWidget {
  const NftCard({Key? key, required this.nft}) : super(key: key);

  final Nft nft;

  @override
  State<NftCard> createState() => _NftCardState();
}

class _NftCardState extends State<NftCard> {
  bool isBack = true;
  double angle = 0;

  void _flip() {
    setState(() {
      angle = (angle + pi) % (2 * pi);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _flip,
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: angle),
        duration: const Duration(milliseconds: 500),
        builder: (BuildContext context, double val, __) {
          if (val >= (pi / 2)) {
            isBack = false;
          } else {
            isBack = true;
          }
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(val),
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0x901A1E25),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: isBack
                  ? NftPicture(
                      nft: widget.nft,
                    )
                  : Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()..rotateY(pi),
                      child: NftAttributes(
                        nft: widget.nft,
                      ),
                    ),
            ),
          );
        },
      ),
    );
  }
}

class NftPicture extends StatelessWidget {
  const NftPicture({
    Key? key,
    required this.nft,
  }) : super(key: key);

  final Nft nft;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        nft.url?.contains('.mp4') ?? false
            ? DisplayMp4(
                nft: nft,
              )
            : CachedNetworkImage(
                height: 200,
                width: 200,
                imageUrl: nft.url?.replaceAll(RegExp(r'\n'), '') ??
                    'https://pleinjour.fr/wp-content/plugins/lightbox/images/No-image-found.jpg',
                placeholder: (context, url) => const SizedBox(
                    height: 60, width: 60, child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
        const SizedBox(
          height: 20,
        ),
        Text(nft.name ?? ""),
      ],
    );
  }
}

class DisplayMp4 extends StatefulWidget {
  const DisplayMp4({Key? key, required this.nft}) : super(key: key);

  final Nft nft;

  @override
  _DisplayMp4State createState() => _DisplayMp4State();
}

class _DisplayMp4State extends State<DisplayMp4> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    if (widget.nft.url?.contains('.mp4') ?? false) {
      _controller = VideoPlayerController.network(
        widget.nft.url ?? '',
      );

      _initializeVideoPlayerFuture = _controller.initialize();
    }

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          _controller.play();
          return Container(
            height: 200,
            width: 200,
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class NftAttributes extends StatelessWidget {
  const NftAttributes({
    Key? key,
    required this.nft,
  }) : super(key: key);

  final Nft nft;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: splitAttributes(nft.attributes ?? ""),
      ),
    );
  }

  List<Widget> splitAttributes(String attributes) {
    Codec<String, String> stringToBase64 = utf8.fuse(base64);

    try {
      if (attributes == "") return [const Text("")];
      var res = stringToBase64.decode(nft.attributes ?? "");
      var list = res.replaceAll(RegExp(r'\n'), '').split(";");
      return list.map((text) => Text(text)).toList();
    } catch (e) {
      return [const Text("")];
    }
  }
}
