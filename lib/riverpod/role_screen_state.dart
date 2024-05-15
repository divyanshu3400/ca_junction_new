part of './role_dropdown_provider.dart';

class RoleState {
  RoleState({
    required this.isDisabled,
    this.selectedRole,
    this.selectedRoleValue,
    this.dropdownError,
  });

  final bool isDisabled;
  final Role? selectedRole;
  final String? selectedRoleValue;
  final String? dropdownError;

  RoleState copyWith({
    bool? isDisabled,
    String? selectedRoleValue,
    String? dropdownError,
  }) {
    return RoleState(
      isDisabled: isDisabled ?? this.isDisabled,
      selectedRoleValue: selectedRoleValue ?? this.selectedRoleValue,
      dropdownError: dropdownError ?? this.dropdownError,
    );
  }
}
