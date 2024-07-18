import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:khebra/core/utils/assets_manager.dart';

class DatePickerFormField extends StatefulWidget {
  DatePickerFormField({super.key,required this.text});

  @override
  _DatePickerFormFieldState createState() => _DatePickerFormFieldState();
  String ?text;
}

class _DatePickerFormFieldState extends State<DatePickerFormField> {
  // Define the controller here
  late TextEditingController dateController;

  @override
  void initState() {
    super.initState();
    // Initialize the controller in initState
    dateController = TextEditingController();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is removed
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: dateController,
      decoration: InputDecoration(
        labelText: 'تاريخ الميلاد',
        hintText: widget.text.toString().tr(),
        suffixIcon: Image.asset(AppImages.calender),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      readOnly: true,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );
        if (pickedDate != null) {
          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
          setState(() {
            dateController.text = formattedDate;
          });
        }
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'الرجاء إدخال تاريخ الميلاد';
        }
        return null;
      },
    );
  }
}