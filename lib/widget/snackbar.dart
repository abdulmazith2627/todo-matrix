
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void snackBar(title,message,context){
  Get.showSnackbar(
      GetSnackBar(
        title:title,
        message:message,
        showProgressIndicator:true,
        duration:const Duration(seconds:2),
      )
  );
}