part of './add_client_provider.dart';

class AddClientState {

  AddClientState({
    required this.isDisabled,
    this.nameOfFirm,
    this.selectedState,
    this.selectedCountry,
    this.selectedDistrict,
    this.dropdownError,
    this.email,
    this.nameOfAuthorizedPerson,
    this.dob
  });

  final bool isDisabled;
  final String? nameOfFirm;
  final String? nameOfAuthorizedPerson;
  final String? dob;
  final String? email;
  final String? dropdownError;
  final StateModel? selectedState;
  final CountryModel? selectedCountry;
  final DistrictModel? selectedDistrict;

  AddClientState copyWith({
    bool? isDisabled,
    String? selectedRoleValue,
    String? dropdownError,
  }) {
    return AddClientState(
      isDisabled: isDisabled ?? this.isDisabled,
      selectedDistrict: selectedDistrict ?? this.selectedDistrict,
      selectedState: selectedState ?? this.selectedState,
      selectedCountry: selectedCountry ?? this.selectedCountry,
      dropdownError: dropdownError ?? this.dropdownError,
    );
  }
}
