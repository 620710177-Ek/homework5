import 'package:flutter/material.dart';

class MyToDo extends StatefulWidget {
  const MyToDo({Key? key}) : super(key: key);

  @override
  State<MyToDo> createState() => _MyToDoState();
}

class _MyToDoState extends State<MyToDo> {
  var textController=TextEditingController();
  bool value=false;
  int a=0;
  int c=0;
  List<Widget> ToDo=[];
   List<Add> ToDoList = [];
   Widget checkbox(int i){
    return Column(
      children: [
        ListTile(
           leading: Checkbox(
             value: ToDoList[i].status,
             onChanged: (value) {
               setState(() {
                 ToDoList[i].status=value;
               });

             }
           ),
           title: Row(
             children: [
               Expanded(
                 child: Text(
                  ToDoList[i].todo,
                   style: ToDoList[i].status!?TextStyle(decoration: TextDecoration.lineThrough):TextStyle(decoration: TextDecoration.none),),
               ),
               IconButton(onPressed: (){
                 setState(() {
              c--;
               });}, icon: Icon(Icons.delete)),
             ],
           ),

           ),

      ],
    );

   }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
            children: [
              Icon(Icons.check_box),
              SizedBox(width: 5,),
              Text('My ToDo'),
            ],
          ),
      ),
      body: Column(
        children: [
          for(int i=0;i<c;i++)
            checkbox(i),

          Expanded(child:Container(color: Colors.black12,) ,),
      Container(
        margin : EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: textController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter new ToDo',
                ),
    ),
            ),
            SizedBox(width: 10.0,),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        ToDoList.add(Add(textController.text,c));
                        ToDo.add(checkbox(c));
                        c++;

                      });
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    child: Text(
                      'ADD',
                      style: TextStyle(color: Colors.blue),
                    ))
              ],
        ),
      )


        ],

      ),
    );
  }
}
class Add{
  String todo="";
  bool? status;
  int? t;
Add(String t,int a){
  this.todo=t;
  this.status=false;
  this.t=a;
}
  

}
