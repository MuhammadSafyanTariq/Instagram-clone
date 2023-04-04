import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/Screens/add_post_screen.dart';
import 'package:insta_clone/Screens/feed_screen.dart';
import 'package:insta_clone/Screens/profile_Screen.dart';
import 'package:insta_clone/Screens/search_screen.dart';

const webScreenSize = 600;
List<Widget> homeScreenItems = [
  FeedScreen(),
  SearchScreen(),
  AddPostScreen(),
  Center(
    child: Text('...Wellcome to bunnygram...'),
  ),
  ProfileScreen(
    uid: FirebaseAuth.instance.currentUser!.uid,
  ),
];
