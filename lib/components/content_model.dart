import 'package:flutter/material.dart';

class OnboardingContent {
  final String image;
  final String title;
  final String description;

  OnboardingContent({required this.image, required this.title, required this.description});

}

List<OnboardingContent> contents = [
  OnboardingContent(
    image: "assets/images/Group8902.png",
    title: 'Add Client', 
    description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem I',
  ),
  OnboardingContent(
    image: "assets/images/Group8902.png",
    title: 'Send Document Request', 
    description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem I',
  ),
  OnboardingContent(
    image: "assets/images/Hand.png",
    title: 'Update ITR', 
    description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem I',
  ),
];