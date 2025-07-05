import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handly/features/checkout/logic/checkout_cubit.dart';
import 'package:handly/features/checkout/logic/expire_date_formatter.dart';
import 'package:handly/features/checkout/model/credit_card_info.dart';
import 'package:handly/generated/l10n.dart';

class CreditCardForm extends StatefulWidget {
  const CreditCardForm({super.key});

  @override
  State<CreditCardForm> createState() => _CreditCardFormState();
}

class _CreditCardFormState extends State<CreditCardForm> {
  final _formKey = GlobalKey<FormState>();
  final _cardNumberController = TextEditingController();
  final _expiryController = TextEditingController();
  final _cvvController = TextEditingController();
  final _holderNameController = TextEditingController();

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryController.dispose();
    _cvvController.dispose();
    _holderNameController.dispose();
    super.dispose();
  }

  void _onChanged() {
    final info = CreditCardInfo(
      cardNumber: _cardNumberController.text.trim(),
      expiryDate: _expiryController.text.trim(),
      cvv: _cvvController.text.trim(),
      holderName: _holderNameController.text.trim(),
    );
    context.read<CheckoutCubit>().updateCreditCardInfo(info);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      onChanged: _onChanged,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).credit_card_details,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),

          _buildTextField(
            S.of(context).cardholder_name,
            _holderNameController,
            icon: Icons.person_outline,
          ),
          _buildTextField(
            S.of(context).card_number,
            _cardNumberController,
            hint: "XXXX XXXX XXXX XXXX",
            icon: Icons.credit_card,
            keyboard: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(16),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: _buildTextField(
                  S.of(context).expiry_date,
                  _expiryController,
                  hint: "MM/YY",
                  icon: Icons.date_range,
                  keyboard: TextInputType.datetime,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(5),
                    ExpiryDateFormatter(),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildTextField(
                  S.of(context).cvv,
                  _cvvController,
                  hint: "123",
                  keyboard: TextInputType.number,
                  icon: Icons.lock_outline,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(3),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller, {
    String? hint,
    IconData? icon,
    TextInputType? keyboard,
    final List<TextInputFormatter>? inputFormatters,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboard,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        inputFormatters: inputFormatters,
        validator: (val) => (val == null || val.isEmpty) ? "Required" : null,
      ),
    );
  }
}
