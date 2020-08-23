import 'package:clock_app/alien.dart';
import 'package:clock_app/football.dart';
import 'package:clock_app/space.dart';
import 'package:clock_app/spider.dart';
import 'package:clock_app/spiderhang.dart';
import 'package:clock_app/superman.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "My Simple Clock",
    home: HomeScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

  Animation animation;
  AnimationController animationController;

  _currentTime(){
    return "${DateTime.now().hour} : ${DateTime.now().minute}";
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this,duration: Duration(seconds: 1));
    animationController.addListener((){

      if(animationController.isCompleted){
        animationController.reverse();
      } else if(animationController.isDismissed){
        animationController.forward();
      }
      setState(() {

      });
    });
    animationController.forward();
  }


  @override
  Widget build(BuildContext context) {
    animation = CurvedAnimation(parent: animationController, curve: Curves.easeInOut);
    animation = Tween(begin: -0.5,end: 0.5).animate(animation);

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 78.0),
          child: Text('Classic',style: TextStyle(
            fontSize: 30.0,
            fontFamily: 'Berlin'
          ),),
        ),
        backgroundColor: Colors.deepOrange,
        elevation: 0.0,
      ),
      body: Container(
        color: Colors.deepOrange,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            children: <Widget>[
              Material(
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                elevation: 10.0,
                color: Colors.brown.shade900,
                child: Container(
                  width: 320,
                  height: 320,
                  child: Center(
                    child: Text(_currentTime(),style: TextStyle(
                        fontSize: 60.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
              ),
              Transform(
                alignment: FractionalOffset(0.5,0.1),
                transform: Matrix4.rotationZ(animation.value),
                child: Container(
                  child: Image.asset('images/pandulum.png',width: 100,height: 250,),
                ),
              )
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: <Color> [
                  Colors.deepOrange,
                  Colors.orangeAccent
                ])
              ),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 28.0),
                      child: Text("clock",style: TextStyle(
                      color: Colors.white,
                      fontSize: 60.0,
                        fontFamily: "Berlin"
                    ),
                    ),
                    )
                  ],
                ),
              ),
            ),
            CustomListTile(Icons.texture, "Superman", ()=>{
             Navigator.push(context, MaterialPageRoute(builder: (context) => SupermanScreen()),)
            }),
            CustomListTile(Icons.texture, "Spiderman", ()=>{
              Navigator.push(context, MaterialPageRoute(builder: (context) => SpiderScreen()),)
            }),
            CustomListTile(Icons.texture, "Spiderman2", ()=>{
              Navigator.push(context, MaterialPageRoute(builder: (context) => SpiderHangScreen()),)
            }),
            CustomListTile(Icons.texture, "Alien", ()=>{
              Navigator.push(context, MaterialPageRoute(builder: (context) => Space1Screen()),)
            }),
            CustomListTile(Icons.texture, "Football", ()=>{
              Navigator.push(context, MaterialPageRoute(builder: (context) => Space2Screen()),)
            }),
            CustomListTile(Icons.texture, "Space", ()=>{
              Navigator.push(context, MaterialPageRoute(builder: (context) => SpaceScreen()),)
            }),
          ],
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  IconData icon;
  String text;
  Function onTap;

  CustomListTile(this.icon, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade400),
          )
        ),
        child: InkWell(
          splashColor: Colors.orangeAccent,
          onTap: onTap,
           child: Container(
             height: 40.0,
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: <Widget>[
                 Row(
                   children: <Widget>[
                     Icon(icon),
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Text(text,style: TextStyle(
                         fontSize: 16.0
                       ),),
                     ),
                   ],
                 ),
                 Icon(Icons.arrow_right)
               ],
             ),
           ),
        ),
      ),
    );
  }
}
