import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/layout/cubit/cubit.dart';
import 'package:payment/layout/ref%20code%20screen.dart';
import 'package:payment/layout/visa%20screen.dart';
import '../componets/components.dart';
import '../componets/constants.dart';
import 'cubit/states.dart';

class ToggleScreen extends StatelessWidget {
  const ToggleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubit(),
      child: BlocConsumer<PaymentCubit, PaymentStates>(
        listener: (context, state) {
          if (state is PaymentGetRefCodeSuccessState) {
            showToast(
              text: 'Reference Code Generated',
              state: ToastStates.SUCCESS,
            );
            navigateTo(context, const RefCodeScreen());
          } else {
            showToast(
              text: 'Error:',
              state: ToastStates.ERROR,
            );
          }
        },
        builder: (context, state) {
          var cubit = PaymentCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.purple,
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        cubit.getRefCode();
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.network(AppImages.refCodeImage),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        navigateTo(context, const VisaScreen());
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.network(AppImages.visaImage),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
