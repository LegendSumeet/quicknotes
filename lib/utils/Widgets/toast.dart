import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart'; // Ensure you have the necessary package

enum ResponseStatus { success, error, info }

void showCustomToast({
  required BuildContext context,
  required String title,
  required String description,
  required ResponseStatus status,
}) {
  Color primaryColor;
  IconData icon;
  ToastificationType type;

  switch (status) {
    case ResponseStatus.success:
      primaryColor = Colors.green;
      icon = Icons.check;
      type = ToastificationType.success;
      break;
    case ResponseStatus.error:
      primaryColor = Colors.red;
      icon = Icons.error;
      type = ToastificationType.error;
      break;
    case ResponseStatus.info:
      primaryColor = Colors.blue;
      icon = Icons.info;
      type = ToastificationType.info;
      break;
  }

  toastification.show(
    context: context,
    type: type,
    style: ToastificationStyle.flat,
    autoCloseDuration: const Duration(seconds: 5),
    title: Text(title),
    description: RichText(text: TextSpan(text: description)),
    alignment: Alignment.topRight,
    direction: TextDirection.ltr,
    animationDuration: const Duration(milliseconds: 300),
    animationBuilder: (context, animation, alignment, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
    icon: Icon(icon),
    primaryColor: primaryColor,
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    borderRadius: BorderRadius.circular(12),
    boxShadow: const [
      BoxShadow(
        color: Color(0x07000000),
        blurRadius: 16,
        offset: Offset(0, 16),
        spreadRadius: 0,
      )
    ],
    showProgressBar: true,
    closeButtonShowType: CloseButtonShowType.onHover,
    closeOnClick: false,
    pauseOnHover: true,
    dragToClose: true,
    applyBlurEffect: true,
    callbacks: ToastificationCallbacks(
      onTap: (toastItem) => print('Toast ${toastItem.id} tapped'),
      onCloseButtonTap: (toastItem) =>
          print('Toast ${toastItem.id} close button tapped'),
      onAutoCompleteCompleted: (toastItem) =>
          print('Toast ${toastItem.id} auto complete completed'),
      onDismissed: (toastItem) => print('Toast ${toastItem.id} dismissed'),
    ),
  );
}
