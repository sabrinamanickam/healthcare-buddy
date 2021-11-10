import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:healthcare_buddy/Doctors%20Appointment/doctorsAppointment.dart';
import 'package:healthcare_buddy/utilities.dart';
import 'package:healthcare_buddy/homeScreen/moods.dart';
class HomeScreen extends StatefulWidget {
  final Widget child;
  const HomeScreen({Key key,
    this.child,}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 0;
  void onTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:
        Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [

              _backBgCover(),
              _greetings(),
              _moodsHolder(),
            ],
          ),

            SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.count(crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  primary: false,
                  children: [
                    InkWell(
                      child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          color: lightRedColor,
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                  'assets/images/heart-monitoring.png', width: 78,
                                  height: 78),
                              SizedBox(height: 12,),
                              Text("Medical History", style: TextStyle(
                                fontSize: 20,
                                color:Colors.white,
                              ))
                            ],

                          )

                      ),
                    onTap: () { Navigator.of(context).push(MaterialPageRoute( builder: (context) => doctorsAppointment()));}
                    ),


                    Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        color:midColor,
                        elevation: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/pills.png', width: 78,
                                height: 78),
                            SizedBox(height: 12,),
                            Text("Pill Reminder", style: TextStyle(
                              fontSize: 20,
                              color:Colors.white,
                            ))
                          ],

                        )

                    ),
                    Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        color: midColor,
                        elevation: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/stomach.png', width: 78,
                                height: 78),
                            SizedBox(height: 12,),
                            Text("Your Diet Chart", style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ))
                          ],

                        )

                    ),
                    Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 4,
                        color: lightRedColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                                'assets/images/water-bottle.png', width: 78,
                                height: 78),
                            SizedBox(height: 12,),
                            Text("Water Intake", style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            )
                            )
                          ],

                        )

                    ),
                    Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 4,
                        color: lightRedColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                                'assets/images/prescription.png', width: 78,
                                height: 78),
                            SizedBox(height: 12,),
                            Text("Doctor's Appointment", style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            )
                            )
                          ],
                        )

                    ),
                    Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 4,
                        color: midColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                                'assets/images/medical-report.png', width: 78,
                                height: 78),
                            SizedBox(height: 12,),
                            Text("Save Lab Reports", style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            )
                            )
                          ],

                        )

                    ),
                  ],
                ),
              ),
            ),
        ],
          ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30.0,
              ),
              title: Text('1')),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 30.0,
              ),
              title: Text('2')),
          BottomNavigationBarItem(
              icon: Icon(
              Icons.account_circle,
                size: 30.0,
              ),
              title: Text('3')),
        ],
        onTap: onTapped,
      ),
    );
  }
  Container _backBgCover() {
    return Container(
      height: 260.0,
      decoration: BoxDecoration(
        gradient: purpleGradient,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
    );
  }
  Positioned _moodsHolder() {
    return Positioned(
      bottom: 4,
      child: Container(
        height: 90.0,
        width: MediaQuery.of(context).size.width - 30,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(28)),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 5.5,
                blurRadius: 5.5,
              )
            ]),
        child:MoodsSelector(),
      ),
    );
  }
  Positioned _greetings() {
    return Positioned(
      left: 20,
      bottom: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Hi User',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'How are you feeling today ?',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }



}
