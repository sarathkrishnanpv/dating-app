import 'package:flutter/material.dart';

class Heading10font500 extends StatelessWidget {
  const Heading10font500(
      {super.key, required this.heading, required this.color});
  final String heading;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(heading,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: 'Manrope',
            fontSize: 10,
            color: color));
  }
}

class Heading11font500 extends StatelessWidget {
  const Heading11font500(
      {super.key, required this.heading, required this.color});
  final String heading;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(heading,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: 'Manrope',
            fontSize: 11,
            color: color));
  }
}

class Heading12font500 extends StatelessWidget {
  const Heading12font500(
      {super.key, required this.heading, required this.color});
  final String heading;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(heading,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: 'Manrope',
            fontSize: 12,
            color: color));
  }
}

class Heading15font700 extends StatelessWidget {
  const Heading15font700(
      {super.key, required this.heading, required this.color});
  final String heading;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(heading,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.w700,
            fontFamily: 'Manrope',
            fontSize: 15,
            color: color));
  }
}

class Heading17font700 extends StatelessWidget {
  const Heading17font700(
      {super.key, required this.heading, required this.color});
  final String heading;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(heading,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.w700,
            fontFamily: 'Manrope',
            fontSize: 17,
            color: color));
  }
}

class Heading12font600 extends StatelessWidget {
  const Heading12font600(
      {super.key, required this.heading, required this.color});
  final String heading;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(heading,
        textAlign: TextAlign.right,
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: 'Manrope',
            fontSize: 12,
            color: color));
  }
}

class Heading14font600 extends StatelessWidget {
  const Heading14font600(
      {super.key, required this.heading, required this.color});
  final String heading;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(heading,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: 'Manrope',
            fontSize: 14,
            color: color));
  }
}

class Heading18font700 extends StatelessWidget {
  const Heading18font700(
      {super.key, required this.heading, required this.color});
  final String heading;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(heading,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.w700,
            fontFamily: 'Manrope',
            fontSize: 18,
            color: color));
  }
}

class Heading12font700 extends StatelessWidget {
  const Heading12font700(
      {super.key, required this.heading, required this.color});
  final String heading;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(heading,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.w700,
            fontFamily: 'Manrope',
            fontSize: 12,
            color: color));
  }
}

class Heading16font700 extends StatelessWidget {
  const Heading16font700(
      {super.key, required this.heading, required this.color});
  final String heading;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(heading,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.w700,
            fontFamily: 'Manrope',
            fontSize: 16,
            color: color));
  }
}

class RedStar extends StatelessWidget {
  const RedStar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text("*",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.w700,
            fontFamily: 'Manrope',
            fontSize: 12,
            color: Colors.red));
  }
}

class Onlinedot extends StatelessWidget {
  const Onlinedot({super.key, required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}

class Profilepostdata extends StatelessWidget {
  const Profilepostdata({super.key, required this.title, required this.body});
  final String title;
  final String body;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Row(
      children: [
        SizedBox(
          width: width * .45,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Heading12font600(
                heading: title, color: const Color(0xff525252)),
          ),
        ),
        SizedBox(
          width: width * .45,
          child: Align(
            alignment: Alignment.centerRight,
            child:
                Heading12font600(heading: body, color: const Color(0xff525252)),
          ),
        ),
      ],
    );
  }
}

class DefaultText extends StatelessWidget {
  const DefaultText(
      {super.key, required this.heading, required this.color, this.fontsize});
  final String heading;
  final Color color;
  final double? fontsize;
  @override
  Widget build(BuildContext context) {
    return Text(heading,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.w700,
            fontFamily: 'Manrope',
            fontSize: fontsize ?? 15,
            color: color));
  }
}
