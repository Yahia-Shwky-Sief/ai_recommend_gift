import 'package:flutter/material.dart';

logo(context)=>ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) => LinearGradient(
            colors: [
              Theme.of(context).brightness == Brightness.light
                  ? Colors.black
                  : Colors.white,
              Theme.of(context).brightness == Brightness.light
                  ? Theme.of(context).primaryColorLight
                  : Theme.of(context).primaryColor,
            ],
            stops: const [0.6, 1],

            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
          child: Text(
            'AI Gift Finder',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        );