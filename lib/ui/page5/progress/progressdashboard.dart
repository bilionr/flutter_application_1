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


class ProgressDashboard extends StatefulWidget {
  @override
  _ProgressDashboardState createState() => _ProgressDashboardState();
  
}

class _ProgressDashboardState extends State<ProgressDashboard> {

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
          _messagesListView(),
        ]
      )
    );
  }


  Widget _messagesListView() {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.8,
      width: MediaQuery.sizeOf(context).width,
      child: StreamBuilder(
        stream: _databaseService.getWeights(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
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
        return CircularProgressIndicator();
          
          
          

        }
      )
    );
  }



}