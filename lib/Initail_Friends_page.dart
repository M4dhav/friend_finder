// ignore_for_file: file_names

import 'package:flutter/material.dart';




class InitailPage extends StatelessWidget {
  const InitailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: const Text('Friends',style: TextStyle(fontWeight: FontWeight.bold),),
        foregroundColor: Colors.black,

        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4.0), // Set the height of the border
          child: Container(
            color: const Color.fromARGB(255, 177, 176, 176), // Set the color of the border
            height: 1.0, // Set the height of the border
          ),
        ),
      ),
      
      body:  Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 50.0),
          child: SizedBox(
            width: size.height,
            child:const Image(image: AssetImage("assets/memoji.png")))
          ),

          const Padding(padding: EdgeInsets.only(top: 20.0),
          child: Text(" Find Your College Mates,\n       Friends on a Map ",
          textAlign: TextAlign.justify,
          style:TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          )),),

          const Padding(padding: EdgeInsets.only(top: 20.0),
          child: Text("Start sharing your location with your friends\n or batch mates. ",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
          ),
          ),),

          Align(
            heightFactor: 4.7 ,
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 255,
              height: 51,
              
              child: ElevatedButton(
                onPressed: () {},
                
                style:ElevatedButton.styleFrom(
                  backgroundColor:  const Color.fromARGB(255, 247, 246, 246),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                
                ), child: const Text('Start Finding Friends',style:TextStyle(color: Colors.blueAccent,fontSize: 18,fontWeight: FontWeight.w800)),
              ),


            ),
          )
          
        ]),

        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.pin_drop_outlined),
            label: 'Maps',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Friends',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Account',
          ),
        ],
        selectedItemColor: Colors.blue[800],
        )
    );
  }
}

