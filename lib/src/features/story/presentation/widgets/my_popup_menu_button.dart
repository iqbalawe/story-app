import 'package:flutter/material.dart';

class MyPopupMenuButton extends StatelessWidget {
  const MyPopupMenuButton({required this.onSelected, super.key});

  final Function(String) onSelected;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Icon(
        Icons.language_outlined,
        color: Theme.of(context).appBarTheme.foregroundColor,
      ),
      onSelected: onSelected,
      itemBuilder: (context) {
        return <PopupMenuEntry<String>>[
          const PopupMenuItem<String>(
            value: 'id',
            child: Row(children: [Text('🇮🇩  Indonesia')]),
          ),
          const PopupMenuItem<String>(
            value: 'en',
            child: Row(children: [Text('🇺🇸  English')]),
          ),
        ];
      },
    );
  }
}
