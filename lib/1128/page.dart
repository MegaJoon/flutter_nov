import 'package:flutter/material.dart';

abstract class Page extends StatelessWidget {
  const Page(this.leading, this.title);

  final Widget leading;
  final String title;
}