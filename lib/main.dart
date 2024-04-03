import 'package:flutter/material.dart';

void main() {
  runApp(EducationalApp());
}

class EducationalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue[900],
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          headline6: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blue[900],
          ),
          bodyText2: TextStyle(
            fontSize: 16,
            color: Colors.blue[900],
          ),
        ),
      ),
      home: UserSelectionPage(),
    );
  }
}

class UserSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Selection'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            UserBox(
              text: 'ADVISOR',
              icon: Icons.school,
              color: Colors.blue,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StudentListPage()),
                );
              },
            ),
            UserBox(
              text: 'STUDENT',
              icon: Icons.person,
              color: Colors.blue.shade400,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TeacherListPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class UserBox extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const UserBox({
    Key? key,
    required this.text,
    required this.icon,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50,
              color: Colors.white,
            ),
            SizedBox(height: 10),
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TeacherListPage extends StatelessWidget {
  final List<String> teachers = ['Teacher 1', 'Teacher 2', 'Teacher 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Teacher'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(20),
        itemCount: teachers.length,
        itemBuilder: (context, index) {
          final teacher = teachers[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    teacher,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => RequestDialog(teacher),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue.shade400,
                ),
                child: Text(
                  'Send Request',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
            ],
          );
        },
      ),
    );
  }
}

class RequestDialog extends StatelessWidget {
  final String teacher;

  RequestDialog(this.teacher);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Request to $teacher',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(
                        'Are you sure you want to send a request to $teacher?'),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Request Sent'),
                            ),
                          );
                        },
                        child: Text('Yes'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue.shade400,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('No'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue.shade400,
                        ),
                      ),
                    ],
                  ),
                );
              },
              child: Text('Send Request'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue.shade400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StudentListPage extends StatelessWidget {
  final List<String> students = ['Student 1', 'Student 2', 'Student 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student List'),
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];
          return ListTile(
            leading: Icon(Icons.person),
            title: Text(student),
            onTap: () {
              // Do something when a student is tapped
            },
          );
        },
      ),
    );
  }
}
