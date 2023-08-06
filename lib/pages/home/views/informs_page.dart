import 'package:flutter/material.dart';

import '../../../constants/textstyles/textstyles.dart';
import '../../../constants/widgets/containers.dart';

class InformPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          imageContainer(),
          SizedBox(height: 50),
          Chip(label: Text('US Election')),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
                width: 336,
                child: Text(
                  'The latest situation in the presidential election',
                  style: Texts.title,
                )),
            Container(
                width: 320,
                child: Text(
                    'Leads in individual states may change from one party to another as all the votes are counted. Select a state for detailed results, and select the Senate, House or Governor tabs to view those races. For more detailed state results click on the States A-Z links at the bottom of this page. Results source: NEP/Edison via Reuters. Leads in individual states may change from one party to another as all the votes are counted. Select a state for detailed results, and select the Senate, House or Governor tabs to view those races. For more detailed state results click on the States A-Z links at the bottom of this page. Results source: NEP/Edison via Reuters.')),
          ])
        ],
      ),
    ));
  }
}
