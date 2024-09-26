import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_e_store/app/navigation/router.dart';
import 'package:flutter_e_store/app/theme/new_theme.dart';

typedef ObsecureWidgetBuilderCb = Widget? Function(
  bool obscured,
  bool hovering,
);
typedef OnChangedCb = Function(String value);
typedef Validator = String? Function(String?);

class CustomTextField extends StatefulWidget {
  final Widget? prefixIcon, suffixIcon;
  final ObsecureWidgetBuilderCb? suffixBuilder;
  final String? hintText;
  final String labelText;
  final TextStyle? labelStyle;
  final TextStyle? style;
  final OnChangedCb? onChanged;
  final Function(String value)? onSubmit;
  final VisualDensity visualDensity;
  final bool shadow;
  final bool isReadOnly;
  final String initialValue;
  final int maxLines;
  final Validator? validator;
  final TextInputType keyboardType;
  final bool? enableInteractiveSelection;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final bool isRequired;
  final bool liveValidation;
  final FocusNode? focusNode;
  final bool? autoFocus;
  final int? maxLength;
  final bool noBackgroundColor;
  final double padding;

  CustomTextField._({
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    required this.labelText,
    this.labelStyle,
    this.style,
    this.suffixBuilder,
    this.focusNode,
    this.onChanged,
    this.onSubmit,
    this.visualDensity = VisualDensity.standard,
    required this.shadow,
    required this.isReadOnly,
    required this.maxLines,
    required this.initialValue,
    this.validator,
    required this.keyboardType,
    this.enableInteractiveSelection,
    this.inputFormatters,
    this.controller,
    this.autoFocus,
    required this.isRequired,
    required this.liveValidation,
    this.maxLength,
    this.noBackgroundColor = false,
    this.padding = 8.0,
  }) {}

  factory CustomTextField({
    Key? key,
    Widget? prefixIcon,
    Widget? suffixIcon,
    String? hintText,
    required String labelText,
    TextStyle? labelStyle,
    TextStyle? style,
    OnChangedCb? onChanged,
    Function(String value)? onSubmit,
    VisualDensity visualDensity = VisualDensity.standard,
    bool shadow = true,
    bool isReadOnly = false,
    int maxLines = 1,
    Validator? validator,
    List<TextInputFormatter> inputFormatters = const [],
    TextInputType keyboardType = TextInputType.text,
    bool enableInteractiveSelection = true,
    TextEditingController? controller,
    String initialValue = '',
    bool liveValidation = false,
    FocusNode? focusNode,
    required bool isRequired,
    int? maxLength,
    bool noBackgroundColor = false,
    double padding = 8.0,
  }) =>
      CustomTextField._(
        hintText: hintText ?? "",
        labelText: labelText,
        labelStyle: labelStyle,
        style: style,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        visualDensity: visualDensity,
        onChanged: onChanged,
        onSubmit: onSubmit,
        shadow: shadow,
        isReadOnly: isReadOnly,
        key: key,
        initialValue: initialValue,
        maxLines: maxLines,
        validator: validator,
        keyboardType: keyboardType,
        enableInteractiveSelection: enableInteractiveSelection,
        inputFormatters: inputFormatters,
        controller: controller,
        isRequired: isRequired,
        liveValidation: liveValidation,
        focusNode: focusNode,
        maxLength: maxLength,
        noBackgroundColor: noBackgroundColor,
        padding: padding,
      );

  factory CustomTextField.obscure({
    Key? key,
    bool liveValidation = false,
    Widget? prefixIcon,
    ObsecureWidgetBuilderCb? suffixBuilder,
    OnChangedCb? onChanged,
    Function(String value)? onSubmit,
    String? hintText,
    required String labelText,
    VisualDensity visualDensity = VisualDensity.standard,
    bool shadow = true,
    bool isReadOnly = false,
    Validator? validator,
    List<TextInputFormatter> inputFormatters = const [],
    TextInputType keyboardType = TextInputType.number,
    bool? enableInteractiveSelection,
    TextEditingController? controller,
    String initialValue = '',
    bool? autoFocus,
    required bool isRequired,
    FocusNode? focusNode,
    int? maxLength,
    double padding = 8.0,
  }) =>
      CustomTextField._(
        hintText: hintText ?? "",
        labelText: labelText,
        prefixIcon: prefixIcon,
        key: key,
        onChanged: onChanged,
        onSubmit: onSubmit,
        visualDensity: visualDensity,
        suffixBuilder: suffixBuilder,
        shadow: shadow,
        isReadOnly: isReadOnly,
        initialValue: initialValue,
        maxLines: 1,
        validator: validator,
        keyboardType: keyboardType,
        enableInteractiveSelection: enableInteractiveSelection,
        inputFormatters: inputFormatters,
        controller: controller,
        isRequired: isRequired,
        liveValidation: liveValidation,
        focusNode: focusNode,
        autoFocus: autoFocus,
        maxLength: maxLength,
        padding: padding,
      );

  @override
  State<CustomTextField> createState() => _CompCustomTextfieldState();
}

class _CompCustomTextfieldState extends State<CustomTextField> {
  bool focusing = false, showing = true;
  bool get isObscureMode => widget.suffixBuilder != null;
  String? liveError = "";
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    if (widget.focusNode != null) {
      widget.focusNode!.addListener(() {
        setState(() {
          focusing = widget.focusNode!.hasFocus;
        });
      });
    }

    if (isObscureMode) {
      setState(() {
        showing = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          decoration: BoxDecoration(
              color: context.whiteColor.shade100,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                  color: hasError ? Colors.red : context.greyColor.shade300)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: widget.padding),
            child: Center(
              child: TextFormField(
                style: context.textTheme.subheadlineRegular.copyWith(
                    color: globalCtx.greyColor.shade600,
                    decoration: TextDecoration.none),
                textAlign: widget.labelText == 'İşlem Tutarı'
                    ? TextAlign.right
                    : TextAlign.start,
                autofocus: widget.autoFocus ?? false,
                expands: widget.maxLines != 1,
                controller: widget.controller,
                inputFormatters: widget.inputFormatters,
                keyboardType: widget.keyboardType,
                enableInteractiveSelection: widget.enableInteractiveSelection,
                maxLines: widget.maxLines != 1 ? null : 1,
                minLines: widget.maxLines != 1 ? null : 1,
                maxLength: widget.hintText == '00' ? 2 : widget.maxLength,
                onChanged: (value) {
                  setState(() {
                    liveError = widget.validator?.call(value);
                    hasError = !(liveError?.isEmpty ?? true);
                  });
                  if (widget.onChanged != null) {
                    widget.onChanged!(value);
                  }
                },
                onSaved: (newValue) {},
                onFieldSubmitted: (value) {
                  if (widget.onSubmit != null) {
                    widget.onSubmit!(value);
                  }
                },
                obscureText: isObscureMode & !showing,
                focusNode: widget.focusNode,
                initialValue:
                    widget.controller == null ? widget.initialValue : null,
                readOnly: widget.isReadOnly,
                decoration: InputDecoration(
                  suffixIconConstraints:
                      const BoxConstraints(minHeight: 24, minWidth: 24),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorText: widget.liveValidation ? liveError : null,
                  errorMaxLines: 1,
                  labelStyle: widget.labelStyle ??
                      context.textTheme.footnoteEmphasized
                          .copyWith(color: globalCtx.greyColor.shade400),
                  hintStyle: widget.labelStyle ??
                      context.textTheme.footnoteEmphasized
                          .copyWith(color: globalCtx.greyColor.shade400),
                  hintText:
                      "${widget.labelText} ${widget.isRequired ? "(*)" : ""}",
                  prefixIcon: widget.prefixIcon,
                  suffixIcon: isObscureMode
                      ? GestureDetector(
                          onTap: () => setState(() => showing = !showing),
                          child: widget.suffixBuilder!(
                            !showing,
                            focusing,
                          ),
                        )
                      : widget.suffixIcon,
                ),
              ),
            ),
          ),
        ),
        hasError
            ? Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      liveError ?? "",
                      style: context.textTheme.footnoteRegular
                          .copyWith(color: Colors.red),
                    ),
                  ),
                ],
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
