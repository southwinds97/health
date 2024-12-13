import 'package:flutter/material.dart';
import 'models/workout.dart';
import 'days/monday.dart';
import 'days/tuesday.dart';
import 'days/wednesday.dart';
import 'days/thursday.dart';
import 'days/friday.dart';
import 'days/saturday.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workout Routine',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WorkoutRoutinePage(),
    );
  }
}

class WorkoutRoutinePage extends StatelessWidget {
  final List<Workout> workouts = [
    mondayWorkout,
    tuesdayWorkout,
    wednesdayWorkout,
    thursdayWorkout,
    fridayWorkout,
    saturdayWorkout,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workout Routine'),
      ),
      body: ListView.builder(
        itemCount: workouts.length,
        itemBuilder: (context, index) {
          return WorkoutCard(workout: workouts[index]);
        },
      ),
    );
  }
}

class WorkoutCard extends StatelessWidget {
  final Workout workout;

  WorkoutCard({required this.workout});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              workout.day,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ...workout.exercises.map((exercise) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                      '${exercise.name}: ${exercise.sets}세트, ${exercise.reps}'),
                )),
          ],
        ),
      ),
    );
  }
}
