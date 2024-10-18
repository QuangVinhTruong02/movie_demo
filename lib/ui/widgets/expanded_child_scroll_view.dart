import 'package:flutter/material.dart';

class ExpandedChildScrollView extends StatelessWidget {
  final Widget? child;
  final bool? reverse;
  final EdgeInsetsGeometry? padding;
  final Axis? scrollDirection;
  final ScrollBehavior? scrollBehavior;
  final ScrollPhysics? physics;
  final ScrollController? controller;

  const ExpandedChildScrollView(
      {super.key,
      this.child,
      this.reverse,
      this.padding,
      this.scrollDirection,
      this.scrollBehavior,
      this.physics,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: scrollBehavior ?? const ScrollBehavior(),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            key: key,
            padding: padding,
            physics: physics,
            reverse: reverse ?? false,
            controller: controller,
            scrollDirection: scrollDirection ?? Axis.vertical,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(child: child),
            ),
          );
        },
      ),
    );
  }
}
