import 'package:flutter/material.dart';

class BannerHeader extends StatefulWidget {
  final String imageAsset;
  final String title;
  final String subtitle;
  const BannerHeader({super.key, required this.imageAsset, required this.title, required this.subtitle});

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [
                BoxShadow(
                  offset: Offset(1, 1),
                  blurStyle: BlurStyle.outer,
                  color: Colors.limeAccent,
                ),
              ],
            ),
          ),SizedBox(height: 100,),
          Text(widget.subtitle,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              shadows: [
                BoxShadow(
                  offset: Offset(1, 1),
                  blurStyle: BlurStyle.outer,
                  color: Colors.white,
                ),
              ],
            ),),
        ],
      ),
    );
  }
}
