import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class AnotherImages extends StatelessWidget {
  final List<dynamic>? allImages;

  const AnotherImages({
    Key? key,
    required this.allImages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 180,
            aspectRatio: 16 / 9,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: false,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
          ),
          items: allImages?.map((image) {
            return Builder(
              builder: (BuildContext context) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    "http://khdev.pythonanywhere.com/$image",
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                );
              },
            );
          }).toList() ?? [],
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 10, // Position de l'indicateur par rapport au bas
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: allImages?.asMap().entries.map((entry) {
              int index = entry.key;
              return Container(
                width: 8, // Largeur de l'indicateur
                height: 8, // Hauteur de l'indicateur
                margin: EdgeInsets.symmetric(horizontal: 4.0), // Espacement entre les indicateurs
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == 0 ? Colors.blue : Colors.grey, // Couleur de l'indicateur sélectionné
                ),
              );
            }).toList() ?? [],
          ),
        ),
      ],
    );
  }
}
