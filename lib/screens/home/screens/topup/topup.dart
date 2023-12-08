import 'package:dailypay/screens/home/screens/topup/screen/airtime.dart';
import 'package:dailypay/screens/home/screens/topup/screen/data.dart';
import 'package:dailypay/utils/constants/constants.dart';
import 'package:flutter/material.dart';

class Topup extends StatefulWidget {
  const Topup({super.key});

  @override
  State<Topup> createState() => _TopupState();
}

class _TopupState extends State<Topup> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Top-Up'),
          bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: dailiPayColor,
              labelColor: dailiPayColor,
              tabs: [
                Tab(text: 'Buy Airtime'),
                Tab(text: 'Buy Data'),
              ],
            ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: bodyPadding),
          child: TabBarView(
            children: [
              Airtime(),
              Data()
            ],
          ),
        ),
      ),
    );
  }
}