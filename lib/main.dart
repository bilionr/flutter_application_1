import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
 
void main() {
  runApp(const MyApp());
}
 
// Class 
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 
// This widget is
//the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
 
// Class 
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
 
  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}
 
class _MyHomePageState extends State<MyHomePage> {
  
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: const Text(
        "FitDaily",
        style: TextStyle(
          color:Colors.blue,
          fontFamily: 'Roboto',
          fontSize: 32,
          fontWeight: FontWeight.bold,),
        ),
      centerTitle: true,
    ),

    bottomNavigationBar: BottomNavigationBar(

          items: [
            
            // 1
            BottomNavigationBarItem(
              icon:  Icon(Icons.home,color: Colors.green ),
              label: 'Home',
              backgroundColor: Colors.white,
            ),

            // 2
            BottomNavigationBarItem(
              icon: Icon(Icons.person,color: Colors.grey),
              label: 'Profile',
              // backgroundColor:Colors.blue,
            ),

             BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart,color: Colors.grey),
              label: 'cart',
              // backgroundColor:Colors.blue,
            ),


            BottomNavigationBarItem(
              icon: Icon(Icons.notifications ,color: Colors.grey),
              label: 'bell',
              // backgroundColor:Colors.blue,
            ),

            BottomNavigationBarItem(
              icon: Icon( Icons.more_horiz, color: Colors.grey),
              label: 'bell',
              // backgroundColor:Colors.blue,
            ),

          ]
    ),


    body: SingleChildScrollView(
      padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          
          Container(

            margin: EdgeInsets.symmetric(horizontal: 0),
            child: Row(
              children: [

                Align(
                  alignment: Alignment.centerLeft,
                  child:
                    Text(
                    "Today",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.bold
                    )
                    ),
                ),
                
                Spacer(),

                Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {print("You Pressed");},
                      child: Text("Edit"))
                )

                
              ],
            )
          ),

          Container(
          height: 175,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[

              Container(
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black12, width:3,),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [BoxShadow(blurRadius: 10, offset: Offset(1,3),)],
                ),
                width: 300,
                child: const Center(child: Text('Item 1', style: TextStyle(fontSize: 18, color: Colors.white),)),
              ),

              Container(
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black12, width:3,),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [BoxShadow(blurRadius: 10, offset: Offset(1,3),)],
                ),
                width: 300,
                child: const Center(child: Text('Item 1', style: TextStyle(fontSize: 18, color: Colors.white),)),
              ),

              Container(
               margin: EdgeInsets.all(8),
               decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black12, width:3,),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [BoxShadow(blurRadius: 10, offset: Offset(1,3),)],
                ),
                width: 300,
                child: const Center(child: Text('Item 1', style: TextStyle(fontSize: 18, color: Colors.white),)),
              ),

              Container(
               margin: EdgeInsets.all(8),
               decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black12, width:3,),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [BoxShadow(blurRadius: 10)],
                ),
                width: 300,
                child: const Center(child: Text('Item 1', style: TextStyle(fontSize: 18, color: Colors.white),)),
              ),

            
            ],
          ),

        
        ),

        GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          shrinkWrap: true,
          children: List.generate(20, (index) {
            return Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                margin: EdgeInsets.all(8),
               decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black12, width:3,),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [BoxShadow(blurRadius: 10)],
                ),
                width: 300,
                child: const Center(child: Text('Item 1', style: TextStyle(fontSize: 18, color: Colors.white),)),
              )
            );
          })
        )
        







        
        
        
        
        
        
        ]
      )
    )




    );


  }
  

  
  
   // widget build
} // class


