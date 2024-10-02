part of './client_list_payment_provider.dart';

class ClientPaymentState {
  ClientPaymentState({
    required this.isDisabled,
    this.isEmailValid,
  });

  final bool isDisabled;
  final String? isEmailValid;

  ClientPaymentState copyWith({
    bool? isDisabled,
    String? isEmailValid,
  }) {
    return ClientPaymentState(
      isDisabled: isDisabled ?? this.isDisabled,
      isEmailValid: isEmailValid ?? this.isEmailValid,
    );
  }
}