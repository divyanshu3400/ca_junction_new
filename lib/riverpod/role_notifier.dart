part of 'role_dropdown_provider.dart';


class RoleNotifier extends Notifier<RoleState> {

  final formKey = GlobalKey<FormState>();
  Role? selectedRole;

  @override
  RoleState build() {
    return RoleState(isDisabled: true);
  }

  void _enableButton() {
    state = RoleState(isDisabled: false);
  }

  void _disableButton() {
    state = RoleState(isDisabled: true);
  }


  void onDropdownValueChanged(Role? value) {
    selectedRole = value;
    validateDropdown();
  }

  void validateDropdown() {
    if (selectedRole == null) {
      state = state.copyWith(dropdownError: 'Please select a value from the dropdown.');
    } else {
      state = state.copyWith(dropdownError: null);
    }
    validateForm();
  }

  // Method to validate the overall form
  bool validateForm() {
    return formKey.currentState!.validate();
  }

  Future<void> validate() async {
    await Future.delayed(const Duration(milliseconds: 100));
    final isFormValid = formKey.currentState?.validate();
    await HapticFeedback.mediumImpact();

    if (state.dropdownError == null && isFormValid!) {
      _enableButton();
    } else {
      _disableButton();
    }
  }
}
