import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LocalizationStates extends Equatable
{
  const LocalizationStates();

  @override
  List<Object?> get props => [];
}

class LocalizationLoadingState extends LocalizationStates
{
  const LocalizationLoadingState();
}

class LocalizationSuccessState extends LocalizationStates
{
  const LocalizationSuccessState({required this.locale});

  final Locale locale;
  
  @override
  List<Object?> get props => [locale];
}

class LocalizationFailureState extends LocalizationStates
{
  const LocalizationFailureState({required this.errorMessage});

  final String errorMessage;
  
  @override
  List<Object?> get props => [errorMessage];
}
