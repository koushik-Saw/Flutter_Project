import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:learner/new_task.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'moor_database.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  static String videoID = 'RGWqMOHgZbw';
  Map<DateTime, List<dynamic>> selectedEvents = {};
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  TextEditingController _eventController = TextEditingController();
  TextEditingController productNameController = TextEditingController();

  TextEditingController priceController = TextEditingController();
  bool isloading = false;

  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: videoID,
    flags: YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );

  @override
  void initState() {
    selectedEvents = {};
    super.initState();
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              profileavater(size),
              SizedBox(
                height: 30,
              ),
              VideoSection(size),
              SizedBox(
                height: 30,
              ),
              LessonPricing(size),
              SizedBox(
                height: 30,
              ),
              Container(
                  height: 850,
                  width: size.width,
                  margin:
                      EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Expanded(child: _buildTaskList(context)),
                      NewTaskInput(),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  StreamBuilder<List<Task>> _buildTaskList(BuildContext context) {

    return StreamBuilder(
      stream: AppDatabase().watchAllTasks(),
      builder: (context, AsyncSnapshot<List<Task>> snapshot) {
        final tasks = snapshot.data ?? List.empty(growable: true);
        return ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (_, index) {
            final itemTask = tasks[index];
            return _buildListItem(itemTask);
          },
        );
      },
    );
  }

  Widget _buildListItem(Task itemTask) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () => AppDatabase().deleteTask(itemTask),
        )
      ],
      child: CheckboxListTile(
        title: Text(itemTask.name),
        subtitle: Text(itemTask.dueDate?.toString() ?? 'No date'),
        value: itemTask.completed,
        onChanged: (newValue) {
          AppDatabase().updateTask(itemTask.copyWith(completed: newValue));
        },
      ),
    );
  }

  Container LessonPricing(Size size) {
    return Container(
      height: 400,
      width: size.width,
      margin: EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: SizedBox(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              )),
          child: Padding(
            padding: EdgeInsets.only(left: 10, top: 15, right: 10, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("25 Minutes"),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Language"),
                    Text("Russian"),
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                SizedBox(
                  height: 45,
                  child: ElevatedButton.icon(
                      icon: Icon(Icons.bolt),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.indigo,
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(7.0),
                        ),
                      ),
                      label: Text("7 days free trial")),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 45,
                  child: ElevatedButton.icon(
                      icon: Icon(Icons.message),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.indigo,
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(7.0),
                        ),
                      ),
                      label: Text("Chat")),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("New Customers are eligible for 7 days trials "),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("1 Lesson"),
                    Text("14/mo"),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("4 Lesson"),
                    Text("49/mo"),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("8 Lesson"),
                    Text("89/mo"),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("16 Lesson"),
                    Text("159/mo"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container VideoSection(Size size) {
    return Container(
      height: 320,
      width: size.width,
      margin: EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: SizedBox(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              )),
          child: Padding(
            padding: EdgeInsets.only(left: 10, top: 15, right: 10, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Video"),
                SizedBox(
                  height: 15,
                ),
                YoutubePlayer(
                  controller: _controller,
                  liveUIColor: Colors.amber,
                  showVideoProgressIndicator: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container profileavater(Size size) {
    return Container(
      height: 600,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: SizedBox(
        height: size.height * 200,
        child: Stack(
          children: [
            //Background
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  )),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  topLeft: Radius.circular(15),
                ),
                child: Image.network(
                  "https://images.unsplash.com/20/cambridge.JPG?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1030&q=80",
                  fit: BoxFit.fill,
                  width: size.width * 2,
                  height: 200,
                ),
              ),
            ),
            //Avater Area
            Center(
              child: Column(
                children: [
                  Container(
                    height: size.height * .27,
                    width: size.width * .5,
                    margin:
                        EdgeInsets.only(left: 0, right: 0, top: 100, bottom: 0),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=634&q=80"),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Galina",
                    style: TextStyle(fontSize: 26),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                primary: Colors.indigo),
                            child: Text("7 days free trial")),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        height: 40,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                primary: Colors.indigo),
                            child: Text("Chat")),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 90,
                    height: 30,
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey,
                    ),
                    child: Text(
                      "Russian",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            //Address Area
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.transparent,
                  height: 450,
                  margin: EdgeInsets.only(top: 40),
                ),
                Row(children: <Widget>[
                  SizedBox(
                    width: 5,
                  ),
                  Icon(Icons.location_pin),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "From Ukrain",
                    style: TextStyle(fontSize: 18),
                  )
                ]),
                SizedBox(
                  height: 5,
                ),
                Row(children: <Widget>[
                  SizedBox(
                    width: 5,
                  ),
                  Icon(Icons.messenger),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Speaks Russian",
                    style: TextStyle(fontSize: 18),
                  )
                ]),
                SizedBox(
                  height: 5,
                ),
                Row(children: <Widget>[
                  SizedBox(
                    width: 5,
                  ),
                  Icon(Icons.menu_book_outlined),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "2 Lessons",
                    style: TextStyle(fontSize: 18),
                  )
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
