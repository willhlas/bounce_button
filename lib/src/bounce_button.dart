library bounce_button;

import 'package:flutter/material.dart';

/// Creates a widget that adds bounce animation to its child.
///
/// The [child] and [onTap] arguments must not be null.
class BounceButton extends StatefulWidget {
  /// Create a BounceButton.
  /// 
  /// The [child] and [onTap] arguments must not be null.
  const BounceButton({
    Key? key,
    required this.child,
    required this.onTap,
    this.onLongPress,
    this.duration = const Duration(milliseconds: 100),
    this.reverseDuration = const Duration(milliseconds: 100),
    this.upperBound = 0.08,
    this.reverse = false,
    this.elevation = 0.0,
    this.color,
    this.shadowColor,
    this.splashColor,
    this.borderRadius,
    this.height,
    this.width,
    this.padding,
  }) : super(key: key);
  
  /// The [child] contained by the [BounceButton].
  final Widget child;

  /// Method for when a tap occurs.
  final Function() onTap;

  /// Method for when pointer has remained in contact with the screen 
  /// for a long time at the same location.
  final Function()? onLongPress;

  /// The length of time this animation should last.
  final Duration duration;

  /// The length of time this animation should last when going in [reverse].
  final Duration reverseDuration;

  /// The value at which the animation is deemed to be completed.
  final double upperBound;

  /// Whether the [BounceButton] will animate "upwards" or "downwards".
  final bool reverse;

  /// This controls the size of the shadow below the material and the opacity
  /// of the elevation overlay color if it is applied.
  final double elevation;
  
  /// The color of the [BounceButton].
  final Color? color;

  /// The shadow color of the [BounceButton].
  final Color? shadowColor;

  /// The splash color of the [BounceButton] when 
  /// [onTap] or [onLongPress] is triggered.
  final Color? splashColor;

  /// The radius of the [BounceButton] corners.
  final BorderRadiusGeometry? borderRadius;

  /// The inside height of the [BounceButton].
  final double? height;

  /// The inside width of the [BounceButton].
  final double? width;

  /// The inside padding of the [BounceButton]
  final EdgeInsets? padding;

  @override
  State<StatefulWidget> createState() => _BounceButtonState();

}

class _BounceButtonState extends State<BounceButton> 
    with SingleTickerProviderStateMixin {

  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: widget.duration,
      reverseDuration: widget.reverseDuration,
      upperBound: widget.upperBound,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, child) {
        return Transform.scale(
          scale: widget.reverse 
            ? 1 + controller.value
            : 1 - controller.value,
          child: child,
        );
      },
      child: Theme(
        data: Theme.of(context),
        child: Material(
          elevation: widget.elevation,
          color: widget.color,
          shadowColor: widget.shadowColor,
          borderRadius: widget.borderRadius,
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: widget.onTap,
            onLongPress: widget.onLongPress,
            onTapDown: (_) => controller.forward(),
            onTapCancel: controller.reverse,
            onHighlightChanged: (_) => controller.reverse(),
            splashColor: widget.splashColor,
            child: Container(
              height: widget.height,
              width: widget.width,
              padding: widget.padding,
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }

}
