import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_2022/View/screens/home/cubit/home_cubit.dart';
import 'package:shop_app_2022/model/categoryModel.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubitCategory = HomeCubit.get(context);
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ListView.separated(
          // scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, i) {
            return ItemCategory(
              categoruItemModel: cubitCategory.categoryModel!.data.data[i],
            );
          },
          separatorBuilder: (context, i) {
            return Divider(
              color: Colors.grey[300],
              height: 30.0,
              thickness: 1.5,
            );
          },
          itemCount: cubitCategory.categoryModel!.data.data.length,
        );
      },
    );
  }
}

class ItemCategory extends StatelessWidget {
  const ItemCategory({
    Key? key,
    required this.categoruItemModel,
  }) : super(key: key);

  final CategoruItemModel categoruItemModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          // Image(image: NetworkImage(categoruItemModel.image) , width: 100, height: 100, fit: BoxFit.cover, ),
          CachedNetworkImage(
            imageUrl: categoruItemModel.image.trim(),
            placeholder: (context, url) => const Center(child:  CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          // Image.network(
          //   categoruItemModel.image.trim(),
          //   width: 100,
          //   height: 100,
          //   fit: BoxFit.cover,
          // ),
          const SizedBox(
            width: 10,
          ),
          Text(
            categoruItemModel.name,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
  }
}
