import 'package:flutter/material.dart';
import 'package:shop_app_2022/View/screens/user/signup.dart';

class CustomRowLogin extends StatelessWidget {
  const CustomRowLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't Have An Account ?"),
        TextButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => SignUp(),
              ),
            );
          },
          child: const Text(
            "Sign Up",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
