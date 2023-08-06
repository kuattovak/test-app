import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

import '../colors/colors.dart';
import '../textstyles/textstyles.dart';

Widget optionContainer(String name, bool isSelected, Function() onTap) {
  return GestureDetector(
      onTap: onTap,
      child: Container(
          width: 160,
          height: 72,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: isSelected ? AppColors.main : AppColors.greyLighter),
          child: Center(
              child: Text(name,
                  style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                      fontSize: 16)))));
}

Widget homeContainers(
    {required String description,
    required String route,
    required BuildContext context,
    required String image}) {
  return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
          width: 316,
          height: 257,
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.greyLighter),
              borderRadius: BorderRadius.circular(16)),
          child: Column(
            children: [
              Container(
                height: 170,
                width: 336,
                decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(image)),
                    color: Colors.black12,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16))),
              ),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.greyLighter,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16))),
                width: 336,
                height: 80,
                child: Center(
                    child: Row(children: [
                  Container(
                      width: 290,
                      child: Text(description,
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w600))),
                  const Icon(FeatherIcons.heart)
                ])),
              )
            ],
          )));
}

Widget imageContainer() {
  return Container(
    width: 336,
    height: 192,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15), color: AppColors.greyLighter),
  );
}

Widget bookMarksContainer() {
  return SizedBox(
    width: 336,
    height: 96,
    child: Row(
      children: [
        Container(
          width: 96,
          height: 96,
          decoration: BoxDecoration(
              color: AppColors.greyDarker,
              borderRadius: BorderRadius.circular(12)),
        ),
        const SizedBox(width: 10),
        Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'UI/UX Design',
              style: Texts.subtitle,
            ),
            const SizedBox(height: 10),
            const SizedBox(
                width: 223,
                child: Text(
                  'A Simple Trick For Creating Color Palettes Quickly',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ))
          ],
        ))
      ],
    ),
  );
}

Widget profileContainer(String name, String mail) {
  return SizedBox(
      child: Row(
    children: [
      CircleAvatar(
        backgroundColor: AppColors.greyDarker,
        maxRadius: 30,
      ),
      SizedBox(
        width: 10,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name,
              style:
                  const TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
          Text(mail)
        ],
      )
    ],
  ));
}

Widget containerChoice({required String name, required Function() onTap}) {
  return Container(
    width: 336,
    height: 56,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: AppColors.fill,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
      onPressed: () {},
      child: Text(
        name,
        style:
            TextStyle(fontWeight: FontWeight.w600, color: AppColors.greyDarker),
      ),
    ),
  );
}
