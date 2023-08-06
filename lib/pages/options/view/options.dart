import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';
import '../../../constants/colors/colors.dart';
import '../../../constants/textstyles/textstyles.dart';
import '../../../constants/widgets/buttons.dart';
import '../../../constants/widgets/containers.dart';

class OptionsPage extends StatefulWidget {
  State<OptionsPage> createState() => _OptionsPageState();
}

class _OptionsPageState extends State<OptionsPage> {
  final user = FirebaseAuth.instance.currentUser!;

  List<String> selectedTopics = [];

  @override
  void initState() {
    super.initState();
    selectedTopics = [];
  }

  void _toggleTopic(String topic) {
    setState(() {
      if (selectedTopics.contains(topic)) {
        selectedTopics.remove(topic);
      } else {
        if (selectedTopics.length <= 5) {
          selectedTopics.add(topic);
          print(selectedTopics);
        } else {
          print('You can only choose up to 3 topics.');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final DatabaseReference topics = FirebaseDatabase.instance.ref(user.uid);
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Select your favorite topics', style: Texts.title),
                  const SizedBox(height: 5),
                  Text(
                    'Select some of your favorite topics to let us suggest better news for you.',
                    style: Texts.subtitle,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                optionContainer(
                    '🏈 Sports', selectedTopics.contains('🏈 Sports'), () {
                  _toggleTopic('🏈 Sports');
                }),
                const SizedBox(width: 30),
                optionContainer(
                    '⚖️ Politics', selectedTopics.contains('⚖️ Politics'), () {
                  _toggleTopic('⚖️ Politics');
                }),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                optionContainer('🌞 Life', selectedTopics.contains('🌞 Life'),
                    () {
                  _toggleTopic('🌞 Life');
                }),
                const SizedBox(width: 30),
                optionContainer(
                    '🎮 Gaming', selectedTopics.contains('🎮 Gaming'), () {
                  _toggleTopic('🎮 Gaming');
                }),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                optionContainer(
                    '🐻 Animals', selectedTopics.contains('🐻 Animals'), () {
                  _toggleTopic('🐻 Animals');
                }),
                const SizedBox(width: 30),
                optionContainer(
                    '🌴 Nature', selectedTopics.contains('🌴 Nature'), () {
                  _toggleTopic('🌴 Nature');
                }),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                optionContainer('🍔 Food', selectedTopics.contains('🍔 Food'),
                    () {
                  _toggleTopic('🍔 Food');
                }),
                const SizedBox(width: 30),
                optionContainer('🎨 Art', selectedTopics.contains('🎨 Art'),
                    () {
                  _toggleTopic('🎨 Art');
                }),
              ],
            ),
            // Add similar rows for other topics
            const SizedBox(height: 50),
            MainButton(
              title: Text('Next', style: Texts.buttonsTitle),
              color: AppColors.main,
              border: const Border(),
              route: () {
                topics.update({
                  'topics': [selectedTopics]
                });
                if (selectedTopics.length >= 3) {
                  Navigator.pushNamed(context, 'homePage');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
