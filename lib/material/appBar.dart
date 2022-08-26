import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_json/material/colors.dart';

class ProjectAppBar extends StatelessWidget {
  ProjectAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ProjectColors.orange,
    );
  }
}
