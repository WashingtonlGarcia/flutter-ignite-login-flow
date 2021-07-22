import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback onTap;

  const ButtonWidget({Key? key,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(4),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(4),
        child: SizedBox(
          height: 54,
          child: Align(
            child: Text('Entrar', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Theme.of(context).scaffoldBackgroundColor)),
          ),
        ),
      ),
    );
  }
}
