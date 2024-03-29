import 'package:flutter/material.dart';
import 'package:hosy/core/const/colors.dart';
import 'package:hosy/core/const/path_constants.dart';

class SettingsTextField extends StatefulWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String placeHolder;

  const SettingsTextField(
      {super.key,
      required this.controller,
      this.obscureText = false,
      required this.placeHolder});

  @override
  State<SettingsTextField> createState() => _SettingsTextFieldState();
}

class _SettingsTextFieldState extends State<SettingsTextField> {
  final focusNode = FocusNode();
  bool stateObscureText = false;

  @override
  void initState() {
    super.initState();
    stateObscureText = widget.obscureText;
  }

  @override
  void didUpdateWidget(covariant SettingsTextField oldWidget) {
    super.didUpdateWidget(oldWidget);

    stateObscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _createSettingsTextField(),
          if (widget.obscureText) ...[
            Positioned(
              right: 0,
              bottom: 0,
              top: 0,
              child: _createShowEye(),
            )
          ]
        ],
      ),
    );
  }

  Widget _createSettingsTextField() {
    return TextField(
      focusNode: focusNode,
      controller: widget.controller,
      obscureText: stateObscureText,
      style: const TextStyle(fontWeight: FontWeight.w600),
      decoration: InputDecoration(
          hintText: widget.placeHolder,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 18,
          ),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none),
    );
  }

  Widget _createShowEye() {
    return GestureDetector(
      onTap: () {
        setState(() {
          stateObscureText = !stateObscureText;
        });
      },
      child: Image(
        image: const AssetImage(
          PathConstants.eye,
        ),
        color: widget.controller.text.isNotEmpty ? AppColors.buttonColor : Colors.grey,
      ),
    );
  }
}