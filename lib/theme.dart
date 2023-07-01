import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color kBlackColor = Color(0xff222222);
const Color kAccentColor = Color(0xff2A2B37);
const Color kGreyColor = Color(0xff94959B);
const Color kLineDarkColor = Color(0xffEAEAEA);
const Color kWhiteGreyColor = Color(0xffF1F1F5);
const Color kWhiteColor = Color(0xffFFFFFF);
const Color kRedColor = Color(0xffFF314A);
const Color kYellowColor = Color(0xffFFBA00);
const Color kBlueColor = Color(0xff2972FF);

Map<String, Color> kColors = {
  'black': kBlackColor,
  'accent': kAccentColor,
  'grey': kGreyColor,
  'lineDark': kLineDarkColor,
  'whiteGrey': kLineDarkColor,
  'white': kWhiteColor,
  'red': kRedColor,
  'yellow': kYellowColor,
  'blue': kBlueColor,
};

TextStyle blackTextStyle = GoogleFonts.nunito(color: kBlackColor);
TextStyle accentTextStyle = GoogleFonts.nunito(color: kAccentColor);
TextStyle greyTextStyle = GoogleFonts.nunito(color: kGreyColor);
TextStyle lineDarkTextStyle = GoogleFonts.nunito(color: kLineDarkColor);
TextStyle whiteGreyTextStyle = GoogleFonts.nunito(color: kWhiteGreyColor);
TextStyle whiteTextStyle = GoogleFonts.nunito(color: kWhiteColor);
TextStyle redTextStyle = GoogleFonts.nunito(color: kRedColor);
TextStyle yellowTextStyle = GoogleFonts.nunito(color: kYellowColor);
TextStyle blueTextStyle = GoogleFonts.nunito(color: kBlueColor);

Map<String, TextStyle> textStyles = {
  'black': blackTextStyle,
  'accent': accentTextStyle,
  'grey': greyTextStyle,
  'lineDark': lineDarkTextStyle,
  'white': whiteTextStyle,
  'whiteGrey': whiteGreyTextStyle,
  'red': redTextStyle,
  'yellow': yellowTextStyle,
  'blue': blueTextStyle,
};

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
