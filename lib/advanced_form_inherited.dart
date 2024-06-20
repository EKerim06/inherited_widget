import 'package:flutter/material.dart';
import 'package:inherited_widget/advanced_inherited.dart';
import 'package:inherited_widget/general_func.dart';

class AdvancedFormInherited extends StatefulWidget {
  const AdvancedFormInherited({super.key});
  @override
  State<AdvancedFormInherited> createState() => _AdvancedFormInheritedState();
}

class _AdvancedFormInheritedState extends State<AdvancedFormInherited> {
  @override
  Widget build(BuildContext context) {
    final currentState = AdvancedInherited.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: currentState.formKey,
        onChanged: currentState.checkFormValidate,
        child: const Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              _UserNameRow(),
              _RandomButtonRow(),
              _PasswordRow(),
              _OnCompleteButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _OnCompleteButton extends StatelessWidget {
  const _OnCompleteButton();

  @override
  Widget build(BuildContext context) {
    final currentState = AdvancedInherited.of(context);
    return ValueListenableBuilder(
      valueListenable: currentState.formValidateNotifier,
      builder: (context, value, child) {
        return ElevatedButton(
          onPressed: !value ? null : () => print(currentState.userRequest),
          child: const Text('On Complete'),
        );
      },
    );
  }
}

class _UserNameRow extends StatelessWidget {
  const _UserNameRow();

  @override
  Widget build(BuildContext context) {
    final currentState = AdvancedInherited.of(context);

    return Column(
      children: [
        TextFormField(
          controller: currentState.userNameController,
          validator: (String? value) => value?.isEmpty ?? true ? 'Empty' : null,
          decoration: const InputDecoration(
            labelText: 'User Name',
          ),
        ),
        TextButton(
          onPressed: () =>
              AppGeneralFunction.fieldClear(currentState.userNameController),
          child: const Text('Make a default'),
        ),
      ],
    );
  }
}

class _RandomButtonRow extends StatelessWidget {
  const _RandomButtonRow();

  @override
  Widget build(BuildContext context) {
    final currentState = AdvancedInherited.of(context);
    return Row(
      children: [
        const _RandomEmailButton(),
        Expanded(
          child: TextFormField(
            validator: (String? value) =>
                value?.isEmpty ?? true ? 'Empty' : null,
            controller: currentState.emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
          ),
        ),
      ],
    );
  }
}

class _RandomEmailButton extends StatelessWidget {
  const _RandomEmailButton();

  @override
  Widget build(BuildContext context) {
    final currentState = AdvancedInherited.of(context);
    return IconButton(
      onPressed: currentState.updateRandomEmail,
      icon: const Text('Random'),
    );
  }
}

class _PasswordRow extends StatelessWidget {
  const _PasswordRow();

  @override
  Widget build(BuildContext context) {
    final currentState = AdvancedInherited.of(context);

    return Row(
      children: [
        Expanded(
          child: TextFormField(
            onTapOutside: (event) => currentState.onTapOutside,
            validator: (String? value) =>
                value?.isEmpty ?? true ? 'Empty' : null,
            controller: currentState.passwordController,
            decoration: const InputDecoration(
              labelText: 'Password',
            ),
          ),
        ),
        _PasswordClear(),
      ],
    );
  }
}

class _PasswordClear extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () =>
          AppGeneralFunction.fieldClear(AdvancedInherited.of(context).passwordController),
      child: const Text('Clear password'),
    );
  }
}
