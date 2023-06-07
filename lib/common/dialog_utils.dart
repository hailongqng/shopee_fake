import 'package:flutter/material.dart';
import 'package:shopee_fake/common/constants/app_colors.dart';

class DialogUtils {
  static void showDialog(
    BuildContext context,
    String message, {
    Function? onConfirmed,
    bool dismissible = true,
    String? btnTitle,
    String? iconAssert,
    TextAlign? textAlign,
  }) {
    void confirmClicked(BuildContext dialogContext) {
      Navigator.of(dialogContext).pop();
      onConfirmed?.call();
    }

    showGeneralDialog(
      barrierLabel: "Boston Scientific",
      barrierDismissible: dismissible,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 200),
      context: context,
      pageBuilder: (dialogContext, __, ___) {
        return Align(
          alignment: Alignment.center,
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 50, left: 12, right: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  iconAssert != null
                      ? const Icon(
                          Icons.warning,
                          size: 50,
                        )
                      : const SizedBox.shrink(),
                  SizedBox(
                    height: iconAssert != null ? 10 : 0,
                  ),
                  Text(
                    message,
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: textAlign ?? TextAlign.center,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                          AppColors.primaryColor),
                    ),
                    child: Text(
                      btnTitle ?? "OK",
                    ),
                    onPressed: () => confirmClicked(dialogContext),
                  ),
                  // SizedBox(
                  //   height: 10.h,
                  // ),
                ],
              ),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
              .animate(anim),
          child: child,
        );
      },
    );
  }
}
