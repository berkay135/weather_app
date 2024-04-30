import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.fromLTRB(40, 1.2 *kToolbarHeight, 40, 20),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(3,-0.3),
                  child: Container(
                    height: 200,
                    width: 300,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.lightBlueAccent
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-3,-0.3),
                  child: Container(
                    height: 200,
                    width: 300,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.lightBlueAccent
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0,-1.2),
                  child: Container(
                    height: 300,
                    width: 600,
                    decoration: BoxDecoration(
                        color: Color(0xFFFFAB40)
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0,1.0),
                  child: Container(
                    height: 300,
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.black12
                    ),
                  ),
                ),
                BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.transparent),
                  ),
                ),
                BlocBuilder<WeatherBloc, WeatherState>(
                  builder: (context, state) {
                    if (state is WeatherSuccess) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                //"${state.weather.areaName}",
                              "Ankara",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Good Morning",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  scale: 4,
                                    "assets/1.png"
                                )
                              ],
                            ),
                            Center(
                              child: Text(
                                "${state.weather.temperature!.celsius!.round()}°C",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 55,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                "${state.weather.weatherMain!.toUpperCase()}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Center(
                              child: Text(
                                DateFormat("EEEE dd •").add_jm().format(state.weather.date!),
                                //"Friday 16 • 09.41am",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                          "assets/7.png",
                                          scale: 20
                                      ),
                                      const SizedBox(width: 3),
                                       Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Sunrise",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300,
                                                fontSize: 13
                                            ),
                                          ),
                                          SizedBox(height: 3),
                                          Text(
                                            DateFormat("").add_jm().format(state.weather.sunrise!),
                                            //"5:34 am",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 13
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 50),
                                  Row(
                                    children: [
                                      Image.asset(
                                          "assets/12.png",
                                          scale: 20
                                      ),
                                      const SizedBox(width: 3),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Sunset",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300,
                                                fontSize: 13
                                            ),
                                          ),
                                          SizedBox(height: 3),
                                          Text(
                                              DateFormat("").add_jm().format(state.weather.sunset!),
                                            //"5:34 am",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 13
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.0),
                              child: Divider(
                                color: Colors.grey,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                          "assets/11.png",
                                          scale: 20
                                      ),
                                      const SizedBox(width: 3),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Temp Max",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w300,
                                                fontSize: 13
                                            ),
                                          ),
                                          SizedBox(height: 3),
                                          Text(
                                            "${state.weather.tempMax!}",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 11
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 50),
                                  Row(
                                    children: [
                                      Image.asset(
                                          "assets/10.png",
                                          scale: 20
                                      ),
                                      const SizedBox(width: 3),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Temp Min",
                                            style:  TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w300,
                                                fontSize: 13
                                            ),
                                          ),
                                          SizedBox(height: 3),
                                          Text(
                                            "${state.weather.tempMin!}",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 11
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                      ),
                    );
                    } else {
                      return Container();
                    }
                    },
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
