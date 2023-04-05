import 'package:flutter/material.dart';
import 'package:offerte_lavoro_flutter_app/widgets/filter_item.dart';

class Mocks {
  static const categories = [
    FilterItem(
      'Junior',
      icon: Icons.star_border_purple500_outlined,
      selected: true,
    ),
    FilterItem(
      'Senior',
      icon: Icons.star,
    ),
    FilterItem(
      'Mid',
      icon: Icons.star_half,
    ),
    FilterItem(
      'Full-time',
      icon: Icons.calendar_month,
    ),
    FilterItem(
      'Part-time',
      icon: Icons.timer,
    ),
    FilterItem(
      'Full-remote',
      icon: Icons.travel_explore,
    ),
    FilterItem(
      'Ibrido',
      icon: Icons.business_center_rounded,
    ),
    FilterItem(
      'In sede',
      icon: Icons.pin_drop,
    ),
  ];
}
