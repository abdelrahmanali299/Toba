import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({super.key, required this.onChanged});
  final ValueChanged<int> onChanged;
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        maxLength: 5,
        cursorRadius: Radius.circular(10),
        cursorErrorColor: Colors.white,
        // cursorWidth: 3,
        cursorColor: Colors.white,
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value == null || value.isEmpty)
            return 'من فضلك ادخل عدد التسبيحات';
          return null;
        },
        onSaved: (value) {
          count = int.tryParse(value ?? "") ?? 0;
          widget.onChanged(count);
        },
        // textDirection: TextDirection.rtl,
        // textAlign: TextAlign.r,
        style: TextStyle(color: Colors.white, fontSize: 30),
        decoration: InputDecoration(
          label: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 10),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'عدد التسبيحات',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color(0xffe3e3c6)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color(0xffe3e3c6)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color(0xffe3e3c6)),
          ),
          contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 11),
        ),
      ),
    );
  }
}
