import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app_2022/View/screens/user/login.dart';
import 'package:shop_app_2022/constant/theme.dart';

import 'cubit/user_cubit.dart';
import 'customButton.dart';
import 'customTextFormFeild.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var cubitLogin = UserCubit.get(context);

    return BlocConsumer<UserCubit, UserState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: primaryColor,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      "assets/img/login.svg",
                      width: 250,
                      height: 150,
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    CustomTextFormFeild(
                      keyboardType: TextInputType.text,
                      hint: "User Name",
                      prefixIcon: const Icon(Icons.person),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Enter Your Name ?";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (val) {
                        cubitLogin.userName = val!;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormFeild(
                      keyboardType: TextInputType.text,
                      hint: "Phone",
                      prefixIcon: const Icon(Icons.phone_android),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Enter Your Phone ?";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (val) {
                        cubitLogin.phone = val!;
                      },
                    ),
                    const SizedBox(
                      height: 20,
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
                      condition: state is! SignUpLoadedDone,
                      builder: (context) {
                        return CustomButton(
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              await cubitLogin.signupDone(
                                emailx: cubitLogin.email,
                                phonex: cubitLogin.phone,
                                passwordx: cubitLogin.password,
                                namex: cubitLogin.userName,
                              ).then((value) {
                                Navigator.of(context).push(MaterialPageRoute(builder: (_)=> LogIn()));
                              }).catchError((onError){});
                            }
                          },
                          text: "Sign Up",
                        );
                      },
                      fallback: (context) {
                        return const CustomButtonLoading();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
