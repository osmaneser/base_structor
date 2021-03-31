import 'package:base_structor/core/auth/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final vModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      body: Center(
        child: Text("data"),
      ),
    );
  }
}
