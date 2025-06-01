import 'package:chat_app/core/utils/validators.dart';
import 'package:chat_app/features/auth/presentation/widgets/auth_input_field.dart';
import 'package:flutter/material.dart';

class NamesInputForm extends StatelessWidget {
  const NamesInputForm(
      {super.key,
      this.firstNameController,
      this.lastNameController,
      this.formKey});
  final TextEditingController? firstNameController;
  final TextEditingController? lastNameController;
  final GlobalKey<FormState>? formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          AuthInputField(
            keyBoardType: TextInputType.name,
            key: ValueKey('firstname'),
            validator: validateName,
            controller: firstNameController,
            hintText: 'Enter firstname',
          ),
          SizedBox(height: 15),
          AuthInputField(
            keyBoardType: TextInputType.name,
            key: ValueKey('lastname'),
            validator: validateName,
            controller: lastNameController,
            hintText: 'Enter lastname',
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
