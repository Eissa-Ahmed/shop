import 'package:flutter/material.dart';
import 'package:shop_app_2022/constant/shared.dart';

import '../View/screens/user/login.dart';

void signOut(BuildContext context) {
  CachHelper.sharedPreferences.remove("token");
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (_) => LogIn(),
    ),
  );
}
