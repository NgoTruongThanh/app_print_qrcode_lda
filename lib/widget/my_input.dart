import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../config/theme_config.dart';
import '../controller/app_controller.dart';
import '../utils/utils.dart';


class MyInput extends StatefulWidget {
  final bool hasTitle;
  final String? title;
  bool obscureText;
  final bold;
  final String hintText;
  String? initValue;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffix;
  late EdgeInsetsGeometry? padding;
  final int maxLength;
  final double? fontSize;
  final contendPadding;
  final int maxLine;
  final validate;
  final readOnly;
  final TextEditingController? controller;
  final FocusNode? focus;
  final MenuCallback onChanged;
  final GestureTapCallback? callback;
  final TextAlign textAlign;
  final bool isRequired;
  final TextAlignVertical? textAlignVertical;
  final double? widthText;
  List<TextInputFormatter>? inputFormatters;
  MyInput(
      {Key? key, this.keyboardType,
      this.textAlign = TextAlign.left,
      this.title,
      this.hasTitle = false,
      this.hintText = '',
      this.obscureText = false,
      this.prefixIcon,
      this.focus,
      this.suffix,
      this.padding,
      this.fontSize,
      this.maxLine = 1,
      this.contendPadding,
        this.isRequired = false,
      this.controller,
      this.bold = FontWeight.normal,
      this.validate = true,
      this.maxLength = 100,
      this.textAlignVertical,
      required this.onChanged,
      this.callback,
      this.initValue,
        this.inputFormatters,
        this.widthText,
      this.readOnly = false})
      : super(key: key);

  @override
  _MyInputState createState() => _MyInputState();
}

class _MyInputState extends State<MyInput> {
  bool checkValidate = false;
  String? valueForm;



  @override
  void initState() {
    super.initState();

    valueForm = widget.initValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: widget.widthText??getSize(180),
            child: widget.title != ''
                ? AutoSizeText('${widget.title}:',
                style: ThemeConfig.defaultStyle.copyWith(fontWeight: FontWeight.bold, height: 3))
                : const SizedBox(),
          ),

          Expanded(
            child: Container(
              height: getSize(50) ,
              decoration: BoxDecoration(
                  border: Border.all(color: widget.isRequired ? Colors.red.withOpacity(0.3) : ThemeConfig.greyColor, width: 1),
                borderRadius: BorderRadius.circular(8),),
              child: TextFormField(
                controller: widget.controller,
                inputFormatters: widget.inputFormatters,
                initialValue: widget.initValue,
                focusNode: widget.focus,
                onTap: widget.callback,
                readOnly: widget.readOnly,
                textAlign: widget.textAlign,
                style: TextStyle(fontSize: widget.fontSize ?? ThemeConfig.defaultSize, fontWeight: widget.bold),
                keyboardType: widget.keyboardType,
                obscureText: widget.obscureText,
                maxLines: widget.maxLine,
                onChanged: (value) {
                  widget.onChanged(value);
                  setState(() {
                    valueForm = value;
                  });
                },
                onTapOutside: (value){
                  setState(() {
                    checkValidate = valueForm == null || valueForm!.isEmpty;
                  });
                },
                textAlignVertical: widget.textAlignVertical,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: widget.readOnly?Colors.grey.withOpacity(0.3):Colors.transparent,
                  //hintStyle: const TextStyle(color: Colors.grey),
                  suffixIcon: widget.suffix,
                  prefixIcon: widget.prefixIcon,
                  //errorText: _validate(controller.text),
                  hintText: widget.isRequired && checkValidate ? 'Không được để trống' : 'Nhập ${widget.hintText.toLowerCase()}',
                  hintStyle: TextStyle(color: widget.isRequired && checkValidate ? Colors.red :  Colors.grey),
                  contentPadding: const EdgeInsets.fromLTRB(10.0, 0.0, 20.0, 10.0),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(5.0)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(5.0)),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
