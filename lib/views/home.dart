import 'package:domath/views/calculator.dart';
import 'package:domath/views/percent_calculator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: _showCalculatorAppbar(),
          body: _showUI(),
        ),
      ),
    );
  }

  //Show Appbar
  AppBar _showCalculatorAppbar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.black,
      title: Text(
        "Do Math",
        style: GoogleFonts.aBeeZee(color: Colors.white),
      ),
      bottom: const TabBar(
        labelColor: Colors.green,
        unselectedLabelColor: Colors.white,
        indicatorColor: Colors.transparent,
        tabs: [
          Tab(icon: Icon(Icons.percent)),
          Tab(icon: Icon(Icons.show_chart_rounded)),
          Tab(icon: Icon(Icons.calculate)),
        ],
      ),
    );
  }

  //Show UI for calculator
  Widget _showUI() {
    return TabBarView(
        children: [const PercentCalculator(), Container(), const Calculator()]);
  }
}
