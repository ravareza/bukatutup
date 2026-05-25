import 'package:flutter/material.dart';

class BannerHeader extends StatefulWidget {
  final String imageAsset;
  const BannerHeader({super.key, required this.imageAsset});

  @override
  State<BannerHeader> createState() => _BannerHeaderState();
}

class _BannerHeaderState extends State<BannerHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(widget.imageAsset),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
