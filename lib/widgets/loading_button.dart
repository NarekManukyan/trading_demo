import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../extensions/extensions.dart';

class LoadingButton extends HookWidget {
  const LoadingButton({
    required this.child,
    Key? key,
    this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
    this.style,
  }) : super(key: key);

  final Widget child;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isDisabled;
  final ButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (isLoading) {
      child = const CircularProgressIndicator.adaptive();
    } else {
      child = this.child;
    }
    return ElevatedButton(
      onPressed: isDisabled || isLoading ? null : onPressed,
      style: style ?? context.theme.elevatedButtonStyle,
      child: child,
    );
  }
}
