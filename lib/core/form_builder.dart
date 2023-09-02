import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../theme/colors.dart';

enum FieldType {
  text,
  password,
  email,
  pincode,
  username,
  phoneNumber,
  number,
}

class AppInputTextField extends StatelessWidget {
  final String labelText;
  final FieldType fieldType;
  final int? minLength;
  final int? maxLength;

  AppInputTextField({
    Key? key,
    required this.labelText,
    required this.fieldType,
    this.minLength,
    this.maxLength,
  }) : super(key: key) {
    assert(
      fieldType != FieldType.password ||
          (minLength != null && maxLength != null),
    );

    assert(
      fieldType != FieldType.pincode ||
          (minLength != null && maxLength != null),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool obscureText =
        fieldType == FieldType.password || fieldType == FieldType.pincode;
    bool isEmail = fieldType == FieldType.email;
    bool isNumber = fieldType == FieldType.number;

    List<TextInputFormatter> inputFormatters = [];

    if (isNumber) {
      inputFormatters.add(FilteringTextInputFormatter.allow(RegExp(r'[0-9]')));
    }

    TextInputType keyboardType;

    if (isNumber) {
      keyboardType = TextInputType.number;
    } else {
      keyboardType = TextInputType.text;
    }

    return FormBuilderTextField(
      name: labelText,
      obscureText: obscureText,
      maxLength: maxLength,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(
          color: CustomColors.mediumGrey,
        ),
        filled: true,
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      style: const TextStyle(color: CustomColors.mediumGrey),
      validator: FormBuilderValidators.compose(
        [
          FormBuilderValidators.required(),
          if (minLength != null && obscureText)
            FormBuilderValidators.minLength(minLength!),
          if (maxLength != null) FormBuilderValidators.maxLength(maxLength!),
          if (!obscureText && isEmail) FormBuilderValidators.email(),
        ],
      ),
    );
  }
}
