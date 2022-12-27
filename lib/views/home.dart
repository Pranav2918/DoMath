import 'package:domath/views/calculator.dart';
import 'package:domath/views/percent_calculator.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
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
      centerTitle: true,
      title: const Text("Do Math"),
      bottom: const TabBar(
        labelColor: Color.fromARGB(255, 0, 128, 17),
        unselectedLabelColor: Colors.white,
        indicatorColor: Colors.transparent,
        tabs: [
          Tab(icon: Icon(Icons.percent)),
          Tab(icon: Icon(Icons.calculate)),
        ],
      ),
    );
  }

  //Show UI for calculator
  Widget _showUI() {
    return const TabBarView(children: [PercentCalculator(), Calculator()]);
  }
}
