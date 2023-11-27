import 'package:flutter/material.dart';

class friend_setting extends StatefulWidget {
  const friend_setting({super.key});

  @override
  State<friend_setting> createState() => _myPageState();
  
}

class _myPageState extends State<friend_setting> {
  bool isSwitched = true;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(

        appBar: AppBar(
          elevation: 0.0,
          leading: const Icon(Icons.arrow_back),
          backgroundColor: Colors.white,
          title: const Text('Manage'),
          foregroundColor: Colors.black,
        ),

        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0),

              child: SizedBox(
                width: size.width,
                child: const Column(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      foregroundImage: AssetImage('assets/memoji.jpg'),
                    ),

                    SizedBox(height: 10),
                    Text(
                      'Rahul Singh',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text("singhrahul4@gmail.com"),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 50),
            
            Padding(
              padding: const EdgeInsets.only(left:17.0),
              child: Container(alignment: Alignment.centerLeft,
              child: const Text("Share Precise Location",
              style: TextStyle(
                fontSize: 20.5,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              ),
              
              ),
            ),

            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(alignment: Alignment.centerLeft,
                  child: const Text("Allows them to see exactly where you are,\n this is turned on by default. If off, they will\n see your last known location.",
                  
                  style: TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  ),
                  
                  ),
                ),

                 Switch(
                  
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                      value=!value;
                    });},
                    activeColor: Color.fromARGB(255, 255, 255, 255),
                    activeTrackColor: Color.fromRGBO(108, 206, 103, 100),)
              ],
              
            ),

            const SizedBox(height: 20),
            
            Align(
              heightFactor: 3.5,
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 155,
                
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Remove Friend',style:TextStyle(color: Colors.white),),
                    style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 255, 91, 91)),
                  ),
                ),


              ),
            ),
          ],
        ),
        
        bottomNavigationBar: BottomNavigationBar(
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
      ),
    );
  }
}