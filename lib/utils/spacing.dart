import 'package:flutter/material.dart';

class TopSpacing extends StatelessWidget {
  const TopSpacing({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return SizedBox(
      height: height * .07,
    );
  }
}

class Oneh extends StatelessWidget {
  const Oneh({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return SizedBox(
      height: height * .01,
    );
  }
}

class Halfh extends StatelessWidget {
  const Halfh({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return SizedBox(
      height: height * .005,
    );
  }
}

class Halfw extends StatelessWidget {
  const Halfw({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width * .005,
    );
  }
}

class Twoh extends StatelessWidget {
  const Twoh({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return SizedBox(
      height: height * .02,
    );
  }
}

class Threeh extends StatelessWidget {
  const Threeh({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return SizedBox(
      height: height * .03,
    );
  }
}

class Fiveh extends StatelessWidget {
  const Fiveh({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return SizedBox(
      height: height * .05,
    );
  }
}

class Sevenh extends StatelessWidget {
  const Sevenh({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return SizedBox(
      height: height * .07,
    );
  }
}

class Onew extends StatelessWidget {
  const Onew({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width * .01,
    );
  }
}

class Twow extends StatelessWidget {
  const Twow({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width * .02,
    );
  }
}

class Threew extends StatelessWidget {
  const Threew({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width * .03,
    );
  }
}

class Fivew extends StatelessWidget {
  const Fivew({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width * .05,
    );
  }
}

class Line extends StatelessWidget {
  const Line({super.key, required this.width, required this.color});
  final double width;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 10,
      child: Divider(
        color: color,
        thickness: 1,
      ),
    );
  }
}
