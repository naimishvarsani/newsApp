// ignore_for_file: prefer_const_constructors, unused_import, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, prefer_interpolation_to_compose_strings, unused_element, deprecated_member_use, prefer_final_fields, avoid_print, unused_field, curly_braces_in_flow_control_structures, unused_local_variable, use_super_parameters

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:news_app/Helper/utility.dart';
import 'package:translator/translator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FlutterTts flutterTts = FlutterTts();
  GoogleTranslator translator = GoogleTranslator();
  String inputText = '';
  bool _loading = false;
  bool visible = false;
  int? translatedIndex;
  String? transletedValue;
  Future translate() async {
    setState(() {
      _loading = true;
    });

    Translation translation = await translator.translate(inputText,
        to: items.values.elementAt(translatedIndex!));

    setState(() {
      transletedValue = translation.text;
      _loading = false;
    });
  }

  Future speak(String languageCode, String text) async {
    await flutterTts.setLanguage(languageCode);
    await flutterTts.setPitch(1);
    await flutterTts.setVolume(1);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgcolor,
      appBar: appbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            languagetranslate(),
            enterText(),
            translatebutton(),
            translateAndSpeechbox(),
          ],
        ),
      ),
    );
  }

// <<<<<<<<<<<<<<<<<<<<<<<<<<AppBar>>>>>>>>>>>>>>>>>>>>>>>>>>>> //
  AppBar appbar() {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColor.bgcolor,
      centerTitle: true,
      title: Text(
        'Translate',
        style: TextStyle(
          color: Colors.black,
          fontFamily: AppFont.semibold,
        ),
      ),
    );
  }

// <<<<<<<<<<<<<<<<<<<<<<<<<<Dropdown>>>>>>>>>>>>>>>>>>>>>>>>>>>> //

  final Map<String, String> items = {
    '🇮🇳 Hindi': 'hi',
    '🇺🇸 English': 'en',
    '🇮🇹 Italian': 'it',
    '🇯🇵 Japanese': 'ja',
    '🇩🇪 German': 'de',
    '🇷🇺 Russian': 'ru',
    '🇪🇸 Spainish': 'es',
    '🇫🇷 French': 'fr',
    '🇨🇳 Chinese': 'zh-cn',
  };
  String? selectedValue;
  Widget languagetranslate() {
    return Row(
      children: [
        SizedBox(width: 15),
        DropdownButtonHideUnderline(
          child: DropdownButton2(
            isExpanded: true,
            hint: Text(
              'Select Item',
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).hintColor,
              ),
            ),
            items: items.keys
                .map((String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ))
                .toList(),
            value: selectedValue,
            buttonStyleData: const ButtonStyleData(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 40,
              width: 140,
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 40,
            ),
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
              for (int i = 0; i < items.entries.length; i++) {
                if (items.entries.toList()[i].key == value) {
                  print("i $i");
                  setState(() {
                    translatedIndex = i;
                    if (inputText.isNotEmpty) {
                      // translate();
                    }
                  });
                }
              }
            },
          ),
        ),
      ],
    );
  }

  // <<<<<<<<<<<<<<<<<<<<<<<<<<EnterText>>>>>>>>>>>>>>>>>>>>>>>>>>>> //

  Widget enterText() {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(left: 15, right: 15, top: 25),
      height: Get.height * 0.25,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColor.containbgcolor,
          borderRadius: BorderRadius.circular(15)),
      child: TextFormField(
        keyboardType: TextInputType.streetAddress,
        maxLines: 10,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Enter Text',
          hintStyle: TextStyle(
            fontFamily: AppFont.medium,
            color: AppColor.themeblackcolor,
          ),
        ),
        onChanged: (input) {
          inputText = input;
        },
      ),
    );
  }

//<<<<<<<<<<<<<<<<<<<<<<<<<<< Translate Button >>>>>>>>>>>>>>>>>>>> //
  Widget translatebutton() {
    return GestureDetector(
      onTap: () {
        if (inputText.isNotEmpty) translate();
      },
      child: Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.only(top: 15),
        height: 35,
        width: 110,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: AppColor.iconbgcolor,
                offset: Offset(0, 2),
                blurRadius: 10,
                spreadRadius: 1.5),
          ],
          borderRadius: BorderRadius.circular(18),
          color: AppColor.containbgcolor,
        ),
        child: Row(
          children: [
            Text(
              'Translate',
              style: TextStyle(
                fontFamily: AppFont.semibold,
              ),
            ),
            Spacer(),
            _loading
                ? Container(
                    padding: EdgeInsets.all(4),
                    child: Image.asset(
                      AssetsPath.home + 'loader_big.gif',
                    ),
                  )
                : Image.asset(
                    AssetsPath.home + 'translate_small.png',
                  ),
          ],
        ),
      ),
    );
  }

//<<<<<<<<<<<<<<<<<<<<<<<< Translate & Speech Box >>>>>>>>>>>>>>>>>>>>>>>>
  Widget translateAndSpeechbox() {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(left: 15, right: 15, top: 15),
          height: Get.height * 0.25,
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColor.containbgcolor,
              borderRadius: BorderRadius.circular(15)),
          child: ListView(
            children: [
              Text(
                transletedValue ?? 'Translate',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: AppFont.medium,
                  color: AppColor.themeblackcolor,
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Spacer(),
            GestureDetector(
              onTap: () {
                speak(
                    items.values.elementAt(translatedIndex!), transletedValue!);
              },
              child: Container(
                  padding: EdgeInsets.all(9),
                  margin: EdgeInsets.only(top: Get.height * 0.2, right: 30),
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: AppColor.themeblackcolor, width: 2),
                    borderRadius: BorderRadius.circular(18),
                    color: AppColor.containbgcolor,
                  ),
                  child: Center(
                    child: Image.asset(AssetsPath.home + 'play.png'),
                  )),
            ),
            GestureDetector(
              onTap: () {
                flutterTts.stop();
              },
              child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(top: Get.height * 0.2, right: 30),
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: AppColor.themeblackcolor, width: 2),
                    borderRadius: BorderRadius.circular(18),
                    color: AppColor.containbgcolor,
                  ),
                  child: Center(
                    child: Image.asset(AssetsPath.home + 'stop.png'),
                  )),
            ),
          ],
        ),
      ],
    );
  }
}
