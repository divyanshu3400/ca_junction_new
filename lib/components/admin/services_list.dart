import 'package:ca/models/registration_type_model.dart';
import 'package:ca/riverpod/registration_type_provider.dart';
import 'package:ca/theme/daytheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ServiceList extends ConsumerStatefulWidget {
  final RegistrationType? selectedRegType;
  final Function(RegistrationType) onServiceSelected;

  const ServiceList({
    Key? key,
    this.selectedRegType,
    required this.onServiceSelected,
  }) : super(key: key);

  @override
  ServiceListState createState() => ServiceListState();
}

class ServiceListState extends ConsumerState<ServiceList> {
  RegistrationType? selectedService;

  void selectService(RegistrationType registrationType) {
    setState(() {
      selectedService = registrationType;
    });
  }

  @override
  Widget build(BuildContext context) {
    final servicesListAsyncData = ref.watch(registrationTypeProvider);

    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: servicesListAsyncData.when(
          data: (services) {
            return services.map((service) => ServiceItem(
              title: service.type??'',
              isSelected: selectedService == service,
              onSelect: () {
                widget.onServiceSelected(service);
                selectService(service);
              },
            )).toList();
          },
          loading: () => [const CircularProgressIndicator()],
          error: (error, stackTrace) => [Text('Error: $error')],
        ),
      ),
    );
  }
}

class ServiceItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onSelect;

  const ServiceItem({super.key,
    required this.title,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelect,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(0),
          border: isSelected
              ? const Border(
                  bottom: BorderSide(color: AppColors.primaryColor, width: 4))
              : null,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isSelected
                  ? AppColors.primaryColor
                  : AppColors.mutedTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
