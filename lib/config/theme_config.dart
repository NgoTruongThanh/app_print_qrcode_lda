import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/utils.dart';



class ThemeConfig {
  static Color primaryColor = const Color(0xFF272944);
  static Color secondColor = Colors.green;
  static Color backgroundColor = const Color(0xFF272944);
  static Color background2 = const Color(0xfff9fafd);
  static Color thirdColor = const Color(0xFFA7D676);
  static Color fourthColor = const Color(0xFFFE7235);
  static Color greenColor = Colors.green;
  static Color redColor = Colors.red;
  static Color textColor = const Color(0xFF444d5b);
  static Color textColor2 = const Color(0xFF043C63);
  static Color textTest = const Color(0xFFF5F5F5);
  static Color whiteColor = Colors.white;
  static Color greyColor = Colors.grey;
  static Color greyColor2 = textColor;
  static Color blackColor = Colors.black;
  static Color buttonPrimary = Colors.blueAccent;
  static Color buttonPrimary2 = Color(0xFFB5E5FF);
  static Color hoverColor = const Color(0xffe4e6ea);
  static Color successColor = const Color(0xFFaaf683);
  static Color errorColor = const Color(0xFFee6055);
  static Color warningColor = const Color(0xffffc330);
  static Color darkBluePrimary = const Color(0xFF043C63);
  static Color colorNext = const Color(0xFF00773C);
  static Color colorQueue = const Color(0xFFFFC630);
  static Color buttonColor = const Color(0xFF06A8DF);
  static Color commonColor = const Color(0xFF1171B3);
  static Color commonTextColor = const Color(0xFF043C63);

  static const EdgeInsets contentPadding = EdgeInsets.symmetric(vertical: 4, horizontal: 10);

  static double get headerSize => getSize(25);
  static double get headerLargeSize => getSize(30);
  static double get borderRadius => getSize(10);
  static double get borderRadiusMax => getSize(50);

  static double get sideBarSize => getSize(13.5);
  static double get defaultSize => (15);
  static double get labelSize => getSize(12);
  static double get smallSize => getSize(13);
  static double get titleSize => getSize(20);
  static double get iconSize => getSize(30);

  static String fontFamily = 'Roboto';
  static double defaultHorPadding = getSize(10);
  static double defaultPadding = getSize(20);
  static double defaultVerPadding = getSize(20);
  static double lineHigh = 1.5;

  static TextStyle defaultStyle = GoogleFonts.openSans(
      textStyle: TextStyle(fontSize: ThemeConfig.defaultSize, color: ThemeConfig.textColor, height: 1.5));

  static TextStyle sideBarStyle = GoogleFonts.openSans(
      textStyle: TextStyle(fontSize: ThemeConfig.sideBarSize, color: ThemeConfig.textColor, height: 1.5));

  static TextStyle titleStyle = GoogleFonts.openSans(
      textStyle: TextStyle(fontSize: ThemeConfig.titleSize, color: ThemeConfig.textColor, height: 1.5));

  static TextStyle headerStyle = GoogleFonts.openSans(
      textStyle: TextStyle(fontSize: ThemeConfig.headerSize, color: ThemeConfig.textColor, height: 1.5));

  static TextStyle smallStyle = GoogleFonts.openSans(
      textStyle: TextStyle(fontSize: ThemeConfig.smallSize, color: ThemeConfig.textColor, height: 1.5));

  static TextStyle labelStyle = GoogleFonts.openSans(
      textStyle: TextStyle(fontSize: ThemeConfig.labelSize, color: ThemeConfig.textColor, height: 1.5));

  static List<Color> get listColor => <Color>[
        const Color(0xFF3a93ba),
        const Color(0xFF86E3CE),
        const Color(0xFFD0E6A5),
        const Color(0xFFFFDD94),
        const Color(0xFFFA897B),
        const Color(0xFFCCABD8),
        const Color(0xFFFBC78D),
        const Color(0xFF16325C),
        const Color(0xFF08A69E),
        const Color(0xFFE2CE7D),
        const Color(0xFFFFB75d),
        const Color(0xFF00716b),
        const Color(0xFF009e73),
        const Color(0xFF93c9f8),
        const Color(0xFF3a93ba),
        const Color(0xFF00716b),
        const Color(0xFFC41E3A),
        const Color(0xFF1D3557),
        const Color(0xFFE63946),
        const Color(0xFF457B9D),
        const Color(0xFFC5DCA0),
        const Color(0xFFE07A5F),
        const Color(0xFF6D597A),
        const Color(0xFF5C3C92),
        const Color(0xFFF77F00),
        const Color(0xFFA8DADC),
        const Color(0xFF8C2D19),
        const Color(0xFF264653),
        const Color(0xFFEF476F),
        const Color(0xFF84A9AC),
        const Color(0xFF593C8F),
        const Color(0xFFF1FAEE),
        const Color(0xFFB25B3B),
        const Color(0xFF6B0504),
        const Color(0xFF006d77),
        const Color(0xFF8338ec),
        const Color(0xFF000080),
        const Color(0xFF3F3F3F),
        const Color(0xFFD90429),
        const Color(0xFFCBF3F0),
        const Color(0xFF293241),
        const Color(0xFF00539C),
        const Color(0xFFBFDBF7),
        const Color(0xFF001845),
        const Color(0xFF023E8A),
        const Color(0xFF650A5A),
        const Color(0xFFEA6A47),
        const Color(0xFF012443),
        const Color(0xFFFB5607),
        const Color(0xFF3C493F),
        const Color(0xFF69306D),
        const Color(0xFFEF476F),
        const Color(0xFFD00000),
        Color(0xFF00FF00),
        Color(0xFFFF00FF),
        Color(0xFFDEB887),
        Color(0xFF5F9EA0),
        Color(0xFFFF7F50),
        Color(0xFF6495ED),
        Color(0xFFBDB76B),
        Color(0xFF8B008B),
        Color(0xFFFF8C00),
        Color(0xFF9932CC),
        Color(0xFFE9967A),
        Color(0xFF8FBC8F),
        Color(0xFF483D8B),
        Color(0xFF2F4F4F),
        Color(0xFF00CED1),
        Color(0xFF9400D3),
        Color(0xFFFF1493),
        Color(0xFF7FFF00),
        Color(0xFF800080),
        Color(0xFF66CDAA),
        Color(0xFF0000CD),
        Color(0xFFBA55D3),
        Color(0xFF9370DB),
        Color(0xFF3CB371),
        Color(0xFF7B68EE),
        Color(0xFF00FA9A),
        Color(0xFF48D1CC),
        Color(0xFFC71585),
        Color(0xFFFFE4C4),
        Color(0xFF000000),
        Color(0xFFFFEBCD),
        Color(0xFF0000FF),
        Color(0xFF8A2BE2),
        Color(0xFFA52A2A),
        Color(0xFFDC143C),
        Color(0xFF00FFFF),
        Color(0xFF00008B),
        Color(0xFF008B8B),
        Color(0xFFB8860B),
        Color(0xFFA9A9A9),
        Color(0xFF006400),
        Color(0xFF00BFFF),
        Color(0xFF696969),
        Color(0xFF1E90FF),
        Color(0xFFB22222),
        Color(0xFFFFFAF0),
        Color(0xFF228B22),
        Color(0xFFFF00FF),
        Color(0xFFFFD700),
        Color(0xFFDAA520),
        Color(0xFF808080),
        Color(0xFF008000),
        Color(0xFFADFF2F),
        Color(0xFFF0FFF0),
        Color(0xFFFF69B4),
        Color(0xFFCD5C5C),
        Color(0xFF4B0082),
        Color(0xFFFFF8DC),
        Color(0xFF800000),
        Color(0xFFE0FFFF),
        Color(0xFFFAFAD2),
        Color(0xFFD3D3D3),
        Color(0xFF90EE90),
        Color(0xFFFFB6C1),
        Color(0xFFFFA07A),
        Color(0xFF20B2AA),
        Color(0xFF87CEFA),
        Color(0xFF778899),
        Color(0xFFB0C4DE),
        Color(0xFFFFE4E1),
        const Color(0xFF3a93ba),
        const Color(0xFF86E3CE),
        const Color(0xFFD0E6A5),
        const Color(0xFFFFDD94),
        const Color(0xFFFA897B),
        const Color(0xFFCCABD8),
        const Color(0xFFFBC78D),
        const Color(0xFF16325C),
        const Color(0xFF08A69E),
        const Color(0xFFE2CE7D),
        const Color(0xFFFFB75d),
        const Color(0xFF00716b),
        const Color(0xFF009e73),
        const Color(0xFF93c9f8),
        const Color(0xFF3a93ba),
        const Color(0xFF00716b),
        const Color(0xFFC41E3A),
        const Color(0xFF1D3557),
        const Color(0xFFE63946),
        const Color(0xFF457B9D),
        const Color(0xFFC5DCA0),
        const Color(0xFFE07A5F),
        const Color(0xFF6D597A),
        const Color(0xFF5C3C92),
        const Color(0xFFF77F00),
        const Color(0xFFA8DADC),
        const Color(0xFF8C2D19),
        const Color(0xFF264653),
        const Color(0xFFEF476F),
        const Color(0xFF84A9AC),
        const Color(0xFF593C8F),
        const Color(0xFFF1FAEE),
        const Color(0xFFB25B3B),
        const Color(0xFF6B0504),
        const Color(0xFF006d77),
        const Color(0xFF8338ec),
        const Color(0xFF000080),
        const Color(0xFF3F3F3F),
        const Color(0xFFD90429),
        const Color(0xFFCBF3F0),
        const Color(0xFF293241),
        const Color(0xFF00539C),
        const Color(0xFFBFDBF7),
        const Color(0xFF001845),
        const Color(0xFF023E8A),
        const Color(0xFF650A5A),
        const Color(0xFFEA6A47),
        const Color(0xFF012443),
        const Color(0xFFFB5607),
        const Color(0xFF3C493F),
        const Color(0xFF69306D),
        const Color(0xFFEF476F),
        const Color(0xFFD00000),
        const Color(0xFF718096),
        const Color(0xFFA9A9A9),
        const Color(0xFFA7C5EB),
        const Color(0xFF2E1F27),
        const Color(0xFFEDF2F4),
        const Color(0xFF0B3D91),
        const Color(0xFFBA1200),
        const Color(0xFFDA627D),
        const Color(0xFF8E8D92),
        const Color(0xFF01FF70),
        const Color(0xFFFBBC05),
        const Color(0xFF5D5C61),
        const Color(0xFFF48C06),
        const Color(0xFFA8D8EA),
        const Color(0xFF203647),
        const Color(0xFF4B4E6D),
        const Color(0xFFA6CEE3),
        const Color(0xFF065143),
        const Color(0xFF0077B6),
        const Color(0xFF03071E),
        const Color(0xFFF7DBA7),
        const Color(0xFF616E71),
        const Color(0xFF00203F),
        const Color(0xFF8F3F7E),
        const Color(0xFF3D405B),
        const Color(0xFFF94144),
        const Color(0xFF8E8D92),
        const Color(0xFFEDAE49),
        const Color(0xFFFCFFC7),
        const Color(0xFFE09F3E),
        const Color(0xFF9D0208),
        const Color(0xFFE4FDE1),
        const Color(0xFFE6AF2E),
        const Color(0xFF5D5C61),
        const Color(0xFFD1E7E0),
        const Color(0xFF0F4C5C),
      ];
}
