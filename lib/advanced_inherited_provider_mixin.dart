import 'package:flutter/material.dart';
import 'package:inherited_widget/advanced_inherited.dart';
import 'package:inherited_widget/empty_user_model.dart';

mixin AdvancedInheritedProviderMixin on State<AdvancedInheritedProvider> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> formValidateNotifier = ValueNotifier<bool>(false);

  EmptySampleUserRequest get userRequest => EmptySampleUserRequest(
        email: emailController.text,
        password: passwordController.text,
        userName: userNameController.text,
      );

  void onTapOutside() {
    /// show dialog
    /// all check form controller ...
  }

  void updateRandomEmail() {
    emailController.text = 'random@gmail.com';
  }

  void checkFormValidate() {
    formValidateNotifier.value = formKey.currentState?.validate() ?? false;
  }

  @override
  void initState() {
    super.initState();

    userNameController.text = widget.user?.userName ?? '';
  }
}
