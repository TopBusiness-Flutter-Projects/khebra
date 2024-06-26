import 'package:flutter/material.dart';
import 'package:khebra/core/widgets/custom_bordered_container.dart';

import '../utils/custom_svg_icon.dart';
import '../utils/styles/app_colors.dart';
import '../utils/styles/app_fonts.dart';

class CustomDropDownMenu extends StatefulWidget {
  const CustomDropDownMenu(
      {super.key,
      this.items,
      required this.text,
      this.onChanged,
      this.dropdownValue});
  final List<DropdownMenuItem<String>>? items;
  final String text;
  final String? dropdownValue;

  final void Function(String?)? onChanged;

  @override
  State<CustomDropDownMenu> createState() => _CustomDropDownMenuState();
}

class _CustomDropDownMenuState extends State<CustomDropDownMenu> {
  //String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return CustomBorderedContainer(
        isDropDown: true,
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
           // icon: AppIcons.arrowDown,
            hint: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.text,
                  style: getRegularStyle(color: AppColors.primaryGrey),
                ),
                //AppIcons.arrowDown
              ],
            ),
            value: widget.dropdownValue,
            style: getRegularStyle(),
            onChanged: widget.onChanged,
            // onChanged: (String? value) {
            //   setState(() {
            //     widget.dropdownValue = value!;
            //     widget.  onPressed;
            //
            //     // cubit.setInterestId(dropdownValue!);
            //     //  print("dddd${cubit.checkInterestId}");
            //   });
            // },
            items: widget.items,
            // items: cubit.interestsModel!.data!
            //     .map(
            //       (e) => DropdownMenuItem<String>(
            //     value: e.id.toString(),
            //     child: Text(e.name!),
            // ),
            //)
            //    .toList(),
          ),
        ));
  }
}
