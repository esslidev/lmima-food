import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? id;
  final String? email;
  final String? password;
  final String? firstName;
  final String? lastName;
  final String? imageUrl;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  //final UserMeasurementEntity? measurements;
  //final List<MealPlanEntity>? mealPlans;
  //final List<FitnessPlanEntity>? fitnessPlans;

  const UserEntity({
    this.id,
    this.email,
    this.password,
    this.firstName,
    this.lastName,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
    //this.measurements,
    //this.mealPlans,
    //this.fitnessPlans,
  });

  @override
  List<Object?> get props => [
        id,
        email,
        password,
        firstName,
        lastName,
        imageUrl,
        createdAt,
        updatedAt,
        //measurements,
        //mealPlans,
        //fitnessPlans,
      ];
}
