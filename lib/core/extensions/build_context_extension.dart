import 'package:flutter/material.dart';
import 'package:upi_quick_qr/core/extensions/color_extension.dart';

extension LocalizedBuildContext on BuildContext {
  // AppLocalizations get loc => AppLocalizations.of(this)!;

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      showMaterialSnackBar(
    String content, {
    Color? backgroundColor,
    Color? color,
    SnackBarAction? action,
  }) {
    return ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        content: Text(
          content,
        ),
        behavior: SnackBarBehavior.floating,
        action: action,
      ),
    );
  }

  Future<T?> showMyDialog<T>(
      {required Widget child, bool isDismissible = true}) {
    return showDialog<T>(
        context: this,
        builder: (context) => child,
        barrierDismissible: isDismissible);
  }

  Future<T?> push<T>(Widget child) {
    return Navigator.of(this).push<T?>(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => child,
        transitionDuration: const Duration(milliseconds: 400),
        reverseTransitionDuration: const Duration(milliseconds: 400),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: Tween<double>(begin: 0.0, end: 1.0).animate(animation),
            child: FadeTransition(
              opacity: Tween<double>(begin: 1.0, end: 0.0)
                  .animate(secondaryAnimation),
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset.zero,
                    end: const Offset(-1.0, 0.0),
                  ).animate(secondaryAnimation),
                  child: child,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void pop<T>({T? result}) {
    return Navigator.of(this).pop(result);
  }

  // void popTillLast() {
  //   Navigator.of(this).popUntil((route) => route.isFirst);
  // }

  ScaffoldMessengerState showSnackBar(SnackBar snackBar) {
    return ScaffoldMessenger.of(this)
      ..clearSnackBars()
      ..showSnackBar(snackBar);
  }

  void showSucessSnackBar(Widget child,
      {bool? isDismissible,
      Duration? duration,
      SnackBarBehavior? behavior = SnackBarBehavior.fixed}) {
    ScaffoldMessenger.of(this)
      ..clearSnackBars()
      ..showSnackBar(SnackBar(
        content: child,
        behavior: behavior,
        backgroundColor: Colors.green,
        dismissDirection: isDismissible ?? true
            ? DismissDirection.down
            : DismissDirection.none,
        duration: duration ?? const Duration(seconds: 4),
      ));
  }

  Future<void> showErrorSnackBar(Widget child,
      {bool? isDismissible,
      Duration? duration,
      bool? showAlways,
      SnackBarBehavior? behavior = SnackBarBehavior.fixed}) async {
    ScaffoldMessenger.of(this)
      ..clearSnackBars()
      ..showSnackBar(SnackBar(
        content: child,
        backgroundColor: error,
        behavior: behavior,
        dismissDirection: isDismissible ?? true
            ? DismissDirection.down
            : DismissDirection.none,
        duration: (showAlways ?? false)
            ? const Duration(days: 365)
            : duration ?? const Duration(seconds: 4),
      ));
  }
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
}
