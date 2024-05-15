import 'package:flutter/material.dart';

class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(children: [
          CreatePassword(),
        ]),
      ),
    );
  }
}

class CreatePassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 375,
          height: 812,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Positioned(
                left: 83,
                top: 172,
                child: Text(
                  'Create password',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 24,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 0.06,
                  ),
                ),
              ),
              Positioned(
                left: 111,
                top: 308,
                child: Container(
                  height: 13,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 13,
                          height: 13,
                          decoration: ShapeDecoration(
                            color: Color(0xFF333333),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 47,
                        top: 0,
                        child: Opacity(
                          opacity: 0.20,
                          child: Container(
                            width: 13,
                            height: 13,
                            decoration: ShapeDecoration(
                              color: Color(0xFF333333),
                              shape: OvalBorder(),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 94,
                        top: 0,
                        child: Opacity(
                          opacity: 0.20,
                          child: Container(
                            width: 13,
                            height: 13,
                            decoration: ShapeDecoration(
                              color: Color(0xFF333333),
                              shape: OvalBorder(),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 141,
                        top: 0,
                        child: Opacity(
                          opacity: 0.20,
                          child: Container(
                            width: 13,
                            height: 13,
                            decoration: ShapeDecoration(
                              color: Color(0xFF333333),
                              shape: OvalBorder(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 538,
                child: Container(
                  width: 375,
                  height: 241.74,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 120.87,
                          height: 55.79,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Opacity(
                                  opacity: 0,
                                  child: Container(
                                    width: 120.87,
                                    height: 55.79,
                                    decoration: ShapeDecoration(
                                      color: Color(0xFF100D40),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(6.20),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 54.75,
                                top: 15.50,
                                child: SizedBox(
                                  width: 12.40,
                                  height: 23.76,
                                  child: Text(
                                    '1',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF111025),
                                      fontSize: 20.66,
                                      fontFamily: 'Ubuntu',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 61.98,
                        child: Container(
                          width: 120.87,
                          height: 55.79,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Opacity(
                                  opacity: 0,
                                  child: Container(
                                    width: 120.87,
                                    height: 55.79,
                                    decoration: ShapeDecoration(
                                      color: Color(0xFF100D40),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(6.20),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 54.75,
                                top: 15.50,
                                child: SizedBox(
                                  width: 12.40,
                                  height: 23.76,
                                  child: Text(
                                    '4',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF111025),
                                      fontSize: 20.66,
                                      fontFamily: 'Ubuntu',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 123.97,
                        child: Container(
                          width: 120.87,
                          height: 55.79,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Opacity(
                                  opacity: 0,
                                  child: Container(
                                    width: 120.87,
                                    height: 55.79,
                                    decoration: ShapeDecoration(
                                      color: Color(0xFF100D40),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(6.20),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 54.75,
                                top: 15.50,
                                child: SizedBox(
                                  width: 12.40,
                                  height: 23.76,
                                  child: Text(
                                    '7',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF111025),
                                      fontSize: 20.66,
                                      fontFamily: 'Ubuntu',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 127.07,
                        top: -0,
                        child: Container(
                          width: 120.87,
                          height: 55.79,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Opacity(
                                  opacity: 0,
                                  child: Container(
                                    width: 120.87,
                                    height: 55.79,
                                    decoration: ShapeDecoration(
                                      color: Color(0xFF100D40),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(6.20),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 54.75,
                                top: 15.50,
                                child: SizedBox(
                                  width: 12.40,
                                  height: 23.76,
                                  child: Text(
                                    '2',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF111025),
                                      fontSize: 20.66,
                                      fontFamily: 'Ubuntu',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 127.07,
                        top: 61.98,
                        child: Container(
                          width: 120.87,
                          height: 55.79,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 120.87,
                                  height: 55.79,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFF5F5F5),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(12.40),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 54.75,
                                top: 15.50,
                                child: SizedBox(
                                  width: 12.40,
                                  height: 23.76,
                                  child: Text(
                                    '5',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF111025),
                                      fontSize: 20.66,
                                      fontFamily: 'Ubuntu',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 127.07,
                        top: 123.97,
                        child: Container(
                          width: 120.87,
                          height: 55.79,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Opacity(
                                  opacity: 0,
                                  child: Container(
                                    width: 120.87,
                                    height: 55.79,
                                    decoration: ShapeDecoration(
                                      color: Color(0xFF100D40),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(6.20),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 54.75,
                                top: 15.50,
                                child: SizedBox(
                                  width: 12.40,
                                  height: 23.76,
                                  child: Text(
                                    '8',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF111025),
                                      fontSize: 20.66,
                                      fontFamily: 'Ubuntu',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 127.07,
                        top: 185.95,
                        child: Container(
                          width: 120.87,
                          height: 55.79,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Opacity(
                                  opacity: 0,
                                  child: Container(
                                    width: 120.87,
                                    height: 55.79,
                                    decoration: ShapeDecoration(
                                      color: Color(0xFF100D40),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(6.20),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 54.75,
                                top: 15.50,
                                child: SizedBox(
                                  width: 12.40,
                                  height: 23.76,
                                  child: Text(
                                    '0',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF111025),
                                      fontSize: 20.66,
                                      fontFamily: 'Ubuntu',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 254.13,
                        top: -0,
                        child: Container(
                          width: 120.87,
                          height: 55.79,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Opacity(
                                  opacity: 0,
                                  child: Container(
                                    width: 120.87,
                                    height: 55.79,
                                    decoration: ShapeDecoration(
                                      color: Color(0xFF100D40),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(6.20),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 54.75,
                                top: 15.50,
                                child: SizedBox(
                                  width: 12.40,
                                  height: 23.76,
                                  child: Text(
                                    '3',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF111025),
                                      fontSize: 20.66,
                                      fontFamily: 'Ubuntu',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 254.13,
                        top: 61.98,
                        child: Container(
                          width: 120.87,
                          height: 55.79,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Opacity(
                                  opacity: 0,
                                  child: Container(
                                    width: 120.87,
                                    height: 55.79,
                                    decoration: ShapeDecoration(
                                      color: Color(0xFF100D40),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(6.20),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 54.75,
                                top: 15.50,
                                child: SizedBox(
                                  width: 12.40,
                                  height: 23.76,
                                  child: Text(
                                    '6',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF111025),
                                      fontSize: 20.66,
                                      fontFamily: 'Ubuntu',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 254.13,
                        top: 123.97,
                        child: Container(
                          width: 120.87,
                          height: 55.79,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Opacity(
                                  opacity: 0,
                                  child: Container(
                                    width: 120.87,
                                    height: 55.79,
                                    decoration: ShapeDecoration(
                                      color: Color(0xFF100D40),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(6.20),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 54.75,
                                top: 15.50,
                                child: SizedBox(
                                  width: 12.40,
                                  height: 23.76,
                                  child: Text(
                                    '9',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF111025),
                                      fontSize: 20.66,
                                      fontFamily: 'Ubuntu',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 302.69,
                        top: 201.45,
                        child: Container(
                          width: 24.79,
                          height: 24.79,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Opacity(
                                  opacity: 0,
                                  child: Container(
                                    width: 24.79,
                                    height: 24.79,
                                    decoration:
                                        BoxDecoration(color: Color(0xFF666666)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 375,
                  height: 44,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(width: 375, height: 44),
                      ),
                      Positioned(
                        left: 24,
                        top: 14,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Text(
                                '9:41',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF262626),
                                  fontSize: 15,
                                  fontFamily: 'SF Pro Text',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                  letterSpacing: -0.30,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 259,
                              top: 3.33,
                              child: Container(
                                width: 68,
                                height: 11.34,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 43.95,
                                      top: 0,
                                      child: Container(
                                        width: 24.05,
                                        height: 11.33,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              left: 0,
                                              top: 0,
                                              child: Opacity(
                                                opacity: 0.35,
                                                child: Container(
                                                  width: 21.75,
                                                  height: 11.33,
                                                  decoration: ShapeDecoration(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      side: BorderSide(
                                                          width: 1,
                                                          color: Color(
                                                              0xFF262626)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              2.67),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 1.98,
                                              top: 2,
                                              child: Container(
                                                width: 17.80,
                                                height: 7.33,
                                                decoration: ShapeDecoration(
                                                  color: Color(0xFF262626),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            1.33),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 22.80,
                                      top: -0,
                                      child: Container(
                                        width: 15.16,
                                        height: 11,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                "https://via.placeholder.com/15x11"),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 0,
                                      top: 0.34,
                                      child: Container(
                                        width: 16.81,
                                        height: 10.67,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                "https://via.placeholder.com/17x11"),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
