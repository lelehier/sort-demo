import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget {
  final Icon icon;
  final String text;
  final VoidCallback? onPressed;
  const SettingsItem(this.icon, this.text, {this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
      child: ElevatedButton(
        style: const ButtonStyle(
          visualDensity: VisualDensity(horizontal: 2, vertical: 4),
        ),
        onPressed: (onPressed == null) ? () => () {} : onPressed,
        child: Row(
          children: [
            icon,
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          ],
        ),
      ),
    );
  }
}
