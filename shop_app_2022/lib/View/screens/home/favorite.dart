import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_2022/View/screens/home/cubit/home_cubit.dart';

import '../../../constant/theme.dart';
import '../../../model/favoriteHomeModel.dart';

class Favourite extends StatelessWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubitFavorite = HomeCubit.get(context);
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
            condition: state is! HomeFavoriteLoadedState,
            builder: (context) {
              return ListView.separated(
                itemBuilder: (context, i) {
                  return CustomItemFavorite(
                      homeCubit: cubitFavorite,
                      favoriteProduct: cubitFavorite
                          .homeFavoriteModel!.data.data[i].product);
                },
                separatorBuilder: (context, i) {
                  return Divider(
                    color: Colors.grey[300],
                    height: 30,
                    thickness: 1,
                  );
                },
                itemCount: cubitFavorite.homeFavoriteModel!.data.data.length,
              );
            },
            fallback: (contexxt) {
              return const Center(child: CircularProgressIndicator());
            });
      },
    );
  }
}

class CustomItemFavorite extends StatelessWidget {
  CustomItemFavorite({
    Key? key,
    required this.favoriteProduct,
    required this.homeCubit,
  }) : super(key: key);
  FavoriteProduct favoriteProduct;
  HomeCubit homeCubit;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
          height: 100,
          margin: const EdgeInsets.all(10),
          color: Colors.white,
          child: Row(
            children: [
              CachedNetworkImage(
                imageUrl: favoriteProduct.image,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                width: 100,
                height: 100,
                // fit: BoxFit.cover,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      favoriteProduct.name,
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
                          "\$ ${favoriteProduct.price}",
                          maxLines: 2,
                          style: const TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        if (1 != 0)
                          Text(
                            "${favoriteProduct.old_price}",
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
                            await homeCubit.changeFavorite(favoriteProduct.id);
                            await homeCubit.getDataFavorite();
                          },
                          icon: homeCubit.favorite[favoriteProduct.id] == true
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
}
