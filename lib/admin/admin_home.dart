import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/admin/admin_login.dart';

class adminhome extends StatefulWidget {
  const adminhome({super.key});

  @override
  State<adminhome> createState() => _adminhomeState();
}

class _adminhomeState extends State<adminhome> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromRGBO(188, 10, 15, 1),
              title: const Text(
                'MANAGE ROUTES',
                style: TextStyle(color: Colors.white),
              ),
            ),
            drawer: Drawer(
              backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                      child: Image(
                        image: AssetImage('assets/images/logo.png'),
                      )),
                  ListTile(
                    leading: const Icon(
                      Icons.home,
                      color: Colors.yellow,
                      size: 25,
                    ),
                    title: const Text('HOME',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black)),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.map,
                      color: Colors.yellow,
                      size: 25,
                    ),
                    title: const Text('MANAGE VIEW',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const adminhome()),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.logout,
                      color: Colors.yellow,
                      size: 25,
                    ),
                    title: const Text('LOGOUT',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const adminlogin()),
                      );
                    },
                  ),
                ],
              ),
            ),
            body:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(height: 20),
              TabBar(
                labelColor: Colors.pink,
                unselectedLabelColor: Colors.yellow,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Colors.purple,
                indicator: BoxDecoration(
                    color: const Color.fromRGBO(188, 10, 15, 0.2),
                    borderRadius: BorderRadius.circular(15)),
                controller: tabController,
                isScrollable: true,
                labelPadding: EdgeInsets.symmetric(horizontal: 25),
                tabs: const [
                  Tab(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "INFO",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Tab(
                      child: Text(
                        "TIME",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Tab(
                      child: Text(
                        "ROUTE",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Expanded(
                child: TabBarView(
                    controller: tabController,
                    children: const [info(), time(), route()]),
              )
            ])));
  }
}

class info extends StatefulWidget {
  const info({super.key});

  @override
  State<info> createState() => _infoState();
}

class _infoState extends State<info> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: FourBoxesColumn());
  }
}

class FourBoxesColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BoxWithHeadingAndTexts(heading: 'Route Name: North Karachi', texts: [
          'Bus number: 1',
          'Arrival Time: 08:15 am',
          'Departure Time: 06:30 pm',
        ]),
        SizedBox(height: 20),
        BoxWithHeadingAndTexts(heading: 'Route Name: Gulistan-e-Johar', texts: [
          'Bus number: 2',
          'Arrival Time: 08:15 am',
          'Departure Time: 06:30 pm',
        ]),
        SizedBox(height: 20),
        BoxWithHeadingAndTexts(heading: 'Route Name: Malir', texts: [
          'Bus number: 3',
          'Arrival Time: 08:15 am',
          'Departure Time: 06:30 pm',
        ]),
        SizedBox(height: 20),
        BoxWithHeadingAndTexts(heading: 'Route Name: Gulshan-e-Iqbal', texts: [
          'Bus number: 4',
          'Arrival Time: 08:15 am',
          'Departure Time: 06:30 pm',
        ]),
      ],
    );
  }
}

class BoxWithHeadingAndTexts extends StatelessWidget {
  final String heading;
  final List<String> texts;

  BoxWithHeadingAndTexts({required this.heading, required this.texts});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                color: Color.fromRGBO(188, 10, 15, 0.2),
                child: Text(
                  heading,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            for (String text in texts)
              Text(
                text,
                style: TextStyle(fontSize: 16),
              ),
          ],
        ),
      ),
    );
  }
}

class time extends StatefulWidget {
  const time({super.key});

  @override
  State<time> createState() => _timeState();
}

class _timeState extends State<time> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: TwoBoxesColumn());
  }
}

class TwoBoxesColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BoxWithContent(
          heading: 'Arrival Time',
          //backgroundColor: Colors.pink,
          textContent: '08:15 AM',
        ),
        SizedBox(height: 20),
        BoxWithContent(
          heading: 'Departure Time',
          // backgroundColor: Colors.blue,
          textContent: '06:30 AM',
        ),
      ],
    );
  }
}

class BoxWithContent extends StatelessWidget {
  final String heading;

  final String textContent;

  BoxWithContent({
    required this.heading,
    required this.textContent,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 250,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              child: Text(
                heading,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              color:
                  Color.fromRGBO(188, 10, 15, 0.2), // Background color for text
              padding: EdgeInsets.all(8),
              child: Text(
                textContent,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 10),
            CupertinoTimerPicker(
              mode: CupertinoTimerPickerMode.hm,
              onTimerDurationChanged: (Duration newDuration) {
                // Handle the selected time here
              },
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('am'),
                SizedBox(width: 10),
                Text('pm'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class route extends StatefulWidget {
  const route({super.key});

  @override
  State<route> createState() => _routeState();
}

class _routeState extends State<route> {
  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, children: [
      // or Expanded
      Image.asset(
        'assets/images/map.png', // Replace with your image path
        fit: BoxFit.cover,
      ),
    ]);
  }
}
