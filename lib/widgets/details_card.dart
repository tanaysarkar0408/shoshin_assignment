// task_card.dart
import 'package:flutter/material.dart';
import 'package:shoshin_assignment/models/detail_model.dart';
import 'package:shoshin_assignment/screens/offer_screen.dart';
import '../models/task_model.dart';

class DetailsCard extends StatelessWidget {
  final DetailsModel details;

  const DetailsCard({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        // Navigator.push(context, MaterialPageRoute(builder: (context) => OfferScreen(task: details)));
      },
      child: Card(
        elevation: 5,
        child: Row(
          children: [
            Center(
              child: CircleAvatar(
                radius: 30,
                child: Text(details.eventId),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0,left: 20),
              child: Center(
                child: Container(
                  width: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(details.title),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        width: 80,
                        height: 30,
                        child: Center(child: Text(details.payout)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:50,left: 120.0,right: 0),
              child: Text(
                details.payout,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
