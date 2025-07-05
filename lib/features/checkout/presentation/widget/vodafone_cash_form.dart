import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handly/features/checkout/logic/checkout_cubit.dart';
import 'package:handly/features/checkout/model/vodafone_cash_info.dart';

class VodafoneCashForm extends StatefulWidget {

  const VodafoneCashForm({super.key});

  @override
  State<VodafoneCashForm> createState() => _VodafoneCashFormState();
}

class _VodafoneCashFormState extends State<VodafoneCashForm> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();

@override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _onChanged() {
    if (_formKey.currentState?.validate() ?? false) {
      final info = VodafoneCashInfo(phoneNumber: _phoneController.text.trim());
      context.read<CheckoutCubit>().updateVodafoneCashInfo(info);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      onChanged: _onChanged,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Vodafone Cash", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          TextFormField(
            controller: _phoneController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: "Vodafone Number",
              hintText: "010XXXXXXXX",
              prefixIcon: const Icon(Icons.phone_android),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
            validator: (val) {
              if (val == null || val.isEmpty) return "Required";
              if (!RegExp(r"^01[0-2,5]{1}[0-9]{8}$").hasMatch(val)) return "Invalid number";
              return null;
            },
          ),
        ],
      ),
    );
  }
}
