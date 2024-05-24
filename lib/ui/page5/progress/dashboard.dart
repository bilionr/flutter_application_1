import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_application_1/ui/page5/progress/database_service.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'add_Weight_page.dart';

import 'weight.dart';

class ChartData {
  ChartData(this.x, this.y);
  final Timestamp x;
  final int y;
}


class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
  
}

class _DashboardState extends State<Dashboard> {

  final DatabaseService _databaseService = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _appBar(),
      body: _buildUI(),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
        title: Text("PROGRESS"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => addWeight()),
              );
            },
          ),
        ],
    );
  }

  Widget _buildUI() {
    return SafeArea(
      child: Column(
        children: [
          _graphView(),
          _messagesListView(),
        ]
      )
    );
  }

  Widget _graphView(){
    List<Weight> item = [];

    FirebaseFirestore.instance.collection("MyWeights").get().then((querySnapshot){
      print("Successfully completed");
      List<Timestamp> tanggal = [];
      List<int> berat = [];
      for(var docSnapshot in querySnapshot.docs) {
        print('${docSnapshot.id}) => ${docSnapshot.data()}');
      }
    }, 
    onError: (e) => print("Error completing: $e"),
    );
    




    return Container();
  }

  Widget _messagesListView() {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.8,
      width: MediaQuery.sizeOf(context).width,
      child: StreamBuilder(
        stream: _databaseService.getWeights(),
        builder: (context, snapshot) {
          List weightList = snapshot.data!.docs ?? [];
          if (weightList.isEmpty) {
            return const Text("No notes");
          }
          return ListView.builder(
            itemCount: weightList.length,
            itemBuilder: (context, index) {
              Weight weight = weightList[index].data();
              String weightId = weightList[index].id;
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                child: ListTile(
                  title: Text(DateFormat("dd-MM-yyyy").format(weight.weightDate.toDate())),
                  subtitle: Text(weight.weightWeight.toString()),
                  trailing: Row(
                    mainAxisSize:MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: (){_databaseService.deleteWeight(weightId);},
                        icon: const Icon(Icons.delete)
                      )
                    ]
                  )
                )
              );


            },
          );

        }
      )
    );
  }



}