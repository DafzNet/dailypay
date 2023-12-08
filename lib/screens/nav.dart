import 'package:dailypay/screens/fund/fund.dart';
import 'package:dailypay/screens/payment/payment.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../utils/constants/constants.dart';
import 'home/home.dart';


class AppBaseNavigation extends StatefulWidget {
  
  const AppBaseNavigation({

    super.key});

  @override
  State<AppBaseNavigation> createState() => _AppBaseNavigationState();
}

class _AppBaseNavigationState extends State<AppBaseNavigation> {

  final List<Widget> _pages = [
    const HomeScreen(),
    FundWallet(),
    Payment(),
    const Center(child: Text('4th Screen')),
  ];

  int _currentIndex = 0;


  void getCurrentPage(index){
    _currentIndex = index;
    setState(() {
      
    });
  }

  final pageController = PageController();
  

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: PageView(
        controller: pageController,
        onPageChanged: (int value){
          setState(() {
            _currentIndex = value;
          });
        },
        children: _pages,
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: const Color.fromARGB(197, 39, 39, 39),
        selectedItemColor: dailiPayColor.shade600,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        elevation: 0,
        type: BottomNavigationBarType.fixed,

        //backgroundColor: Color(0xffFAFAFF),
        currentIndex: _currentIndex,
        onTap: (index){
          getCurrentPage(index);

          pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.bounceIn
          );

          setState(() {
            
          });
        },
      
        items:  [
          
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home
            ),
      
            activeIcon: Icon(
              Icons.home_outlined
            ),
      
            label: 'Home'
          ),


          /////Chat
          BottomNavigationBarItem(
            icon: Icon(
              MdiIcons.creditCardPlus
            ),
      
            activeIcon: Icon(
              MdiIcons.creditCardPlusOutline
            ),
      
            label: 'Fund'
          ),


          /////Chat
          BottomNavigationBarItem(
            icon: Icon(
              MdiIcons.creditCard
            ),
      
            activeIcon: Icon(
              MdiIcons.creditCardOutline
            ),
      
            label: 'Payment'
          ),

          /////Chat
          BottomNavigationBarItem(
            icon: Icon(
              MdiIcons.dotsHorizontalCircleOutline
            ),
      
            activeIcon: Icon(
              MdiIcons.dotsHorizontalCircle
            ),
      
            label: 'More'
          ),
          
        ]
      ),
    );

  }
}