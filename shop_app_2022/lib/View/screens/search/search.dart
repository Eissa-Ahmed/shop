import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_2022/View/screens/home/cubit/home_cubit.dart';
import 'package:shop_app_2022/View/screens/search/searchModel.dart';

import '../../../constant/theme.dart';
import '../home/favorite.dart';
import '../user/customTextFormFeild.dart';

class Search extends StatelessWidget {
  Search({super.key});
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var cubitHome = HomeCubit.get(context);
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 20 , top: 20),
              child: IconButton(onPressed: (){
                Navigator.of(context).pop();
              }, icon: const Icon(Icons.arrow_back_ios)),
            ),
          ),
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                CustomTextFormFeild(
                  hint: "Search",
                  keyboardType: TextInputType.text,
                  onSaved: (val) {},
                  prefixIcon: Icon(Icons.search),
                  validator: (val) {},
                  controller: controller,
                  onChanged: (val) async {
                    cubitHome.search = val.trim();
                    await cubitHome.postDataSearch(search: val);
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                ConditionalBuilder(
                    condition: cubitHome.searchModel != null,
                    builder: (context) {
                      return ConditionalBuilder(
                          condition: state is! SearchLoadedState,
                          builder: (context) {
                            return Expanded(
                              child: ListView.separated(
                                itemBuilder: (context, i) {
                                  return CustomItemSearch(
                                    search: cubitHome.search,
                                    homeCubit: cubitHome,
                                    productSearchModel:
                                        cubitHome.searchModel!.data.data[i],
                                  );
                                },
                                separatorBuilder: (context, i) {
                                  return Divider(
                                    color: Colors.grey[300],
                                    height: 30.0,
                                    thickness: 1,
                                  );
                                },
                                itemCount: cubitHome.searchModel != null
                                    ? cubitHome.searchModel!.data.data.length
                                    : 0,
                              ),
                            );
                          },
                          fallback: (context) {
                            return const Center(
                                child: CircularProgressIndicator());
                          });
                    },
                    fallback: (context) {
                      return const Expanded(
                          child: Center(child: Text("Search . . . ")));
                    }),
              ],
            ),
          )),
        );
      },
    );
  }
}

class CustomItemSearch extends StatelessWidget {
  CustomItemSearch({
    Key? key,
    required this.productSearchModel,
    required this.homeCubit,
    required this.search,
  }) : super(key: key);
  ProductSearchModel productSearchModel;
  HomeCubit homeCubit;
  String search;
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
                imageUrl: productSearchModel.image,
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
                      productSearchModel.name,
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
                          "\$ ${productSearchModel.price}",
                          maxLines: 2,
                          style: const TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Spacer(),
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () async {
                            await homeCubit
                                .changeFavorite(productSearchModel.id);
                            await homeCubit.getDataFavorite();
                            // await homeCubit.postDataSearch(search: search);
                          },
                          icon:
                              homeCubit.favorite[productSearchModel.id] == true
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
