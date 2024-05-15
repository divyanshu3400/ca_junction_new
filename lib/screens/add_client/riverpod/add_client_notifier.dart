part of 'add_client_provider.dart';

class AddClientNotifier extends Notifier<AddClientState> {
  final formKey = GlobalKey<FormState>();

  CountryModel? selectedCountry;
  StateModel? selectedState;
  DistrictModel? selectedDistrict;
  String? phoneNumber;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameOfFirmController = TextEditingController();
  final TextEditingController nameOfPersonController = TextEditingController();
  final TextEditingController gstNumberController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController pinCodeController = TextEditingController();

  @override
  AddClientState build() {
    return AddClientState(isDisabled: true);
  }

  void _enableButton() {
    state = AddClientState(isDisabled: false);
  }

  void _disableButton() {
    state = AddClientState(isDisabled: true);
  }

  void onCountryChanged(CountryModel? value) {
    selectedCountry = value;
    validateDropdown(value);
  }
  void onStateChanged(StateModel? value) {
    selectedState = value;
    validateDropdown(value);
  }
  void onDistrictChanged(DistrictModel? value) {
    selectedDistrict = value;
    validateDropdown(value);
  }

  void validateDropdown(dynamic value) {
    if (value == null) {
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

  Future<bool> validate() async {
    await Future.delayed(const Duration(milliseconds: 100));
    final isFormValid = formKey.currentState!.validate();
    await HapticFeedback.mediumImpact();

    if (state.dropdownError == null && isFormValid) {
      _enableButton();
      return true;
    } else {
      _disableButton();
      return false;
    }
  }
}
