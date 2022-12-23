import 'package:flutter/material.dart';

class middleText extends StatelessWidget {
  double devideSize;
  String infoValue;
  middleText({Key? key, required this.devideSize, required this.infoValue})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      alignment: Alignment.center,
      width: size.width / devideSize - 17,
      child: Wrap(
        children: <Widget>[
          Text(
            infoValue,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}

class Heading2 extends StatelessWidget {
  double devideSize;
  String infoValue;
  Heading2({Key? key, required this.devideSize, required this.infoValue})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      width: size.width / devideSize - 17,
      child: Wrap(
        children: <Widget>[
          SizedBox(
            height: 27,
          ),
          Text(
            infoValue,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          SizedBox(
            height: 27,
          ),
        ],
      ),
    );
  }
}

class Heading3 extends StatelessWidget {
  double devideSize;
  String infoKey;
  String infoValue;
  Heading3(
      {Key? key,
      required this.devideSize,
      required this.infoKey,
      required this.infoValue})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.centerLeft,
      width: size.width / devideSize - 17,
      child: Wrap(
        children: <Widget>[
          Text(
            infoKey + infoValue,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: 7,
          ),
        ],
      ),
    );
  }
}

class infoText extends StatelessWidget {
  double devideSize;
  String infoKey;
  String infoValue;
  infoText(
      {Key? key,
      required this.devideSize,
      required this.infoKey,
      required this.infoValue})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.centerLeft,
      width: size.width / devideSize - 17,
      child: Wrap(
        children: <Widget>[
          Text(
            infoKey + ': ' + infoValue,
          ),
          SizedBox(
            height: 5,
          ),
          Divider(
            thickness: 5,
          ),
        ],
      ),
    );
  }
}

class testText extends StatelessWidget {
  String content;
  testText({
    Key? key,
    required this.content,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(17.0),
      alignment: Alignment.center,
      child: Wrap(
        children: <Widget>[
          Text(content),
        ],
      ),
    );
  }
}

class testNameText extends StatelessWidget {
  String content;
  testNameText({Key? key, required this.content}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7.0),
      alignment: Alignment.centerLeft,
      child: Wrap(
        children: <Widget>[
          Text(
            content,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class testHeaderText extends StatelessWidget {
  String content;
  testHeaderText({
    Key? key,
    required this.content,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      alignment: Alignment.center,
      child: Wrap(
        children: <Widget>[
          Text(
            content,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
