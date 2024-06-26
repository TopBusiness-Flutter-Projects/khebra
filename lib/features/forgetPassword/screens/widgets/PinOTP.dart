import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khebra/core/utils/styles/app_colors.dart';
import 'package:khebra/core/utils/styles/app_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinOTP extends StatefulWidget {
  const PinOTP({
    super.key,
    required this.textEditingController,
  });
  final TextEditingController textEditingController;

  @override
  State<PinOTP> createState() => _PinOTPState();
}

class _PinOTPState extends State<PinOTP> {
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    //errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    // errorController!.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
        child: PinCodeTextField(
          autoFocus: true,

          appContext: context,
          pastedTextStyle: getBoldStyle(),
          length: 6,
          backgroundColor: Colors.transparent,

          // obscureText: true,
          obscuringCharacter: '*',

          blinkWhenObscuring: false,
          animationType: AnimationType.fade,
          //validator: (value) => value!.isEmpty ? '' : null,
          pinTheme: PinTheme(

            
              activeColor: AppColors.grey3,
              activeFillColor: AppColors.white,
              inactiveColor: AppColors.grey3,
              inactiveFillColor: AppColors.white,
              selectedColor: AppColors.grey3,
              selectedFillColor: AppColors.white),
          cursorColor: Colors.black,
          textStyle: getBoldStyle(fontSize: 18),
          animationDuration: const Duration(milliseconds: 300),
          enableActiveFill: true,
          //  errorAnimationController: errorController,
          controller: widget.textEditingController,
          keyboardType: TextInputType.number,
          // boxShadows: const [
          //   BoxShadow(
          //     offset: Offset(0, 1),
          //     color: Colors.black12,
          //     blurRadius: 10,
          //   )
          // ],
          onCompleted: (v) {
            debugPrint("Completed");
          },
          // onTap: () {
          //   print("Pressed");
          // },
          onChanged: (value) {
            debugPrint(value);
            setState(() {
              currentText = value;
            });
          },
          beforeTextPaste: (text) {
            debugPrint("Allowing to paste $text");
            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
            //but you can show anything you want here, like your pop up saying wrong paste format or etc
            return true;
          },
        ));
  }
}
