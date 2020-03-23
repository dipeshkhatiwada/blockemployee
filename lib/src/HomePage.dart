import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'Employee.dart';
import 'EmployeeBlock.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
 
class _HomePageState extends State<HomePage> {
  final barColor= const Color(0xFF0864a1); // 0x default FF opacity
  final EmployeeBlock _employeeBlock = EmployeeBlock();



//--the most important thing is to free the memory 
//-- this errors is difficult to find so do it first
  @override
  void dispose(){
    _employeeBlock.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Employee Block', style: TextStyle(color: Colors.white)),
        
      ),
      body: Container(
        child: StreamBuilder<List<Employee>>(
          stream: _employeeBlock.employeeListStream,
          builder: (BuildContext context, AsyncSnapshot<List<Employee>> snapshot){
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index,){
                return Card(
                  elevation: 5.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          "${snapshot.data[index].id}.",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "${snapshot.data[index].name}.",
                              style: TextStyle(fontSize: 16.0),
                            ),
                             Text(
                              "Rs.  ${snapshot.data[index].salary}.",
                              style: TextStyle(fontSize: 14.0),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5.0),
                        child: IconButton(
                          icon: Icon(Icons.thumb_up),
                          color: Colors.greenAccent,
                          onPressed: (){
                            _employeeBlock.employeeSalaryIncrement
                            .add(snapshot.data[index]);
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5.0),
                        child: IconButton(
                          icon: Icon(Icons.thumb_down),
                          color: Colors.redAccent,
                          onPressed: (){
                            _employeeBlock.employeeSalaryDecrement
                            .add(snapshot.data[index]);                            
                          },
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          },

        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: barColor,
          foregroundColor: Colors.white,
          child: Icon(
            Icons.settings,
          ),
         
          onPressed: (){
            setState(() {
                           
            });
          }),
    );
  }
}