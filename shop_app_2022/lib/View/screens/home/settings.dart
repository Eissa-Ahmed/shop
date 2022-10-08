import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_2022/View/screens/home/cubit/home_cubit.dart';
import 'package:shop_app_2022/View/screens/user/customButton.dart';
import 'package:shop_app_2022/View/screens/user/customTextFormFeild.dart';
import 'package:shop_app_2022/constant/constant.dart';

class Settings extends StatelessWidget {
  Settings({super.key});
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var cubit = HomeCubit.get(context);
    name.text = cubit.userLogin!.name;
    email.text = cubit.userLogin!.email;
    phone.text = cubit.userLogin!.phone;
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ConditionalBuilder(
            condition: cubit.userLogin != null,
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    CustomTextFormFeild(
                      hint: "",
                      onSaved: (val) {},
                      prefixIcon: const Icon(Icons.person),
                      validator: (val) {},
                      keyboardType: TextInputType.name,
                      controller: name,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFormFeild(
                      hint: "",
                      onSaved: (val) {},
                      prefixIcon: const Icon(Icons.email),
                      validator: (val) {},
                      keyboardType: TextInputType.name,
                      controller: email,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFormFeild(
                      hint: "",
                      onSaved: (val) {},
                      prefixIcon: const Icon(Icons.phone),
                      validator: (val) {},
                      keyboardType: TextInputType.name,
                      controller: phone,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ConditionalBuilder(
                        condition: state is! ChangeInfoLoadedState,
                        builder: (context) {
                          return CustomButton(
                              text: "Change Info",
                              onTap: () async {
                                await cubit.putDataUser(
                                    name: name.text,
                                    email: email.text,
                                    phone: phone.text);
                              });
                        },
                        fallback: (context) {
                          return const CustomButtonLoading();
                        }),
                    const SizedBox(
                      height: 60,
                    ),
                    CustomButton(
                        text: "Sign Out",
                        onTap: () {
                          signOut(context);
                        }),
                  ],
                ),
              );
            },
            fallback: (context) {
              return const Center(child: CircularProgressIndicator());
            });
      },
    );
  }
}
