import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:toktik_app/config/helpers/human_formats.dart';

class VideoButtons extends StatelessWidget {
  final int likes;
  final int views;

  const VideoButtons({super.key, this.likes = 0, this.views = 0});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomIconButton(
            iconColor: Colors.red, icon: Icons.favorite, value: likes),
        const SizedBox(height: 10),
        _CustomIconButton(icon: Icons.remove_red_eye_outlined, value: views),
        const SizedBox(height: 10),
        SpinPerfect(
          duration: const Duration(seconds: 5),
          infinite: true,
          child: const _CustomIconButton(
            icon: Icons.play_circle_outline_outlined,
          ),
        ),
      ],
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  final int value;
  final IconData icon;
  final Color? color;

  const _CustomIconButton({
    this.value = 0,
    required this.icon,
    iconColor,
  }) : color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            icon,
            size: 30,
          ),
          color: color,
        ),
        if (value > 0)
          Text(
            HumanFormats.humanReadbleNumber(value.toDouble()),
          )
      ],
    );
  }
}
