import 'package:flutter/material.dart';
import 'user.dart';

//المتيريال هي عباره عن صور وحقول واشكال فيها فهي مكتبه نستدعيها
//وبرضو تتعامل مع API
void main() {
  runApp(const MyApp());
}

//شي اشوفه لكن ماقدر اتفاعل معه stateless
//widget هو جزء صغير له خصائص
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          //الى هنا صح

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Homebage() // استدعاء ل كلاس هوم بيج
        );
  }
}

bool isSecured = true;
Map<String, User> users = {
  "tahani@gmail.com": User(email: 'tahani@gmail.com', password: '12345'),
  "vio@gmail.com": User(email: 'vio@gmail.com', password: '1212t'),
};

class Homebage extends StatefulWidget {
  const Homebage({super.key});

  @override
  State<Homebage> createState() => _HomebageState();
}

class _HomebageState extends State<Homebage> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 15, 41, 86),
        centerTitle: true,
        title: Text(
          "Login Scrern",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              'assets/Login.jpg',
              width: 350,
              height: 350,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextFormField(
                    controller: emailcontroller,
                    decoration: InputDecoration(
                      label: Text(' Enter Email'),
                      prefixIcon: Icon(Icons.person, color: Colors.black),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  TextFormField(
                    controller: passwordcontroller,
                    obscureText: isSecured,
                    decoration: InputDecoration(
                      label: Text(' Enter passward'),
                      prefixIcon: Icon(Icons.lock, color: Colors.black),
                      suffixIcon: IconButton(
                        onPressed: () {
                          //print(isSecured);
                          setState(() {
                            isSecured = !isSecured;
                          });
                          //print(isSecured);
                        },
                        icon: Icon(Icons.remove_red_eye),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: () {
                      User user = users[emailcontroller.text]!;

                      if (user.email == emailcontroller.text &&
                          user.password == passwordcontroller.text) {
                        print('logged');
                      } else {
                        print('email or pass is wrong');
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Color.fromARGB(255, 15, 41, 86),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Login',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(Icons.login, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
