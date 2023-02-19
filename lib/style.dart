import 'package:flutter/material.dart';

RoundedRectangleBorder listTileBorderRadius() {
  return const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30), topRight: Radius.circular(30)));
}
