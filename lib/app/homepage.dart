import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void profileButton() {
    print("Profile Button clicked");
  }

  void notifyButton() {
    print("Notification Button Clicked");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //will create a App bar dipslaying a User icon and a notification icon
      appBar: AppBar(
        //Creates a container to store a icon button
        leading: IconButton(
          icon: Image.asset("assets/icons/user.png"),
          onPressed: profileButton,
          color: Colors.white,
        ),
        actions: [
          IconButton(
            onPressed: notifyButton,
            icon: SvgPicture.asset("assets/icons/notify.svg"),
          )
        ],
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
      ),

      //the Body will contain a colum to different types of widgets
      //such as dipslyaing name.  It will show veterinary clinks and groomer area
      body: Column(
        children: [
          Container(
            //The row widget will great the user. It will alos set padding, set the color to orange and have the height be 90
            child: Row(
              children: [
                Text(
                  "Welcome, ",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                ),
                Text(
                  "Brent",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
                ),
              ],
            ),
            color: Color.fromRGBO(255, 183, 3, 1),
            height: 90,
            width: double.infinity,
            padding: EdgeInsets.all(20),
          ),

          //This container will have the search bar and allow the user to make reservation or get information of available veterinaries and groomers.
          Container(
              width: 350,
              margin: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Search Here...",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              )),

          //The expanded Widget will then allow chld containers wo have their width and height change dynamically depending on the available sspace
          Expanded(
            child: Container(
                color: Color.fromRGBO(255, 183, 3, 1),
                child: Container(
                  color: Colors.white,
                  height: 400,
                  // padding: EdgeInsetsDirectional.only(top: 40.0),

                  //Here The container will hold the veterinary clinics and grooming location using the card
                  //and list view widget
                  child: Container(
                    child: ListView(
                      children: [
                        card(),
                        card(),
                        card(),
                        card(),
                        card(),
                        card(),
                        card(),
                        card(),
                        card(),
                      ],
                    ),
                  ),
                )),
          ),
        ],
      ),

      //This is the bottom navigation bar.
      //-  will cotain three icon buttons which is home, appontments and pets. Each of them will lead to a separate page.
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(Icons.date_range), label: "Appointments"),
        BottomNavigationBarItem(icon: Icon(Icons.pets), label: "Pets"),
      ]),
    );
  }
}

//The card widget will hold the insturctions on
//veterinary and groomers.
//The list tile is used to organize all the information of one clincic to make it easier to understand and see.

class card extends StatelessWidget {
  const card({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset("assets/icons/VetPic.png"),
      title: Text("KHO Veterinary"),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text("Veterinary Clinic"), Text("Always Open 24/7")],
      ),
      isThreeLine: true,
      trailing: Image.asset("assets/icons/Stars.png"),
    );
  }
}
