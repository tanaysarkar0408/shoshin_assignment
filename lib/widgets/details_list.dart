import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:shoshin_assignment/models/detail_model.dart';
import 'package:shoshin_assignment/widgets/details_card.dart';
import 'package:shoshin_assignment/widgets/task_card.dart';
import '../models/task_model.dart';

class DetailsList extends StatefulWidget {
  @override
  State<DetailsList> createState() => _DetailsListState();
}

class _DetailsListState extends State<DetailsList> {
  // final List<TaskModel> tasks = [
  late Future<List<DetailsModel>> _futureDetails;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _futureDetails = _fetchDetails();
  }

  Future<List<DetailsModel>> _fetchDetails() async {
    // Load the JSON data from the local file
    String jsonData = await rootBundle.loadString('assets/dummy_details.json');
    // Parse the JSON data
    List<dynamic> jsonTasks = jsonDecode(jsonData);
    // Convert each JSON object to a TaskModel object
    List<DetailsModel> details =
        jsonTasks.map((json) => DetailsModel.fromJson(json)).toList();
    return details;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DetailsModel>>(
      future: _futureDetails,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          // If the future is complete and data is received, display the data using CarouselSlider
          final details = snapshot.data!;
          return
            CarouselSlider.builder(
            itemCount: details.length,
            itemBuilder: (context, index, realIndex) {
              final detail = details[index];
              // Here, you can create widgets to display each task based on the task data
              return DetailsCard(details:detail );
            },
            options: CarouselOptions(
              height: 400,
              scrollDirection: Axis.vertical,
              // autoPlay: true,
              enlargeFactor: .1,
              enlargeCenterPage: true,
              viewportFraction: .3
            ),
          );
        }
      },
    );
  }
}
