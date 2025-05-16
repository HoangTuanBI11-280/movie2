import 'package:flutter/material.dart';
import 'package:movie2/custom_nav_bar.dart';
import 'package:movie2/screen/Catergory_screen.dart';
import 'package:movie2/screen/Home_screen.dart';
import 'package:movie2/screen/User_screen.dart';
import 'package:movie2/screen/avenger_united_screen.dart';
import 'package:movie2/screen/character_screen.dart';
import 'package:movie2/screen/comic_screen.dart';
import 'package:movie2/screen/game_screen.dart';
import 'package:movie2/screen/ironman_screen.dart';
import 'package:movie2/screen/loki_screen.dart';
import 'package:movie2/screen/marvel_voice_screen.dart';
import 'package:movie2/screen/movie_screen.dart';
import 'package:movie2/screen/spider_man_screen.dart';
import 'package:movie2/screen/spider_screen.dart';
import 'package:movie2/screen/splash_screen.dart';
import 'package:movie2/screen/tv_show_screen.dart';
import 'package:movie2/screen/what_if_screen.dart';
import 'package:movie2/setting/setting_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  HomeScreen.routeName:(context) => HomeScreen(),
  CategoryScreen.routeName:(context) => CategoryScreen(),
  UserScreen.routeName: (context) => UserScreen(), 
  AvengerUnitedScreen.routeName: (context) => AvengerUnitedScreen(),
  CharacterScreen.routeName: (context) => CharacterScreen(),
  ComicScreen.routeName: (context) => ComicScreen(),
  GameScreen.routeName: (context) => GameScreen(),
  IronManScreen.routeName: (context) => IronManScreen(),
  LokiScreen.routeName:(context) => LokiScreen(),
  MarvelVoiceScreen.routeName:(context) => MarvelVoiceScreen(),
  MovieScreen.routeName:(context) => MovieScreen(),
  SpiderManScreen.routeName:(context) => SpiderManScreen(),
  SpiderScreen.routeName:(context) => SpiderScreen(),
  TVShowScreen.routeName: (context) => TVShowScreen(),
  WhatIfScreen.routeName:(context) => WhatIfScreen(),
  CustomNavBar.routeName: (context) => CustomNavBar(),
  SettingScreen.routeName: (context) => SettingScreen(),
  TheMarvelScreen.routeName: (context) => TheMarvelScreen(),
};