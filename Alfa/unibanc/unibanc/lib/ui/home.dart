import 'package:flutter/material.dart';
import 'package:unibanc/user/user.dart';

import 'login.dart';

class Home extends StatelessWidget {
  User user;
  Home(this.user);
  int _selectedIndex =0;

void _onItemTapped(int index) {
  
    _selectedIndex = index;
    print("index $_selectedIndex");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color.fromRGBO(159, 33, 29, 1.0),
        title: Text(user.nome),
        actions: <Widget>[ 
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: Icon(Icons.power_settings_new),
              onPressed: () {
                    Navigator.push(context,
                        (MaterialPageRoute(builder: (context) => Login())));                
              },
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(159, 33, 29, 1.0),        
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color:Colors.white ),
            title: Text("Inico",style: TextStyle(color: Colors.white),),            
            backgroundColor: Colors.white,
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu,color:Colors.white ,),
            title: Text("Menu",style: TextStyle(color: Colors.white),),                       
            )            
        ],
        currentIndex:_selectedIndex,
        onTap: _onItemTapped,
        ),
        
    );
  }
}