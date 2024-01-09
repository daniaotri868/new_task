import 'package:flutter/cupertino.dart';
import 'package:remy/core/utils/extensions/build_context.dart';


class EmptyScreen extends StatelessWidget {
  const EmptyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("فارغ", style: context.textTheme.titleLarge),
    );
  }
}
