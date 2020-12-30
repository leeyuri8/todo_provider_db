import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/new_task.dart';
import 'package:todo_app/task_widget.dart';
import 'package:todo_app/todo_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        return ChangeNotifierProvider(
      create: (context){
       return TodoProvider();
      },
    child: MaterialApp(
      home: TabBarPage(),
    )
    );


  }
}
class TabBarPage extends StatefulWidget{
  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage>
 with SingleTickerProviderStateMixin{
 TabController tabController;
  @override
  void initState(){
    super.initState();
    tabController = TabController(length: 3,vsync: this);
  }
  Widget build(BuildContext context) {
  
    return DefaultTabController(
      length: 3 ,
          child: Scaffold(appBar: AppBar(
       
        title: Text('MyTasks'),
        bottom: TabBar(
          controller: tabController,
   
          tabs: [
          Tab(
            text:'All Tasks'
          ),
          Tab(
          text: 'Complete Tasks',
          ),
          Tab(
            text: 'InComplete Tasks',
            ),
        ],
        isScrollable: true,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child:TabBarView(
        controller: tabController,
        children:[
          AllTasks(),
          CompleteTasks(),
          InCompleteTasks()]
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Add Task",
       child: Icon(Icons.add),
      focusColor: Colors.blueAccent,
      onPressed: () {
        Navigator.push(context, 
    MaterialPageRoute(builder: (context) => NewTasks("",false)),
    );

   
         }
         ),
         ),
       );    
     }
   }
   
 
  
class AllTasks extends StatefulWidget{
  @override
  _AllTasksState createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  myFun(){
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<TodoProvider> (
        builder:(context,todos,child) {
          
      return Container(
      child:
       Container(
         child: Column(
           children: 
            tasks.map((e) => TaskWidget(task:e)).toList()),
       ),
      );    

      

        }
          
        ),
        
         

      );
    
  }
}
class CompleteTasks extends StatefulWidget{
  @override
  _CompleteTasksState createState() => _CompleteTasksState();
}

class _CompleteTasksState extends State<CompleteTasks> {
  myFun(){
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {

    return Container(
      child: Consumer<TodoProvider>
      (builder: (context,todos,child){
        return Column(
         children: 
          tasks.where((element) => element.isComplete==true).map((e) => TaskWidget(task:e)).toList()
          );
      },

      ),
      );
       
  }
}
class InCompleteTasks extends StatefulWidget{
 
  @override
  _InCompleteTasksState createState() => _InCompleteTasksState();
}

class _InCompleteTasksState extends State<InCompleteTasks> {
  @override
  Widget build(BuildContext context) {
    
 return Container(
        child: Consumer<TodoProvider>(builder: (context,todos,child){
      return Column(
         children: 
          tasks.where((element) => element.isComplete==false).map((e) => TaskWidget(task:e)).toList());
        },
      ),
      );
  }
}