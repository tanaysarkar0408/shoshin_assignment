import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:shoshin_assignment/widgets/task_card.dart';
import '../models/task_model.dart';


class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  // final List<TaskModel> tasks = [
  late Future<List<TaskModel>> _futureTasks;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _futureTasks = _fetchTasks();
  }

  Future<List<TaskModel>> _fetchTasks() async {
    // Load the JSON data from the local file
    String jsonData = await rootBundle.loadString('assets/dummy_tasks.json');
    // Parse the JSON data
    List<dynamic> jsonTasks = jsonDecode(jsonData);
    // Convert each JSON object to a TaskModel object
    List<TaskModel> tasks = jsonTasks.map((json) => TaskModel.fromJson(json)).toList();
    return tasks;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 200,
      child:  FutureBuilder<List<TaskModel>>(
        future: _futureTasks,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            // If the future is complete and data is received, display the data using CarouselSlider
            final tasks = snapshot.data!;
            return
               CarouselSlider.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index, realIndex) {
                  final task = tasks[index];
                  // Here, you can create widgets to display each task based on the task data
                  return TaskCard(task: task);
                },
                options: CarouselOptions(
                  autoPlayCurve: Curves.easeInToLinear,
                  autoPlay: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 500),
                  enlargeCenterPage: true,
                  aspectRatio: 4/3,
                  viewportFraction: 0.5,
                ),

            );
          }
        },
      ),
    );
  }
}
