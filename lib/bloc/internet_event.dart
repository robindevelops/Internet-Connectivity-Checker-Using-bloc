part of 'internet_bloc.dart';

@immutable
sealed class InternetEvent {}

class InternetGainedEvent extends InternetEvent {}

class InternetlostEvent extends InternetEvent {}
