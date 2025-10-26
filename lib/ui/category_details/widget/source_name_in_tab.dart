import 'package:flutter/material.dart';

import '../../../model/sourceResponse.dart';

class SourceNameInTab extends StatelessWidget {
  SourceNameInTab({super.key, required this.source, required this.isSelected});

  Sources source;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Text(
      source.name!,
      style: isSelected
          ? Theme.of(context).textTheme.labelLarge
          : Theme.of(context).textTheme.labelMedium,
    );
  }
}
