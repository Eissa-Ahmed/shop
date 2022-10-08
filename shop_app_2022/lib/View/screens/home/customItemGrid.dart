import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_2022/View/screens/home/cubit/home_cubit.dart';
import 'package:shop_app_2022/constant/theme.dart';

import '../../../model/homeModel.dart';

BlocConsumer<HomeCubit, HomeState> customItemGrid(HomeCubit cubitProduct, ProductsModel productsModel) {
  return BlocConsumer<HomeCubit, HomeState>(
    listener: (context, state) {
      // TODO: implement listener
    },
    builder: (context, state) {
      return Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                CachedNetworkImage(
                  imageUrl: productsModel.image,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  width: double.infinity,
                  height: 200,
                ),
                // Image.network(
                //   productsModel.image,
                //   width: double.infinity,
                //   height: 200,
                //   // fit: BoxFit.cover,
                // ),
                if (productsModel.discount != 0)
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: const BoxDecoration(
                      color: Colors.redAccent,
                    ),
                    child: const Text(
                      "DISCOUNT",
                      style: TextStyle(fontSize: 8, color: Colors.white),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productsModel.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "\$${productsModel.price.round()}",
                        maxLines: 2,
                        style: const TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      if (productsModel.discount != 0)
                        Text(
                          "${productsModel.oldPrice.round()}",
                          maxLines: 2,
                          style: const TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      const Spacer(),
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () async {
                          await cubitProduct.changeFavorite(productsModel.id);
                          await cubitProduct.getDataFavorite();
                        },
                        icon: cubitProduct.favorite[productsModel.id] == true
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : const Icon(Icons.favorite_border),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
