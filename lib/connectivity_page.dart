// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connectivity/bloc/internet_bloc.dart';

class ConnectivityPage extends StatelessWidget {
  const ConnectivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetBloc, InternetState>(
      listener: (context, state) {
        if (state is InternetGainedState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Text("Interned Gained"),
            ),
          );
        }
        if (state is InternetlostState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text("Interned Lost"),
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
          title: Text("Internet Checker"),
        ),
        body: Center(
          child: BlocBuilder<InternetBloc, InternetState>(
            builder: (context, state) {
              if (state is InternetGainedState) {
                return Text("Gained");
              }
              if (state is InternetlostState) {
                return Text("Lost");
              }

              // Add a default return or throw statement here
              return Text("Unknown State");
            },
          ),
        ),
      ),
    );
  }
}
