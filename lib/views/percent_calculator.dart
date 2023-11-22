import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("You can simply calculate percentage of any number",
              textAlign: TextAlign.center,
              style: GoogleFonts.aBeeZee(
                  fontSize: 20.0, fontWeight: FontWeight.w500)),
        ),
        const SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "What is",
              style: GoogleFonts.aBeeZee(
                  fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 10.0),
            Card(
                elevation: 2.0,
                child: Container(
                  padding: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.green)),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 5,
                    height: 50,
                    child: TextFormField(
                      cursorColor: Colors.green,
                      keyboardType: TextInputType.number,
                      controller: _percentController,
                      decoration: const InputDecoration(
                          border: InputBorder.none, fillColor: Colors.white),
                    ),
                  ),
                )),
            const SizedBox(width: 10.0),
            Text("% of",
                style: GoogleFonts.aBeeZee(
                    fontSize: 20.0, fontWeight: FontWeight.bold)),
            const SizedBox(width: 10.0),
            Card(
                elevation: 5.0,
                child: Container(
                  padding: const EdgeInsets.only(left: 10),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.green)),
                  child: SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 5,
                    child: TextFormField(
                      cursorColor: Colors.green,
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
                foregroundColor: Colors.white,
                minimumSize: const Size(150, 44),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                backgroundColor: Colors.green),
            child:
                Text("Calculate", style: GoogleFonts.aBeeZee(fontSize: 18.0))),
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
                    color: Colors.green,
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
    if (percentageValue.isNotEmpty && value.isNotEmpty) {
      setState(() {
        answer = double.parse(percentageValue) * double.parse(value) / 100;
        displayAnswer = answer.toString();
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 1),
          content: Text("Field aren't correct!",
              style: GoogleFonts.aBeeZee(fontSize: 18))));
    }
    return answer;
  }
}
