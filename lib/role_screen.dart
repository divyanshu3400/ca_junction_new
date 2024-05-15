import 'package:ca/core/router/routers.dart';
import 'package:ca/models/role_model.dart';
import 'package:ca/riverpod/role_dropdown_provider.dart';
import 'package:ca/riverpod/role_provider.dart';
import 'package:ca/utility/constants.dart';
import 'package:ca/utility/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'components/rounded_button.dart';

class RoleDropdownScreen extends ConsumerStatefulWidget {
  const RoleDropdownScreen({super.key});

  @override
  ConsumerState<RoleDropdownScreen> createState() => _RoleScreenState();
}

class _RoleScreenState extends ConsumerState<RoleDropdownScreen> {

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(roleStateProvider);
    final notifier = ref.watch(roleStateProvider.notifier);
    final rolesAsyncValue = ref.watch(rolesProvider);

    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            rolesAsyncValue.when(
              data: (roles) {
                return DropdownMenu<Role>(
                  width: 350,
                  label: const Text('Select Role'),
                  onSelected: (Role? value) {
                    setState(() {
                      notifier.selectedRole = value!;
                      notifier.validate();
                    });
                  },
                  dropdownMenuEntries:
                  roles.map<DropdownMenuEntry<Role>>((role) {
                    return DropdownMenuEntry<Role>(
                      value: role, // Use 'id' as value
                      label: role.role ?? '', // Use 'role' as label
                    );
                  }).toList(),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) => Center(child: Text('Error: $error')),
            ),
          ],
        ),
      ),

      persistentFooterButtons: [
        RoundedButton(
          colour: const Color.fromRGBO(16, 13, 64, 1),
          onPressed: () {
            context.pushReplacement('/${Routers.signIn}');
          },
          title: state.isDisabled ? 'Select Role' : 'Proceed',
          textColor: const Color.fromRGBO(255, 255, 255, 1),
        ),
      ],
    );
  }
}
