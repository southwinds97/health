class Workout {
  final String day;
  final List<Exercise> exercises;

  Workout({required this.day, required this.exercises});
}

class Exercise {
  final String name;
  final int sets;
  final String reps;

  Exercise({required this.name, required this.sets, required this.reps});
}
