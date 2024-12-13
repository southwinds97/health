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
      title: '운동 루틴',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WorkoutRoutinePage(),
    );
  }
}

class WorkoutRoutinePage extends StatefulWidget {
  @override
  _WorkoutRoutinePageState createState() => _WorkoutRoutinePageState();
}

class _WorkoutRoutinePageState extends State<WorkoutRoutinePage> {
  final Map<int, Workout> workouts = {
    DateTime.monday: mondayWorkout,
    DateTime.tuesday: tuesdayWorkout,
    DateTime.wednesday: wednesdayWorkout,
    DateTime.thursday: thursdayWorkout,
    DateTime.friday: fridayWorkout,
    DateTime.saturday: saturdayWorkout,
  };

  Workout getTodayWorkout() {
    int today = DateTime.now().weekday;
    return workouts[today] ?? Workout(day: '오늘은 운동이 없습니다', exercises: []);
  }

  @override
  Widget build(BuildContext context) {
    Workout todayWorkout = getTodayWorkout();

    return Scaffold(
      appBar: AppBar(
        title: Text('Workout Routine'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '오늘의 운동 (${todayWorkout.day})',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todayWorkout.exercises.length,
              itemBuilder: (context, index) {
                return ExerciseTile(exercise: todayWorkout.exercises[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ExerciseTile extends StatefulWidget {
  final Exercise exercise;

  ExerciseTile({required this.exercise});

  @override
  _ExerciseTileState createState() => _ExerciseTileState();
}

class _ExerciseTileState extends State<ExerciseTile> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
          '${widget.exercise.name}: ${widget.exercise.sets}세트, ${widget.exercise.reps}'),
      trailing: Checkbox(
        value: isChecked,
        onChanged: (bool? value) {
          setState(() {
            isChecked = value ?? false;
          });
        },
      ),
    );
  }
}
