import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopee_fake/common/constants/app_colors.dart';

class CustomTextInput extends StatefulWidget {
  TextEditingController? textController;
  Widget? startIcon;
  String? labelText;
  String? hintText;
  String? defaultTextValue;
  final String? errorText;
  TextInputType? keyboardType;
  bool? obscureText = false;
  bool showBorder = false;
  String? Function(String?)? validator;
  String? Function(String?)? onTextChange;
  EdgeInsets? containPadding;
  Widget? endIcon;
  bool enable = true;
  bool highlight = false;
  bool blur = false;
  final List<TextInputFormatter>? inputFormatters;
  bool capitalization;
  bool enableQuickClear;

  CustomTextInput({
    Key? key,
    this.textController,
    this.startIcon,
    this.hintText,
    this.labelText,
    this.defaultTextValue,
    this.keyboardType,
    this.obscureText,
    this.validator,
    this.onTextChange,
    this.showBorder = true,
    this.containPadding,
    this.endIcon,
    this.enable = true,
    this.highlight = false,
    this.inputFormatters,
    this.errorText,
    this.blur = false,
    this.capitalization = false,
    this.enableQuickClear = false,
  }) : super(key: key);

  @override
  _CustomTextInputState createState() => _CustomTextInputState();
}

class _CustomTextInputState extends State<CustomTextInput> {
  bool _showClearButton = false;

  VoidCallback? _textListener;

  void _onTextChanged() {
    setState(() {
      _showClearButton = (widget.textController?.text.length ?? 0) > 0;
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.enableQuickClear) {
      _textListener = _onTextChanged;
      widget.textController?.addListener(_textListener!);
    }
  }

  @override
  void dispose() {
    if (_textListener != null) {
      widget.textController?.removeListener(_textListener!);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(
          textCapitalization: widget.capitalization == true
              ? TextCapitalization.characters
              : TextCapitalization.sentences,
          enabled: widget.enable,
          maxLines: widget.keyboardType == TextInputType.multiline ? null : 1,
          autocorrect: false,
          enableSuggestions: false,
          keyboardType: widget.keyboardType ?? TextInputType.multiline,
          controller: widget.textController,
          onChanged: widget.onTextChange,
          obscureText: widget.obscureText == null ? false : widget.obscureText!,
          validator: widget.validator,
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
              ),
          inputFormatters: widget.inputFormatters,
          decoration: InputDecoration(
            filled: true,
            errorText: widget.errorText,
            fillColor: widget.blur
                ? AppColors.textFieldDisableBackground
                : Colors.white,
            hintStyle: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: AppColors.mainTextColor,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                ),
            labelStyle: Theme.of(context).textTheme.bodyText1?.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.colorBorderGrey,
                width: widget.showBorder ? 1 : 0,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.colorLightBlue,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.colorError,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.colorError,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: widget.highlight
                    ? AppColors.colorLightBlue
                    : AppColors.colorBorderGrey,
                width: widget.showBorder ? 1 : 0,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            contentPadding:
                widget.containPadding ?? const EdgeInsets.only(left: 20.0),
            labelText: widget.labelText,
            hintText: widget.hintText,
            prefixIcon: widget.startIcon,
            suffixIcon: widget.enableQuickClear
                ? _showClearButton
                    ? _clearButton()
                    : null
                : widget.endIcon,
          ),
        ),
      ],
    );
  }

  Widget _clearButton() {
    return GestureDetector(
      onTap: _onTextClear,
      //Use container to increase touch area
      child: Container(
        color: Colors.transparent,
        child: Icon(
          Icons.highlight_off_outlined,
          color: AppColors.mainTextColor,
          size: 20.r,
        ),
      ),
    );
  }

  void _onTextClear() {
    widget.textController?.text = "";
    if (widget.onTextChange != null) widget.onTextChange!("");
  }
}
