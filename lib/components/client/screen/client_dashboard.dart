import 'package:ca/components/client/riverpod/client_provider.dart';
import 'package:ca/riverpod/registration_type_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utility/ui_utils.dart';

class ClientDashboardScreen extends ConsumerStatefulWidget {
  const ClientDashboardScreen({super.key});

  @override
  ConsumerState<ClientDashboardScreen> createState() =>
      _ClientDashboardScreenState();
}

class _ClientDashboardScreenState extends ConsumerState<ClientDashboardScreen> {
  @override
  void initState() {
    super.initState();
    requestNotificationPermission(context);
  }

  int profileCompletionPercentage = 88;

  @override
  Widget build(BuildContext context) {
    final userAsyncData = ref.watch(clientDataProvider);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('My Profile', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            onPressed: () {
              // Handle add button press
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
            onPressed: () {
              // Handle add button press
            },
          ),
        ],
        toolbarHeight: 80.0,
      ),
      body: Container(
        color: Colors.black12.withOpacity(0.1),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      color: Colors.white70,
                    ),
                    width: double.infinity,
                    child: userAsyncData.when(
                      data: (data) {
                        return Column(
                          children: [
                            ProfileWidget(
                              profileCompletionPercentage:
                                  profileCompletionPercentage,
                            ),
                            Text(
                              '${data?.firstName} ${data?.lastName}',
                              style: const TextStyle(
                                  fontSize: 25, color: Colors.black),
                            ),
                            Text(
                              data?.getClientData()?.nameOfFirm ?? "",
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.black),
                            ),
                            // const GridCheckbox(),
                          ],
                        );
                      },
                      loading: () {
                        return const Center(
                            child:
                                CircularProgressIndicator()); // You can replace this with your custom loader widget
                      },
                      error: (error, stackTrace) {
                        return Text(
                            'Error: $error'); // You can replace this with your custom error handling UI
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'My Folders',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 14.h,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    gridWithIcon('Downloaded Data', 'Income Tax, FSSAI', true),
                    gridWithIcon('Uploaded Data', 'FSSAI, MSSM', false),
                  ],
                ),
                const SizedBox(height: 10),
                const GridB(),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Recent Uploads',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return const Card(
                      color: Colors.white,
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 50,
                        ),
                        title: Text(
                          'GST FY 2022-23',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          'November 2023',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        trailing: Text('300 kb'),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget gridWithIcon(String title, String subtitle, bool flag) {
  return Container(
    width: 130.h,
    height: 100.h,
    padding: EdgeInsets.all(5.h),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.h),
      color: flag
          ? const Color.fromARGB(75, 3, 168, 244).withOpacity(0.1)
          : const Color.fromARGB(124, 255, 235, 59).withOpacity(0.3),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.h),
            topRight: Radius.circular(16.h),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(
                      image: flag
                          ? const AssetImage('assets/images/b-folder.png')
                          : const AssetImage('assets/images/y-folder.png')),
                  Icon(
                    Icons.more_vert,
                    color: flag ? Colors.blue : Colors.orange,
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                title,
                style: TextStyle(
                  color: flag ? Colors.blue : Colors.orange,
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                subtitle,
                style: TextStyle(
                  color: flag ? Colors.blue : Colors.orange,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class GridB extends StatefulWidget {
  const GridB({Key? key}) : super(key: key);

  @override
  State<GridB> createState() => _GridBState();
}

class _GridBState extends State<GridB> {
  final List<Map<String, dynamic>> gridMap = [
    {
      "title": "Assign Tasks to Admin",
    },
    {
      "title": "Tasks By Admin",
    },
    {
      "title": "Pay Your Admin",
    },
    {
      "title": "Payment Ledger",
    },
  ];
  final List<Color> colors = [
    const Color.fromARGB(255, 172, 64, 64),
    const Color.fromRGBO(35, 176, 176, 1.0),
    const Color.fromRGBO(60, 56, 255, 1.0),
    const Color.fromRGBO(143, 192, 80, 1.0),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        mainAxisExtent: 100,
      ),
      itemCount: gridMap.length,
      itemBuilder: (_, index) {
        final backgroundColor = colors[index % colors.length].withOpacity(0.2);
        final textColor = colors[index % colors.length];

        return Container(
          width: 148,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: backgroundColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${gridMap.elementAt(index)['title']}",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium!.merge(
                            TextStyle(
                              fontWeight: FontWeight.w700,
                              color: textColor,
                            ),
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class GridCheckbox extends ConsumerStatefulWidget {
  const GridCheckbox({Key? key}) : super(key: key);

  @override
  ConsumerState<GridCheckbox> createState() => _GridCheckboxState();
}

class _GridCheckboxState extends ConsumerState<GridCheckbox> {
  @override
  Widget build(BuildContext context) {
    final registrationType = ref.watch(registrationTypeProvider);
    return registrationType.when(
      data: (types) {
        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of checkboxes per row
            crossAxisSpacing: 2.0, // Spacing between checkboxes horizontally
            mainAxisSpacing: 0.0, // Spacing between checkboxes vertically
          ),
          itemCount: types.length,
          itemBuilder: (context, index) {
            final registrationType = types[index];
            return CheckboxListTile(
              title: Text(registrationType.type ?? ''),
              // Assuming type is a property of RegistrationType
              value: false,
              // Assuming isSelected is a property of RegistrationType
              onChanged: (newValue) {
                // Add your logic to handle checkbox state change
                // For example, you can update the isSelected property of the RegistrationType
              },
            );
          },
        );
      },
      loading: () {
        return const CircularProgressIndicator(); // You can replace this with your custom loader widget
      },
      error: (error, stackTrace) {
        return Text(
            'Error: $error'); // You can replace this with your custom error handling UI
      },
    );
  }
}

class ProfileWidget extends StatelessWidget {
  final int profileCompletionPercentage;

  const ProfileWidget({super.key, required this.profileCompletionPercentage});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 90.h,
                      height: 90.h,
                      child: CircularProgressIndicator(
                        value: profileCompletionPercentage / 100,
                        strokeWidth: 8.0,
                        backgroundColor: Colors.grey[300],
                        valueColor: AlwaysStoppedAnimation<Color>(
                          profileCompletionPercentage >= 100
                              ? const Color(0XFF2FA811)
                              : const Color(0XFF2FA811),
                        ),
                      ),
                    ),
                    Container(
                      width: 90, // Desired width of the image
                      height: 90, // Desired height of the image
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle, // Make the image circular
                        image: DecorationImage(
                          image: AssetImage('assets/images/Profile Image.png'),
                          fit: BoxFit
                              .cover, // Ensure the image covers the container
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 10.h,
                right: 0,
                child: Container(
                  height: 20.h,
                  width: 40.h,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  child: const Center(
                    child: Text(
                      '#562',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
