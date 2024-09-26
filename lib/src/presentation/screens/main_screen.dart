import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:kdigital_test/src/domain/usecases/get_characters_usecase.dart';
import 'package:kdigital_test/src/presentation/bloc/main_bloc.dart';
import 'package:kdigital_test/src/presentation/bloc/main_event.dart';
import 'package:kdigital_test/src/presentation/bloc/main_state.dart';
import 'package:kdigital_test/src/presentation/widgets/main_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MainPageBloc(InitialMainPageState(), GetIt.I.get<GetCharacters>())
            ..add(GetTestDataOnMainPageEvent(1)),
      child: MainWidget(),
    );
  }
}
