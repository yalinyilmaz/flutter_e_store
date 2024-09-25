import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_e_store/app/navigation/router.dart';
import 'package:flutter_e_store/app/theme/new_theme.dart';

typedef _WidgetBuilderCb = Widget? Function(
  bool hovering,
);
typedef _ObsecureWidgetBuilderCb = Widget? Function(
  bool obscured,
  bool hovering,
);
typedef _OnChangedCb = Function(String value);
typedef _Validator = String? Function(String?);

class NewCompCustomTextField extends StatefulWidget {
  final _WidgetBuilderCb? prefixIconBuilder, suffixIconBuilder;
  final _ObsecureWidgetBuilderCb? suffixBuilder;
  final String? hintText;
  final String labelText;
  final TextStyle? labelStyle;
  final TextStyle? style;
  final _OnChangedCb? onChanged;
  final Function(String value)? onSubmit;
  final VisualDensity visualDensity;
  final bool shadow;
  final bool isReadOnly;
  final String initialValue;
  final int maxLines;
  final _Validator? validator;
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

  NewCompCustomTextField._({
    super.key,
    this.prefixIconBuilder,
    this.suffixIconBuilder,
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
  }) {}

  factory NewCompCustomTextField({
    Key? key,
    _WidgetBuilderCb? prefixIconBuilder,
    _WidgetBuilderCb? suffixIconBuilder,
    String? hintText,
    required String labelText,
    TextStyle? labelStyle,
    TextStyle? style,
    _OnChangedCb? onChanged,
    Function(String value)? onSubmit,
    VisualDensity visualDensity = VisualDensity.standard,
    bool shadow = true,
    bool isReadOnly = false,
    int maxLines = 1,
    _Validator? validator,
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
  }) =>
      NewCompCustomTextField._(
        hintText: hintText ?? "",
        labelText: labelText,
        labelStyle: labelStyle,
        style: style,
        prefixIconBuilder: prefixIconBuilder,
        suffixIconBuilder: suffixIconBuilder,
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
      );

  factory NewCompCustomTextField.obscure({
    Key? key,
    bool liveValidation = false,
    _WidgetBuilderCb? prefixIconBuilder,
    _ObsecureWidgetBuilderCb? suffixBuilder,
    _OnChangedCb? onChanged,
    Function(String value)? onSubmit,
    String? hintText,
    required String labelText,
    VisualDensity visualDensity = VisualDensity.standard,
    bool shadow = true,
    bool isReadOnly = false,
    _Validator? validator,
    List<TextInputFormatter> inputFormatters = const [],
    TextInputType keyboardType = TextInputType.number,
    bool? enableInteractiveSelection,
    TextEditingController? controller,
    String initialValue = '',
    bool? autoFocus,
    required bool isRequired,
    FocusNode? focusNode,
    int? maxLength,
  }) =>
      NewCompCustomTextField._(
        hintText: hintText ?? "",
        labelText: labelText,
        prefixIconBuilder: prefixIconBuilder,
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
      );

  @override
  State<NewCompCustomTextField> createState() => _CompCustomTextfieldState();
}

class _CompCustomTextfieldState extends State<NewCompCustomTextField> {
  late final focusNode = widget.focusNode;
  bool focusing = false, showing = true;
  bool get isObscureMode => widget.suffixBuilder != null;
  var text = '';

  String? liveError = "";
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    if (focusNode != null) {
      focusNode!.addListener(() {
        setState(() {
          focusing = focusNode!.hasFocus;
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
          padding: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              globalCtx.mainColor.shade800,
              globalCtx.mainColor.shade400
            ]),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextFormField(
            style: context.textTheme.subheadlineRegular.copyWith(
                color: globalCtx.whiteColor.shade50,
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
                text = value;
                liveError = widget.validator?.call(text);
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
            focusNode: focusNode,
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
                  context.textTheme.subheadlineRegular
                      .copyWith(color: globalCtx.whiteColor.shade50),
              labelText: widget.labelText == '00'
                  ? null
                  : [VisualDensity.comfortable, VisualDensity.standard]
                          .contains(widget.visualDensity)
                      ? '${widget.labelText} ${widget.isRequired ? '(*)' : ''}'
                      : '',
              prefixIcon: widget.prefixIconBuilder != null
                  ? widget.prefixIconBuilder!(focusing)
                  : null,
              suffixIcon: isObscureMode
                  ? GestureDetector(
                      onTap: () => setState(() => showing = !showing),
                      child: widget.suffixBuilder!(
                        !showing,
                        focusing,
                      ),
                    )
                  : widget.suffixIconBuilder != null
                      ? widget.suffixIconBuilder!(focusing)
                      : null,
            ),
          ),
        ),
        hasError
            ? Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        liveError ?? "",
                        style: context.textTheme.footnoteRegular
                            .copyWith(color: const Color(0xff0DFFF3)),
                      ),
                    ),
                  ],
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}

extension on BuildContext {
  get mainColor => null;
}

