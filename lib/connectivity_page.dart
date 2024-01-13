// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connectivity/bloc/internet_bloc.dart';

class ConnectivityPage extends StatelessWidget {
  const ConnectivityPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetBloc, InternetState>(
      listener: (context, state) {
        if (state is InternetGainedState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Text("Internet Gained"),
            ),
          );
        }
        if (state is InternetlostState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text("Internet Lost"),
            ),
          );
        }
      },
      child: BlocBuilder<InternetBloc, InternetState>(
        builder: (context, state) {
          Color appbarcolor =
              (state is InternetGainedState) ? Colors.green : Colors.red;

          return Scaffold(
            backgroundColor: Colors.grey[100],
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: appbarcolor,
              title: Text("Internet Checker"),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (state is InternetGainedState)
                    Text(
                      "Internet is Gained",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    )
                  else if (state is InternetlostState)
                    Text(
                      "Internet is Lost",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    )
                  else
                    Text("Unknown State"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
