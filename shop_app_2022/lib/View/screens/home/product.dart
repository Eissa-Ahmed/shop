import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_2022/View/screens/home/cubit/home_cubit.dart';

import '../../../constant/theme.dart';
import 'customCategory.dart';
import 'customItemGrid.dart';
import 'customSlider.dart';

class Product extends StatelessWidget {
  const Product({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubitProduct = HomeCubit.get(context);

    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
            condition: cubitProduct.homeModel != null &&
                cubitProduct.categoryModel != null,
            builder: (context) {
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Container(
                  color: Colors.grey[300],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomSlider(cubitProduct: cubitProduct),
                      CustomItemColum(cubitProduct: cubitProduct),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10 , vertical: 5),
                        child: GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 10.0,
                          childAspectRatio: 1 / 1.8,
                          crossAxisCount: 2,
                          children: List.generate(
                              cubitProduct.homeModel!.data.products.length,
                              (index) {
                            return customItemGrid(
                              cubitProduct,
                                cubitProduct.homeModel!.data.products[index]);
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            fallback: (context) {
              return const Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              );
            });
      },
    );
  }
}

class CustomItemColum extends StatelessWidget {
  const CustomItemColum({
    Key? key,
    required this.cubitProduct,
  }) : super(key: key);

  final HomeCubit cubitProduct;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Categories",
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 100,
            // padding: const EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) {
                return CustomStackCategories(
                  categoruItemModel: cubitProduct
                      .categoryModel!.data.data[i],
                );
              },
              separatorBuilder: (context, i) {
                return const SizedBox(
                  width: 10,
                );
              },
              itemCount: cubitProduct
                  .categoryModel!.data.data.length,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Products",
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
