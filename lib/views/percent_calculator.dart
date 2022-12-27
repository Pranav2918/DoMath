import 'dart:ui';

import 'package:flutter/material.dart';

class PercentCalculator extends StatefulWidget {
  const PercentCalculator({super.key});

  @override
  State<PercentCalculator> createState() => _PercentCalculatorState();
}

class _PercentCalculatorState extends State<PercentCalculator> {
  final TextEditingController _percentController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();
  double answer = 0.0;
  String displayAnswer = "0";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(child: SizedBox()),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("You can simply calculate percentage of any number",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500)),
        ),
        const SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "What is",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 10.0),
            Card(
                elevation: 2.0,
                child: Container(
                  padding: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 0, 128, 17))),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 5,
                    height: 50,
                    child: TextFormField(
                      cursorColor: const Color.fromARGB(255, 0, 128, 17),
                      keyboardType: TextInputType.number,
                      controller: _percentController,
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                    ),
                  ),
                )),
            const SizedBox(width: 10.0),
            const Text(
              "% of",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 10.0),
            Card(
                elevation: 2.0,
                child: Container(
                  padding: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 0, 128, 17))),
                  child: SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 5,
                    child: TextFormField(
                      cursorColor: const Color.fromARGB(255, 0, 128, 17),
                      controller: _valueController,
                      keyboardType: TextInputType.number,
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                    ),
                  ),
                )),
          ],
        ),
        const SizedBox(height: 30.0),
        ElevatedButton(
            onPressed: () => _calculatePercentage(
                _percentController.text, _valueController.text, answer),
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(150, 44),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                backgroundColor: const Color.fromARGB(255, 0, 128, 17)),
            child: const Text("Calculate",
                style: TextStyle(color: Colors.white, fontSize: 18))),
        const SizedBox(height: 30.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Your answer is",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.normal)),
            const SizedBox(width: 10.0),
            Text(displayAnswer,
                style: const TextStyle(
                    color: const Color.fromARGB(255, 0, 128, 17),
                    fontSize: 24,
                    fontWeight: FontWeight.bold)),
          ],
        ),
        const Expanded(child: SizedBox()),
      ],
    );
  }

  //Calculate percentage
  double _calculatePercentage(
      String percentageValue, String value, double answer) {
    setState(() {
      answer = int.parse(percentageValue) * int.parse(value) / 100;
      displayAnswer = answer.toString();
    });
    return answer;
  }
}
