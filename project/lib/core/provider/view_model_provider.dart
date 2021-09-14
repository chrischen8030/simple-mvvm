import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum _ViewModelProviderType { WithoutConsumer, WithConsumer }

/// A widget that provides base functionality for the Mvvm style provider architecture by FilledStacks.
class ViewModelProvider<T extends ChangeNotifier> extends StatelessWidget {
  final Widget? staticChild;
  final Widget Function(BuildContext, T, Widget?) builder;
  final T viewModel;
  final _ViewModelProviderType providerType;

  ViewModelProvider.withoutConsumer({
    required this.viewModel,
    required this.builder
  })  : providerType = _ViewModelProviderType.WithoutConsumer,
        staticChild = null;

  ViewModelProvider.withConsumer({
    required this.viewModel,
    required this.builder,
    this.staticChild = null
  }) : providerType = _ViewModelProviderType.WithConsumer;

  @override
  Widget build(BuildContext context) {
     if (this.providerType == _ViewModelProviderType.WithoutConsumer) {
      return ChangeNotifierProvider(
        create: (context) => this.viewModel,
        child: this.builder(context, this.viewModel, null),
      );
    }

    return ChangeNotifierProvider(
      create: (context) => this.viewModel,
      child: Consumer(
        builder: this.builder,
        child: this.staticChild,
      ),
    );
  }
}
