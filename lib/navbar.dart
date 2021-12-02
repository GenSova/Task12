import 'package:flutter/material.dart';
import 'package:labworkd12/homePage.dart';
import 'package:labworkd12/profile.dart';
import 'package:labworkd12/qr.dart';

class NavBar extends StatefulWidget {

  @override
  NavBarState createState() => NavBarState();
}

class NavBarState extends State<NavBar> {
  String title = 'Главная';
  int _currentIndex = 0;
  final List<Widget> _children = [
    homePage(),
    qrPage(),
    profile()
  ];

  changeTitle(index){
    if (index == 0){
      setState(() {
        title = 'Главная';
      });
    }
    if (index == 1){
      setState(() {
        title = 'QR Сканнер';
      });
    }
    if (index == 2){
      setState(() {
      title = 'Профиль';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

      ),
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(72, 84, 108, 1),
          centerTitle: true,
          title: Text(
            title,
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.exit_to_app_outlined,
                color: Colors.white,
              ),
              onPressed: (){},
            )
          ],
        ),
        body: _children[_currentIndex],
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 8.0,
          clipBehavior: Clip.antiAlias,
          child: Container(
            height: 70,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(
                    color: Colors.white70,
                    width: 0.5,
                  ),
                ),
              ),
              child: BottomNavigationBar(
                  currentIndex: _currentIndex,
                  backgroundColor: Colors.white,
                  unselectedItemColor: Color.fromRGBO(72, 84, 108, 1),
                  selectedItemColor: Colors.blue,
                  onTap: (index) {
                    setState(() {
                      changeTitle(index);
                      _currentIndex = index;
                    });
                  },
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home), label: ''),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.qr_code), label: ''),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person), label: ''),
                  ]),
            ),
          ),
        ),
        floatingActionButtonLocation:
        FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: Container(
          height: 73,
          width: 73,
          padding: const EdgeInsets.all(1.0),
          child: FloatingActionButton(
            backgroundColor: _currentIndex == 1 ? Color.fromRGBO(72, 84, 108, 1) : Color.fromRGBO(72, 84, 108, 1),
            child: Icon(Icons.qr_code),
            onPressed: () => setState(() {
              changeTitle(1);
              _currentIndex = 1;
            }),
          ),
        ),
      ),
    );
  }
}
