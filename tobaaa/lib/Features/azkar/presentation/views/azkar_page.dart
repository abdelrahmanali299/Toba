import 'package:flutter/material.dart';
import 'package:toba2/Features/azkar/presentation/views/widgets/azkar_page_body.dart';

class AzkarPage extends StatelessWidget {
  const AzkarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe3e3c6),
      body: AzkarPageBody(),
    );
  }
}
