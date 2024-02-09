import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoshin_assignment/widgets/curved_edges.dart';
import 'package:shoshin_assignment/widgets/details_list.dart';
import 'package:shoshin_assignment/widgets/task_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipPath(
                clipper: TCustomCurvedEdges(),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xff4896D7), Colors.lightBlueAccent],
                    ),
                  ),
                  height: 140,
                  width: double.maxFinite,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        IconButton(
                          color: Colors.white,
                          icon: const Icon(
                            Icons.menu_outlined,
                          ),
                          onPressed: () {},
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Hey Shubham',
                          style: GoogleFonts.karla(
                              color: Colors.white, fontSize: 24),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40.0),
                          child: SizedBox(
                            height: 40,
                            width: 100,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              elevation: 5,
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: const Center(
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      child: Icon(Icons.wallet),
                                    ),
                                    Text('\$ 452'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildColumn(0, Icons.local_offer_outlined, 'All Offers'),
              buildColumn(1, Icons.card_giftcard_sharp, 'Gifts'),
              buildColumn(2, Icons.watch_later_outlined, 'Upcoming'),
              buildColumn(3, Icons.check_circle_outline, 'My Offers'),
            ],
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.local_fire_department_rounded,
                      color: Colors.amber,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Trending Offers',
                      style: GoogleFonts.aBeeZee(fontSize: 25),
                    ),
                  ],
                ),
              ),
              const Divider(height:1,
                  thickness: 2),
              const SizedBox(height: 32),
              const SizedBox( child: TaskList()),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(Icons.menu_open_rounded,color: Colors.blue,),
                    const SizedBox(width: 10,),
                    Text(
                      'More Offers',
                      style: GoogleFonts.acme(
                        fontSize: 25,
                        color: Colors.grey
                      ),
                    ),
                  ],
                ),
              ),
              DetailsList(),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector buildColumn(int index, IconData icon, String text) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index; // Update the selected index
        });
      },
      child: Column(
        children: [
          Icon(icon, color: _selectedIndex == index ? Colors.blue : null), // Change color based on selection
          Text(
            text,
            style: TextStyle(
              color: _selectedIndex == index ? Colors.blue : null, // Change text color based on selection
            ),
          ),
        ],
      ),
    );
  }
}
