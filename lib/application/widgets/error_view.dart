import 'package:coco_explorer/domain/core/error/failure.dart';
import 'package:flutter/material.dart';

typedef OnRetry = Function();

class ErrorView extends StatelessWidget {
  final OnRetry onRetry;
  final Failure failure;

  const ErrorView({super.key, required this.onRetry, required this.failure});

  @override
  Widget build(BuildContext context) {
    String message = 'OOPS!! Something went wrong';
    if (failure.type == FailureType.internet) {
      message = 'No Internet Connection';
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            message,
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        ElevatedButton(onPressed: onRetry, child: const Text('Try Again'))
      ],
    );
  }
}
