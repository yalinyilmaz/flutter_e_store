import 'package:flutter/material.dart';
import 'package:flutter_e_store/app/components/custom_buttons/new_custom_elevated_button.dart';
import 'package:flutter_e_store/app/navigation/router.dart';
import 'package:flutter_e_store/app/theme/new_theme.dart';
import 'package:go_router/go_router.dart';

enum MessageDialogPurpose {
  warning(AssetImage('assets/icons/info.png')),
  success(AssetImage('assets/icons/success.png'));

  final AssetImage image;

  const MessageDialogPurpose(this.image);
}

class MessageDialog {
  static twoButtons({
    required MessageDialogPurpose purpose,
    VoidCallback? onBackButtonPressed,
    VoidCallback? onForwardButtonPressed,
    String? caption,
    dynamic content,
    EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 20),
    String backButtonText = 'Geri',
    String forwardButtonText = 'İleri',
  }) {
    return showDialog(
      context: globalCtx,
      barrierDismissible: false,
      builder: (context) => _buildAlertBox(
        caption: caption,
        content: content,
        purpose: purpose,
        padding: padding,
        footer: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            children: [
              Expanded(
                child: CustomElevatedButton(
                  isPrimary: false,
                  text: backButtonText,
                  buttonSize: ButtonSize.medium,
                  onButtonPressed: (p0) {
                    if (onBackButtonPressed != null) {
                      onBackButtonPressed.call();
                    } else {
                      globalCtx.pop();
                    }
                  },
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: CustomElevatedButton(
                  text: forwardButtonText,
                  buttonSize: ButtonSize.medium,
                  onButtonPressed: (p0) {
                    if (onForwardButtonPressed != null) {
                      onForwardButtonPressed.call();
                    } else {
                      globalCtx.pop();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static singleButton({
    required MessageDialogPurpose purpose,
    VoidCallback? onButtonPressed,
    String? caption,
    dynamic content,
    EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 20),
    String buttonText = 'Tamam',
  }) {
    return showDialog(
      context: globalCtx,
      barrierDismissible: false,
      builder: (context) => _buildAlertBox(
        caption: caption,
        content: content,
        purpose: purpose,
        padding: padding,
        footer: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: CustomElevatedButton(
            text: buttonText,
            buttonSize: ButtonSize.medium,
            onButtonPressed: (p0) {
              if (onButtonPressed != null) {
                onButtonPressed.call();
              } else {
                globalCtx.pop();
              }
            },
          ),
        ),
      ),
    );
  }

  static noButton({
    required MessageDialogPurpose purpose,
    VoidCallback? onButtonPressed,
    String? caption,
    dynamic content,
    EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 20),
    String buttonText = 'Tamam',
  }) {
    return showDialog(
      context: globalCtx,
      barrierDismissible: true,
      builder: (context) => _buildAlertBox(
        caption: caption,
        content: content,
        purpose: purpose,
        padding: padding,
        footer: const SizedBox(),
      ),
    );
  }

  static _buildAlertBox({
    required MessageDialogPurpose purpose,
    String? caption,
    dynamic content,
    required Widget footer,
    EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 20),
  }) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      contentPadding: EdgeInsets.zero,
      insetPadding: padding,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
                color: globalCtx.whiteColor.shade200,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(24))),
            child: Container(
              height: MediaQuery.sizeOf(globalCtx).height * .2,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: purpose.image,
                  scale: 2.3,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: globalCtx.whiteColor.shade50,
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(24))),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  caption != null
                      ? Text(
                          caption,
                          style: globalCtx.textTheme.title1Emphasized
                              .copyWith(color: globalCtx.darkColor.shade400),
                        )
                      : const SizedBox.shrink(),
                  const SizedBox(height: 25),
                  content != null
                      ? Text(
                          content,
                          style: globalCtx.textTheme.calloutRegular
                              .copyWith(color: globalCtx.darkColor.shade400),
                          textAlign: TextAlign.center,
                        )
                      : const SizedBox.shrink(),
                  const SizedBox(height: 25),
                  footer
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
