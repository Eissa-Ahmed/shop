import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app_2022/View/screens/home/home.dart';
import 'package:shop_app_2022/View/screens/user/cubit/user_cubit.dart';
import 'package:shop_app_2022/constant/shared.dart';

import '../../widget/customToast.dart';
import 'customButton.dart';
import 'customRowLogin.dart';
import 'customTextFormFeild.dart';

class LogIn extends StatelessWidget {
  LogIn({Key? key}) : super(key: key);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var cubitLogin = UserCubit.get(context);

    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) async{
        if (state is UserLoginSuccessState) {
          if (state.shopLoginModel.status) {
            
            CachHelper.saveData(
                key: "token", value: cubitLogin.shopLoginModel!.data!.token);
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) => Home(),
              ),
            );
          } else {
            print("XXXXXXXXXXXXXXXXXXXXXXX");
            customToast(state.shopLoginModel.message);
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      SvgPicture.asset(
                        "assets/img/signup.svg",
                        width: 250,
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      CustomTextFormFeild(
                        keyboardType: TextInputType.emailAddress,
                        hint: "Email",
                        prefixIcon: const Icon(Icons.email),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Enter Your Email ?";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (val) {
                          cubitLogin.email = val!;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextFormFeild(
                        keyboardType: TextInputType.visiblePassword,
                        hint: "Password",
                        obscureText: cubitLogin.showPass,
                        suffixIcon: IconButton(
                          onPressed: () {
                            cubitLogin.showPassword();
                          },
                          icon: cubitLogin.showPass
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                        ),
                        prefixIcon: const Icon(Icons.lock),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Enter Your Password ?";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (val) {
                          cubitLogin.password = val!;
                        },
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      ConditionalBuilder(
                        condition: state is! UserLoginLoadingState,
                        builder: (context) {
                          return CustomButton(
                            onTap: () {
                              print(cubitLogin.password);
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                cubitLogin.userLogin(
                                  email: cubitLogin.email,
                                  password: cubitLogin.password,
                                );
                              }
                            },
                            text: "Sign In",
                          );
                        },
                        fallback: (context) {
                          return const CustomButtonLoading();
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomRowLogin(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
