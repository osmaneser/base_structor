import 'package:base_structor/core/auth/auth_view_model.dart';
import 'package:base_structor/core/widgets/oe_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/oe_text_form_field.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final vModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            getBrandLogo(),
            getSignInForm(),
            getFooterArea(),
          ],
        ),
      ),
    );
  }

  Widget getBrandLogo() {
    return Image.asset("assets/images/logo.png", height: 100);
  }

  Widget getSignInForm() {
    TextEditingController ctrlName = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          OeTextFormField(
            validator: (v) {},
            controller: ctrlName,
            labelText: "Kullanıcı Adı",
            hintText: "Kullanıcı adı, telefon veya e posta",
            keyboardType: TextInputType.name,
            onTap: () {},
          ),
          OeTextFormField(
            validator: (v) {},
            controller: ctrlName,
            labelText: "Şifre",
            hintText: "****",
            keyboardType: TextInputType.name,
            onTap: () {},
          ),
          OeButton(onTap: (){}, text: "Giriş")
        ],
      ),
    );
  }

  Widget getFooterArea() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text("Osman ESER"),
    );
  }
}
