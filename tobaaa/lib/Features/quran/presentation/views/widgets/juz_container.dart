import 'package:flutter/material.dart';

class JuzContainer extends StatelessWidget {
  const JuzContainer(
      {super.key,
      this.juzName,
      required this.startPage,
      this.ontap,
      this.juzNumber});
  final juzName;
  final juzNumber;
  final int startPage;
  final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          alignment: Alignment.centerRight,
          decoration: BoxDecoration(
            color: Color(0xffe3e3c6),
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      juzName,
                      style: TextStyle(fontSize: 24),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '$juzNumber',
                    ),
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: Text(
                      'صفحة' + ' ' + '${startPage}',
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
