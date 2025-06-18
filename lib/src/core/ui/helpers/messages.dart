import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

mixin Messages<T extends StatefulWidget> on State<T> {
  /// Returns a message to be displayed when no data is available.
  void showError(String message) {
    _showSnackbar(AwesomeSnackbarContent(title: 'Error', message: message, contentType: ContentType.failure));
  }

  void showWarning(String message) {
    _showSnackbar(AwesomeSnackbarContent(title: 'Atenção', message: message, contentType: ContentType.warning));
  }

  void showInfo(String message) {
    _showSnackbar(AwesomeSnackbarContent(title: 'Atenção', message: message, contentType: ContentType.help));
  }

  void showSuccess(String message) {
    _showSnackbar(AwesomeSnackbarContent(title: 'Sucesso', message: message, contentType: ContentType.success));
  }

  void _showSnackbar(AwesomeSnackbarContent content) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        content: content,
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        padding: EdgeInsets.only(top: 72),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
