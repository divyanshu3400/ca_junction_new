import 'package:ca/theme/daytheme.dart';
import 'package:flutter/material.dart';


class RoundedButton2 extends StatelessWidget {

  const RoundedButton2({super.key,
    required this.colour,
    required this.onPressed,
    required this.title,
    this.border,
    required this.textColor,
  });

  final Color colour;
  final Function onPressed;
  final String title;
  final Color? border;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        onPressed();
      },
      minWidth: double.infinity,
      height: 56.0,
      color: colour,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(
          color: border ??
              Colors.transparent, // Use default color if border is null
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontFamily: "Poppins",
          fontWeight: FontWeight.w600,
          fontSize: 16.0,
          color: textColor,
        ),
      ),
    );
  }
}

class AddTaskScreen extends StatefulWidget {
  static const String id = 'add_task';

  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor:Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding:const EdgeInsets.only(left: 15.0),
          child: IconButton(
            color: AppColors.primaryColor,
            icon:const Icon(Icons.arrow_back_ios),
            onPressed: () {
              // Add your back button functionality here
            },
          ),
        ),
        title: Text('Add Task',
            style:const TextStyle(color: AppColors.primaryColor)),
        centerTitle: true,
        toolbarHeight: 80.0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0), // Adjust the height as needed
          child: Divider(
            thickness: 6.0,
            color: Color.fromRGBO(250, 246, 246, 1),
          ), // Change the color as needed
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        padding:const EdgeInsets.all(16.0),
        children: [
          TextFormField(
            cursorColor: AppColors.mutedTextColor,
            decoration: InputDecoration(
              labelText: 'Name of Client',
              labelStyle:const TextStyle(
                color: Color.fromRGBO(2, 6, 20, 1),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:const BorderSide(
                    color: Color.fromRGBO(15, 13, 35, 1), width: 1.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            cursorColor: AppColors.mutedTextColor,
            decoration: InputDecoration(
              labelText: 'Date of Task',
              labelStyle:const TextStyle(
                color: Color.fromRGBO(2, 6, 20, 1),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:const BorderSide(
                    color: Color.fromRGBO(15, 13, 35, 1), width: 1.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              suffixIcon: Image.asset('assets/images/Calendar.png'),
            ),
          ),
          const Divider(
            thickness: 6.0,
            color: Color.fromRGBO(250, 246, 246, 1),
          ),
          const SizedBox(height: 16.0),
          const Text('Select work related to'),
          const GridB(),
          const Divider(
            thickness: 6.0,
            color: Color.fromRGBO(250, 246, 246, 1),
          ),
          const Text('Description of work'),
          Stack(
            // alignment: Alignment.center,
            children: [
              // Box shaped image
              SizedBox(
                // color: Colors.red,
                width: 200, // Adjust width as needed
                height: 150, // Adjust height as needed
                child: Image.asset(
                  'assets/images/addTaskBox.png', // Path to your image asset
                  fit: BoxFit.contain, // Adjust the fit as needed
                ),
              ),
              // Title text
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Image.asset(
                      //   'assets/images/Vector (1).png',
                      //   width: 15.0,
                      //   height: 15.0,
                      // ),
                      SizedBox(
                        width: 4.0,
                      ),
                      Icon(
                        Icons.add,
                        size: 30.0,
                      ),
                      SizedBox(
                        width: 2.0,
                      ),
                      Text(
                        "Upload image/pdf",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontFamily: 'Poppins', // Adjust font size as needed
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Divider(),
          // DropDownWidget(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Color.fromARGB(255, 255, 255, 255),
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: RoundedButton2(
            colour: const Color.fromRGBO(255, 255, 255, 1),
            onPressed: () {
              // Navigator.of(context).pushNamed("phone_number");
              Navigator.pop(context);
            },
            title: 'Next',
            border: Color.fromRGBO(16, 13, 64, 1),
            textColor: Color.fromRGBO(16, 13, 64, 1),
          ),
        ),
      ),
    );
  }
}

class GridB extends StatefulWidget {
  const GridB({Key? key}) : super(key: key);

  @override
  State<GridB> createState() => _GridBState();
}

class _GridBState extends State<GridB> {
  List<Map<String, dynamic>> gridMap = [
    {
      'checkbox': Checkbox(
        value: false,
        onChanged: (value) {},
      ),
      "title": "GST",
    },
    {
      'checkbox': Checkbox(
        value: false,
        onChanged: (value) {},
      ),
      "title": "Income Tax",
    },
    {
      'checkbox': Checkbox(
        value: false,
        onChanged: (value) {},
      ),
      "title": "FSSAI",
    },
    {
      'checkbox': Checkbox(
        value: false,
        onChanged: (value) {},
      ),
      "title": "MSME",
    },
    {
      'checkbox': Checkbox(
        value: false,
        onChanged: (value) {},
      ),
      "title": "DSC",
    },
    {
      'checkbox': Checkbox(
        value: false,
        onChanged: (value) {},
      ),
      "title": "TDS/TCS",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 5.0,
        mainAxisExtent: 50,
      ),
      itemCount: gridMap.length,
      itemBuilder: (_, index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                gridMap.elementAt(index)['checkbox'],
                Text("${gridMap.elementAt(index)['title']}"),
              ],
            ),
          ],
        );
      },
    );
  }
}


class DropDownWidget extends StatefulWidget {
  const DropDownWidget({super.key});

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  String selectedvalue = 'In 24 hours';
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey, // Choose your desired border color
          width: 1.0, // Adjust the border width as needed
        ),
        borderRadius:
            BorderRadius.circular(5.0), // Adjust the border radius as needed
      ),
      child: DropdownButton(
          isExpanded: true,
          value: selectedvalue,
          icon: Icon(Icons.keyboard_arrow_down),
          onChanged: (String? newValue) {
            setState(() {
              selectedvalue = newValue!;
            });
          },
          items: <String>['In 24 hours', 'In 48 hours', 'In 7 days']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList()),
    );
  }
}









// class UserPermissionItem extends StatefulWidget {
//   final String text;
//   final String fontFamily;
//   final double fontSize;
//   final FontWeight fontWeight;
//   final Color color;

//   const UserPermissionItem({
//     Key? key,
//     required this.text,
//     this.fontFamily = 'Poppins',
//     this.fontSize = 14.0,
//     this.fontWeight = FontWeight.normal,
//     required this.color,
//   }) : super(key: key);

//   @override
//   _UserPermissionItemState createState() => _UserPermissionItemState();
// }

// class _UserPermissionItemState extends State<UserPermissionItem> {
//   bool isChecked = false;

//   @override
//   Widget build(BuildContext context) {
//     final themeprovider = Provider.of<ThemeProvider>(context);
//     return Row(
//       children: [
//         Checkbox(
//             value: isChecked,
//             onChanged: (bool? value) {
//               setState(() {
//                 isChecked = value!;
//               });
//             },
//             checkColor:
//                 themeprovider.getCheckBoxTickColor, // Color of the check mark
//             fillColor: MaterialStateProperty.resolveWith<Color>(
//                 (Set<MaterialState> states) {
//               if (states.contains(MaterialState.pressed)) {
//                 return Colors.transparent; // No fill color when pressed
//               }
//               return Colors.transparent; // Default transparent fill color
//             }),
//             side: isChecked
//                 ? BorderSide(color: themeprovider.getCheckBox2Color)
//                 : BorderSide(
//                     color: themeprovider
//                         .getCheckBox2Color) // Border color of the checkbox
//             ),
//         Text(
//           widget.text,
//           style: TextStyle(
//               fontFamily: widget.fontFamily,
//               fontSize: widget.fontSize,
//               fontWeight: widget.fontWeight,
//               color: widget.color),
//         ),
//       ],
//     );
//   }
// }























// return Container(
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(
        //       1.0,
        //     ),
        //     color: Color.fromRGBO(236, 231, 255, 1),
        //   ),
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: [
        //       const ClipRRect(
        //         borderRadius: BorderRadius.only(
        //           topLeft: Radius.circular(16.0),
        //           topRight: Radius.circular(16.0),
        //         ),
        //       ),
        //       Padding(
        //         padding: const EdgeInsets.all(8.0),
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Text(
        //               "${gridMap.elementAt(index)['title']}",
        //               textAlign: TextAlign.center,
        //               style: Theme.of(context).textTheme.subtitle1!.merge(
        //                     const TextStyle(
        //                       fontWeight: FontWeight.w700,
        //                     ),
        //                   ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ],
        //   ),
        // );










