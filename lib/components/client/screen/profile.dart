import 'package:ca/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:path/path.dart';

import '../../../theme/daytheme.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/background_img.png',
              // Path to your background image
            ),
          ),
          //Content
          SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/background_img.png', // Path to your background image
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 70.h, left: 8.h, right: 8.h),
                    child: Center(
                      child: Text(
                          'Your Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Card(
                    elevation: 1,
                    margin: EdgeInsets.all(16.h),
                    color: AppColors.cardColor,
                    child: ListTile(
                      minVerticalPadding: 25.h,
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: Container(
                          width: 400, // Desired width of the image
                          height: 400, // Desired height of the image
                          decoration: const BoxDecoration(
                            //shape: BoxShape.circle, // Make the image circular
                            image: DecorationImage(
                              image: AssetImage('assets/images/Photo Profile.png'),
                              fit: BoxFit.contain, // Ensure the image covers the container
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                          'Neeraj Kumar',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppins"
                        ),
                      ),
                      subtitle: Text(
                          '8763529463',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Poppins"
                        ),
                      ),
                      trailing: Container(
                        height: 30,
                        width: 60,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.deepPurple, // Color of the border
                            width: 1, // Width of the border
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                              '#8482',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          elevation: 1,
                          color: Colors.white,
                          margin: EdgeInsets.only(top: 16.h, bottom: 16.h, left: 16.h, right: 5.h),
                          child: ListTile(
                            minVerticalPadding: 30.h,
                            leading: CircleAvatar(
                              radius: 25,
                              backgroundColor: Color.fromRGBO(236, 231, 255, 1),
                              child: Container(
                                // padding: EdgeInsets.all(20),
                                width: 200, // Desired width of the image
                                height: 200, // Desired height of the image
                                // decoration: const BoxDecoration(
                                //   //shape: BoxShape.circle, // Make the image circular
                                //   image: DecorationImage(
                                //     image: AssetImage('assets/images/scan.png'),
                                //     fit: BoxFit.fill, // Ensure the image covers the container
                                //   ),
                                // ),
                                child: Image(
                                  image: AssetImage('assets/images/scan.png'),
                                ),
                              ),
                            ),
                            trailing: Text(
                                'Reports',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                          child: Card(
                            elevation: 1,
                            color: Colors.white,
                            margin: EdgeInsets.only(top: 16.h, bottom: 16.h, right: 16.h, left: 5.h),
                            child: ListTile(
                              minVerticalPadding: 30.h,
                              leading: CircleAvatar(
                                radius: 25,
                                backgroundColor: Color.fromRGBO(236, 231, 255, 1),
                                child: Container(
                                  width: 400, // Desired width of the image
                                  height: 400, // Desired height of the image
                                  // decoration: const BoxDecoration(
                                  //   //shape: BoxShape.circle, // Make the image circular
                                  //   image: DecorationImage(
                                  //     image: AssetImage('assets/images/My QR.png'),
                                  //     fit: BoxFit.contain, // Ensure the image covers the container
                                  //   ),
                                  // ),
                                  child: Image(
                                    image: AssetImage('assets/images/My QR.png'),
                                  ),
                                ),
                              ),
                              trailing: Text(
                                  'Update',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                          ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.h),
                    child: Text(
                        'Account',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  ListWidget(title: 'Change Personal Profile', imageIcon: Icons.person,),
                  SizedBox(height: 5,),
                  ListWidget(title: 'Change Email Address', imageIcon: Icons.email,),
                  SizedBox(height: 5,),
                  ListWidget(title: 'Change Password', imageIcon: Icons.lock,),
                  Padding(
                    padding: EdgeInsets.all(16.h),
                    child: Text(
                      'More Settings',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  ListWidget(title: 'Account Security', imageIcon: Icons.lock,),
                  SizedBox(height: 5,),
                  ListWidget(title: 'Help and Privacy', imageIcon: Icons.help,),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Stack(
                        children: [
                          GestureDetector(
                            onTap: () async{
                              print('pressed');
                                await logOutAlertDialog(context);
                            },
                            child: Text(
                                'Log out',
                              style: TextStyle(
                                color: Colors.red,
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                              child:  Container(
                                height: 2, // Thickness of the underline
                                color: Colors.red,
                              ),
                          )
                        ]
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> logOutAlertDialog(context) async{
    return showDialog<void>(
      context: context,
      //barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Column(
            children: [
              Image(image: AssetImage('assets/images/AccountLogOut.png'),),
              Text(
                  'Want to LogOut?',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins",
                )
              ),
            ],
          ),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Center(child: Text(
                    'You will back to Home screen if you click the logout button',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins'
                  ),
                )),
              ],
            ),
          ),
          actions: <Widget>[
            RoundedButton(
              colour: const Color.fromRGBO(16, 13, 64, 1),
              onPressed: () {
                // if (_formKey.currentState!.validate()) {
                //   showDialog(
                //     context: context,
                //     barrierDismissible: false, // Prevent user from dismissing dialog
                //     builder: (BuildContext context) {
                //       return const CustomLoaderDialog(message: 'Creating Account. Don\'t exit..');
                //     },
                //   );
                //   _handleSubmit();
                // }
                context.pop();
              },
              title: 'Logout Now',
              textColor: const Color.fromRGBO(255, 255, 255, 1),
            ),
          ],
        );
      },
    );
  }
}



class ListWidget extends StatelessWidget {
  final String title;
  final IconData imageIcon;
  
  const ListWidget({
    super.key,
    required this.title,
    required this.imageIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.h, right: 16.h),
      child: Card(
        elevation: 0.3,
        color: Colors.white,
        child: ListTile(
          minVerticalPadding: 20.h,
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Color.fromRGBO(236, 231, 255, 1),
            child: Container(
              // padding: EdgeInsets.all(20),
              width: 200, // Desired width of the image
              height: 200, // Desired height of the image

              child: Icon(
                imageIcon,
              )
            ),
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
            ),
          ),
          trailing: const Icon(
            Icons.keyboard_arrow_right,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}


