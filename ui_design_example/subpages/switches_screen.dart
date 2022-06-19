import 'package:esnya/presentation/core/design_components/esnya_button.dart';
import 'package:esnya/presentation/core/design_components/esnya_colors.dart';
import 'package:esnya/presentation/core/design_components/esnya_icon_button.dart';
import 'package:esnya/presentation/core/design_components/esnya_icon_switch.dart';
import 'package:esnya/presentation/core/design_components/esnya_icons.dart';
import 'package:esnya/presentation/core/design_components/esnya_sizes.dart';
import 'package:esnya/presentation/core/design_components/esnya_switch.dart';
import 'package:flutter/material.dart';

class SwitchesScreen extends StatefulWidget {
  const SwitchesScreen({Key? key}) : super(key: key);

  @override
  State<SwitchesScreen> createState() => _SwitchesScreenState();
}

class _SwitchesScreenState extends State<SwitchesScreen> {
  var switches = [true, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(EsnyaSizes.base * 2),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            EsnyaIconSwitch.checkCross(
              value: switches[0],
              onChange: (val) {
                setState(() {
                  switches[0] = val;
                });
              },
            ),
            SizedBox(
              height: 8,
            ),
            EsnyaIconSwitch.checkCross(
              value: switches[1],
              onChange: (val) {
                setState(() {
                  switches[1] = val;
                });
              },
            ),
            Divider(),
            EsnyaSwitch(
              leftText: "20 cans (3400 g)",
              rightText: "100 g",
              value: switches[0],
              onChange: (val) {
                setState(() {
                  switches[0] = val;
                });
              },
            ),
            SizedBox(
              height: 8,
            ),
            EsnyaSwitch(
              leftText: "20 cans",
              rightText: "100 g",
              value: switches[1],
              onChange: (val) {
                setState(() {
                  switches[1] = val;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
