import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toba2/Features/tasbeeh/presentation/manager/cubits/tasbeeh_cubit/TasbeehCubit.dart';
import 'package:toba2/Features/tasbeeh/presentation/manager/cubits/tasbeeh_cubit/TasbeehStates.dart';
import 'package:toba2/Features/tasbeeh/presentation/views/widgets/CircleTasbeeh.dart';
import 'package:toba2/Features/tasbeeh/presentation/views/widgets/CustomButton.dart';
import 'package:toba2/Features/tasbeeh/presentation/views/widgets/ListView_Tasbeeh_Items.dart';
import 'package:toba2/Features/tasbeeh/presentation/views/widgets/custom_text_form_field.dart';

class Tsbeehpage extends StatefulWidget {
  const Tsbeehpage({super.key});

  @override
  State<Tsbeehpage> createState() => _TsbeehpageState();
}

class _TsbeehpageState extends State<Tsbeehpage> {
  int count = 0;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff755033),
        centerTitle: true,
        title: Text(
          'تسبيح',
          style: TextStyle(fontSize: 32, color: Colors.white),
        ),
      ),
      backgroundColor: Color(0xff1c1d22),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 50,
                  child: ListTasbeehItems(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 10),
                  child: CustomTextFormField(
                    onChanged: (value) {
                      count = value;
                      setState(() {});
                    },
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                BlocConsumer<Tasbeehcubit, Tasbeehstates>(
                    listener: (context, state) {
                  if (state is TasbeehIncreament) {
                    BlocProvider.of<Tasbeehcubit>(context).zkrCount++;
                  } else if (state is TasbeehReset) {
                    BlocProvider.of<Tasbeehcubit>(context).zkrCount = 0;
                  }
                }, builder: (context, state) {
                  return GestureDetector(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        if (BlocProvider.of<Tasbeehcubit>(context).zkrCount ==
                            count) {
                          BlocProvider.of<Tasbeehcubit>(context).zkrReset();
                        } else {
                          BlocProvider.of<Tasbeehcubit>(context)
                              .zkrIncreament();
                        }
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                    child: Circletasbeeh(
                      count: count,
                    ),
                  );
                }),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * .2),
                  child: Custombutton(
                    onPressed: () {
                      BlocProvider.of<Tasbeehcubit>(context).zkrReset();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
