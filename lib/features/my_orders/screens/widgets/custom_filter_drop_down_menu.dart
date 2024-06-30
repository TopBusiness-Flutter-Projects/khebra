import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khebra/core/utils/styles/app_colors.dart';
import 'package:khebra/core/utils/styles/app_fonts.dart';
import 'package:khebra/core/widgets/custom_bordered_container.dart';

class CustomFilterDropDownMenu extends StatefulWidget {
  const CustomFilterDropDownMenu(
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
  State<CustomFilterDropDownMenu> createState() =>
      _CustomFilterDropDownMenuState();
}

class _CustomFilterDropDownMenuState extends State<CustomFilterDropDownMenu> {
  //String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width / 2,
        margin: EdgeInsets.symmetric(vertical: 10.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              blurRadius: 5,
              offset: Offset(0, 2), // Shadow position
            )
          ],
        ),
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: DropdownButtonHideUnderline(
                child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                icon: Icon(Icons.keyboard_arrow_down_rounded),
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
                items: widget.items,
              ),
            ))));
  }
}
