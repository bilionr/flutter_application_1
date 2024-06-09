import 'package:flutter/material.dart';
import '../../common_widget/card.dart';

class Tab1 extends StatelessWidget {
  const Tab1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            
            xCard(
              hitText: "Judul Review",
              subText: "Subtitle Review",
            ),
            xCard(
              hitText: "Judul Review",
              subText: "Subtitle Review",
            ),
            xCard(
              hitText: "Judul Review",
              subText: "Subtitle Review",
            )
          ],
        )
      )
    );
  }
}

class Tab2 extends StatelessWidget {
  const Tab2({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(

          children: [
            SizedBox(
              height: 20,
            ),
            
            xCard(
              hitText: "Judul Review",
              subText: "Subtitle Review",
            ),
            xCard(
              hitText: "Judul Review",
              subText: "Subtitle Review",
            ),
            xCard(
              hitText: "Judul Review",
              subText: "Subtitle Review",
            )
          ],
        
      )
    );
  }
}

class Page4 extends StatefulWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  _Page4State createState() => _Page4State();
}

class _Page4State extends State<Page4>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                SizedBox(height: 50),
                Container(
                  // height: 50,
                  width: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: TabBar(
                          unselectedLabelColor: Colors.white,
                          labelColor: Colors.black,
                          indicatorColor: Colors.white,
                          indicatorWeight: 2,
                          indicator: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          controller: tabController,
                          tabs: [
                            Tab(
                              text: 'Food',
                            ),
                            Tab(
                              text: 'Workout',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      Tab1(),
                      Tab2(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}