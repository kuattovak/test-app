import 'package:flutter/material.dart';

import '../../../constants/textstyles/textstyles.dart';
import '../../../constants/widgets/containers.dart';

class BookMarks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(left: 20, top: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Bookmarks',
            style: Texts.title,
          ),
          Text(
            'Saved articles to the library',
            style: Texts.subtitle,
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          bookMarksContainer(),
                          const SizedBox(height: 15)
                        ]);
                  }))
        ],
      ),
    ));
  }
}
