import 'package:flutter/material.dart';

class SnackBarCustom {
  static void _show(BuildContext context, {required Color color, required String text, Duration duration = const Duration(seconds: 5)}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        elevation: 8.0,
        backgroundColor: color,
        duration: duration,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
        padding: EdgeInsets.zero,
        content: LayoutBuilder(builder: (context, sizes) {
          return SizedBox(
            height: 60,
            width: sizes.maxWidth,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.error_outline,
                    color: Colors.white,
                    size: 30,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      text,
                      style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white, fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  static void showError(
    BuildContext context, {
    String message = 'Ocorreu um erro inesperado',
    Color color = const Color.fromARGB(176, 255, 0, 0),
  }) {
    _show(context, text: message, color: color);
  }

  static void showSuccess(BuildContext context, {String message = 'Sucesso', Color color = const Color.fromARGB(215, 18, 253, 139)}) {
    _show(context, text: message, color: color);
  }

  static void showWarning(BuildContext context, {String message = 'Necessario Atenção', Color color = const Color.fromARGB(255, 255, 207, 35)}) {
    _show(context, text: message, color: color);
  }
}
