import 'package:flutter/material.dart';
import 'package:toba2/Features/azkar/presentation/models/one_zkr_model.dart';
import 'package:toba2/Features/azkar/presentation/views/widgets/zkr.dart';

class zkrPageViewBody extends StatefulWidget {
  const zkrPageViewBody({
    super.key,
    required this.snapshot,
  });
  final AsyncSnapshot<List<OneZkrModel>> snapshot;

  @override
  State<zkrPageViewBody> createState() => _zkrPageViewBodyState();
}

class _zkrPageViewBodyState extends State<zkrPageViewBody> {
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe3e3c6),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff755033),
        title: Text(
          'الاذكار',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: PageView.builder(
          reverse: true,
          controller: pageController,
          itemCount: widget.snapshot.data!.length,
          itemBuilder: (context, index) {
            return Zkr(
              oneZkrModel: widget.snapshot.data![index],
              pageController: pageController,
            );
          }),
    );
  }
}
