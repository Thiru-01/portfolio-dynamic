import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:portfolio/constant.dart';

class CustomCard extends StatelessWidget {
  final String eduData;
  final String location;
  final String percent;
  final String detials;
  const CustomCard({
    Key? key,
    required this.eduData,
    required this.location,
    required this.percent,
    required this.detials,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: dHeight(context) * 0.4,
      width: dWidth(context) * 0.25,
      decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                color: cardColor,
                spreadRadius: 2.0,
                blurRadius: 20.0,
                offset: Offset(3.0, 3.0))
          ]),
      child: Padding(
        padding: EdgeInsets.all(dWidth(context) * 0.01),
        child: cardData(
          context: context,
          eduData: eduData,
          percent: "88.8",
          place: "Puducherry",
          detials: detials,
        ),
      ),
    );
  }

  Column cardData(
      {required BuildContext context,
      required String eduData,
      required String detials,
      required,
      required String place,
      required String percent}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        FittedBox(
          child: Text(
            eduData,
            style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 17.0 * text(context)),
          ),
        ),
        Text(
          detials,
          textAlign: TextAlign.justify,
          overflow: TextOverflow.fade,
        ),
        rowTextIcon(
            context: context, text: place, icon: FontAwesomeIcons.locationDot),
        rowTextIcon(
            context: context, text: "88.8", icon: FontAwesomeIcons.percent),
      ],
    );
  }

  Row rowTextIcon(
      {required BuildContext context,
      required String text,
      required IconData icon}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          icon,
          color: bodyTextColor,
          size: dsize(context) * 0.05,
        ),
        FittedBox(
            child: Text(
          text,
          style: const TextStyle(color: primaryColor),
        ))
      ],
    );
  }
}

Widget textFormField(
    String name, BuildContext context, IconData icon, RxString rxvalue) {
  return SizedBox(
    width: dWidth(context) * 0.3,
    child: TextFormField(
      onSaved: (value) {
        rxvalue.value = value!;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "Please Enter $name";
        }
        return null;
      },
      decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: secondaryColor,
          ),
          contentPadding: EdgeInsets.only(
              top: dHeight(context) * 0.02,
              left: dWidth(context) * 0.008,
              right: dWidth(context) * 0.008),
          hintText: name,
          hintStyle: const TextStyle(color: bodyTextColor)),
      style: const TextStyle(
        color: primaryColor,
      ),
    ),
  );
}
