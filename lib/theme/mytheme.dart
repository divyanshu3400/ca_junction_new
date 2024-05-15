import 'package:flutter/material.dart';

enum CustomThememode { light, dark }

class ThemeProvider with ChangeNotifier {
  final CustomThememode _themeMode = CustomThememode.light;

  // int _index = 0;
  int getColorIndex() {
    if (_themeMode == CustomThememode.light) {
      return 0;
    } else {
      return 1;
    }
  }

  void init() {}

  List<Color> _primaryColor = [Color.fromRGBO(38, 38, 38, 1), Color.fromRGBO(255, 255, 255, 1)];
  List<Color> _secondaryColor = [Color.fromRGBO(51, 51, 51, 1), Color.fromRGBO(255, 255, 255, 1)];
  List<Color> _titletextcolor = [Color.fromRGBO(51, 51, 51, 1), Color.fromRGBO(255, 255, 255, 1)];//1
  List<Color> _purpletextcolor = [Color.fromRGBO(16, 13, 64, 1), Color.fromRGBO(255, 255, 255, 1)];//1
  List<Color> _purpletextcolor2 = [Color.fromRGBO(255, 255, 255, 1),Color.fromRGBO(16, 13, 64, 1)];//1
  List<Color> _descriptioncolor = [Color.fromRGBO(153, 153, 153, 1), Color.fromRGBO(255, 255, 255, 1)];
  List<Color> _backgroundcolor = [Color.fromRGBO(255, 255, 255, 1), Color.fromRGBO(50, 54, 58, 1)];
  List<Color> _textfieldcolor = [Color.fromRGBO(247, 247, 247, 1), Color.fromRGBO(70, 71, 72, 1)];
  List<Color> _checkboxcolor = [Color.fromRGBO(196, 196, 196, 1), Color.fromRGBO(255, 255, 255, 1)];
  List<Color> _otpfieldcolor = [Color.fromRGBO(16, 13, 64, 1), Color.fromRGBO(255, 255, 255, 1)];
  List<Color> _checkboxtickcolor = [Color.fromRGBO(16, 13, 64, 1), Color.fromRGBO(255, 255, 255, 1)];
  List<Color> _enabledbordercolor = [Color.fromRGBO(196, 196, 196, 1), Color.fromRGBO(70, 71, 72, 1)];
  List<Color> _focusedbordercolor = [Color.fromRGBO(167, 167, 167, 1), Color.fromRGBO(73, 73, 73, 1)];
  List<Color> _changePasswordThemecolor = [Color.fromRGBO(130, 144, 157, 1), Color.fromRGBO(255, 255, 255, 1)];

  // List<Color> _titlecolor = [Colors.blue, Colors.white];
  // List<Color> _iconcolor = [Colors.black, Colors.black];
  // List<Color> _backgroundcolor = [Color(0xFFF5F5F5), Colors.black];

  Color get getPrimaryColor => _primaryColor[getColorIndex()];
  Color get getSecondaryColor => _secondaryColor[getColorIndex()];
  Color get getTitleTextColor => _titletextcolor[getColorIndex()];//
  Color get getPurpleTextColor => _purpletextcolor[getColorIndex()];
  Color get getPurpleTextColor2 => _purpletextcolor2[getColorIndex()];
  Color get getDescriptionColor => _descriptioncolor[getColorIndex()];
  Color get getBackgroundColor => _backgroundcolor[getColorIndex()];
  Color get getTextFieldColor => _textfieldcolor[getColorIndex()];
  Color get getCheckBoxColor => _checkboxcolor[getColorIndex()];
  Color get getOtpFieldColor => _otpfieldcolor[getColorIndex()];
  Color get getCheckBoxTickColor => _checkboxtickcolor[getColorIndex()];
  Color get getEnabledBorderColor => _enabledbordercolor[getColorIndex()];
  Color get getFocusedBorderColor => _focusedbordercolor[getColorIndex()];
  Color get getChangePasswordThemeColor => _changePasswordThemecolor[getColorIndex()];

  // Color get geticoncolor => _iconcolor[getColorIndex()];
  // Color get getbackgroundcolor => _backgroundcolor[getColorIndex()];
}
