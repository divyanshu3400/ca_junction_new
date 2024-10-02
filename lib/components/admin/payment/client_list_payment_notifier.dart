part of 'client_list_payment_provider.dart';


class ClientPaymentNotifier extends Notifier<ClientPaymentState> {

  final formKey = GlobalKey<FormState>();
  StateModel? selectedState;

  final TextEditingController dateOfPayment = TextEditingController();
  final TextEditingController ReasonOfPayment = TextEditingController();
  final TextEditingController amountReceived = TextEditingController();
  final TextEditingController paymentMethod = TextEditingController();

  @override
  ClientPaymentState build() {
    return ClientPaymentState(isDisabled: true);
  }

  void _enableButton() {
    state = ClientPaymentState(isDisabled: false);
  }

  void _disableButton() {
    state = ClientPaymentState(isDisabled: true);
  }

  Future<void> validate() async {
    await Future.delayed(const Duration(milliseconds: 100));
    final isFormValid = formKey.currentState!.validate();
    await HapticFeedback.mediumImpact();

    if (isFormValid) {
      _enableButton();
    } else {
      _disableButton();
    }
  }
}
