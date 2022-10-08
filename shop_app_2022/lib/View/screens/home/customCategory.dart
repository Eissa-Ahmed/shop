import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../model/categoryModel.dart';

class CustomStackCategories extends StatelessWidget {
  CustomStackCategories({Key? key, required this.categoruItemModel})
      : super(key: key);
  CategoruItemModel categoruItemModel;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        CachedNetworkImage(
            imageUrl: categoruItemModel.image.trim(),
            placeholder: (context, url) => const Center(child:  CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        // Image.network(
        //  categoruItemModel.image.trim(),
        //   width: 100,
        //   height: 100,
        //   fit: BoxFit.cover,
        // ),
        Container(
          width: 100,
          // padding: const EdgeInsets.symmetric(vertical: 0),
          color: Colors.black.withOpacity(0.8),
          child: Text(
            categoruItemModel.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
                overflow: TextOverflow.ellipsis),
          ),
        ),
      ],
    );
  }
}
