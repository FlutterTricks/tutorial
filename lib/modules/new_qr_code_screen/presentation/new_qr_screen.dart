import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upi_quick_qr/core/extensions/extensions.dart';
import 'package:upi_quick_qr/core/widgets/custom_text_form_field.dart';
import 'package:upi_quick_qr/modules/home_screen/presentation/cubit/home_screen_cubit.dart';
import 'package:upi_quick_qr/modules/qr_code_screen/presentation/qr_code_screen.dart';

class NewQrScreen extends StatefulWidget {
  const NewQrScreen({
    super.key,
    this.name,
    this.upiId,
    this.amount,
  });
  final String? name;
  final String? upiId;
  final double? amount;

  @override
  State<NewQrScreen> createState() => _NewQrScreenState();
}

class _NewQrScreenState extends State<NewQrScreen> {
  final RegExp upiRegex = RegExp(r"[a-zA-Z0-9.\-_]{2,256}@[a-zA-Z]{2,64}");

  late TextEditingController amount;
  late TextEditingController name;
  late TextEditingController upiId;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    amount = TextEditingController();
    name = TextEditingController();
    upiId = TextEditingController();
    amount.text = (widget.amount ?? "").toString();
    name.text = widget.name ?? "";
    upiId.text = widget.upiId ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeScreenCubit, HomeScreenState>(
      listener: (context, state) {
        if (state.index == 1) {
          upiId.text = state.upiId ?? "";
          name.text = state.name ?? "";
          amount.text = (state.amount ?? "").toString();
        }
      },
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                controller: upiId,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (!upiRegex.hasMatch(value ?? "")) {
                    return 'Invalid UPI ID';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Enter UPI ID *',
                  prefixIcon: const Icon(
                    Icons.alternate_email,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () async {
                      context.read<HomeScreenCubit>().setIndex(0);
                    },
                    icon: const Icon(Icons.qr_code_scanner),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                controller: name,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Name (optional)',
                  prefixIcon: Icon(
                    Icons.person,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              CustomTextFormField(
                controller: amount,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'[0-9]'),
                  ),
                ],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Amount (optional)',
                  prefixIcon: Icon(
                    IconData(0x20B9, fontFamily: 'MaterialIcons'),
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(20),
                  ),
                  child: const Icon(
                    Icons.arrow_forward,
                    weight: 10,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context
                          .read<HomeScreenCubit>()
                          .setData(upiId.text, name.text, amount.text);
                      context.push(
                        QrCodeScreen(
                          name: name.text,
                          upiId: upiId.text,
                          amount: double.tryParse(amount.text) ?? 0,
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
