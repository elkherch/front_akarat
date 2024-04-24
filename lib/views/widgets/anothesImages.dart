import 'package:flutter/material.dart';

class AnotherCarouselI extends StatelessWidget {
  final List<String> images;

  const AnotherCarouselI({Key? key, required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: images.length,
      itemBuilder: (context, index) {
        return Image.network(
          images[index],
          height: 180,
          width: double.infinity,
          fit: BoxFit.cover,
        );
      },
    );
  }
}
