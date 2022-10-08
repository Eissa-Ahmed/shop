import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import 'cubit/home_cubit.dart';

class CustomSlider extends StatelessWidget {
  CustomSlider({
    Key? key,
    required this.cubitProduct,
  }) : super(key: key);
  final HomeCubit cubitProduct;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              onPageChanged: (index, page) {
                cubitProduct.changeIndexIndictor(index);
              },
              autoPlay: true,
              autoPlayAnimationDuration: const Duration(seconds: 1),
              autoPlayCurve: Curves.fastOutSlowIn,
              autoPlayInterval: const Duration(seconds: 4),
              viewportFraction: 1.0,
              height: 200,
              initialPage: 0,
              pauseAutoPlayOnManualNavigate: false,
              pauseAutoPlayOnTouch: false,
            ),
            items: cubitProduct.homeModel!.data.banners.map((e) {
              return CachedNetworkImage(
            imageUrl: e.image.trim(),
            placeholder: (context, url) => const Center(child:  CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            width: double.infinity,
            fit: BoxFit.cover,
          );
            }).toList(),
          ),
          Positioned(
            bottom: 10,
            right: 0,
            left: 0,
            child: Center(
              child: DotsIndicator(
                dotsCount: cubitProduct.homeModel!.data.banners.length,
                position: cubitProduct.currentIndexIndicator.toDouble(),
                decorator: DotsDecorator(
                  size: const Size.square(9.0),
                  activeSize: const Size(18.0, 9.0),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
