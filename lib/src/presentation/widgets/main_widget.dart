import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kdigital_test/src/domain/entities/character_entity.dart';
import 'package:kdigital_test/src/presentation/bloc/main_bloc.dart';
import 'package:kdigital_test/src/presentation/bloc/main_event.dart';
import 'package:kdigital_test/src/presentation/bloc/main_state.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  int page = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MainPageBloc, MainPageState>(
        builder: (context, state) {
          int totalPages = 1;

          if (state is SuccessfulMainPageState) {
            totalPages = state.page;
          }

          return Column(
            children: [
              SizedBox(
                height: 60,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          if (page != 1) {
                            setState(() {
                              page = 1;
                            });
                            context.read<MainPageBloc>()
                              ..add(GetTestDataOnMainPageEvent(page));
                          }
                        },
                        child: Text('first')),
                    IconButton(
                      onPressed: () {
                        if (page > 1) {
                          setState(() {
                            page--;
                          });
                          context.read<MainPageBloc>()
                            ..add(GetTestDataOnMainPageEvent(page));
                        }
                      },
                      icon: Icon(Icons.arrow_left),
                    ),
                    Text(
                      '$page',
                      style: TextStyle(fontSize: 30),
                    ),
                    IconButton(
                      onPressed: () {
                        if (page < totalPages) {
                          setState(() {
                            page++;
                          });
                          context.read<MainPageBloc>()
                            ..add(GetTestDataOnMainPageEvent(page));
                        }
                      },
                      icon: Icon(Icons.arrow_right),
                    ),
                    TextButton(
                        onPressed: () {
                          if (page != totalPages) {
                            setState(() {
                              page = totalPages;
                            });
                            context.read<MainPageBloc>()
                              ..add(GetTestDataOnMainPageEvent(page));
                          }
                        },
                        child: Text('last')),
                  ],
                ),
              ),
              Expanded(
                child: Builder(
                  builder: (context) {
                    if (state is LoadingMainPageState) {
                      return _loadingWidget(context);
                    } else if (state is SuccessfulMainPageState) {
                      return _successWidget(context, state);
                    } else if (state is UnSuccessfulMainPageState) {
                      return _errorWidget(context, state.errorDescription);
                    } else {
                      return _errorWidget(context, 'Unknown error');
                    }
                  },
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          backgroundColor: Color.fromARGB(209, 0, 255, 255),
          onPressed: () => context.read<MainPageBloc>()
            ..add(GetTestDataOnMainPageEvent(page))),
    );
  }

  Widget _successWidget(BuildContext context, SuccessfulMainPageState state) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return _characterWidget(context, state.characters[index]);
            },
            childCount: state.characters.length,
          ),
        ),
      ],
    );
  }

  Widget _characterWidget(BuildContext context, CharacterEntity character) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(40),
        width: double.infinity,
        decoration: ShapeDecoration(
          color: Color.fromARGB(120, 204, 255, 255),
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              character.image,
              width: 300,
              height: 300,
            ),
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Text(
                character.name,
                style: TextStyle(fontSize: 25),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                'gender: ${character.gender}',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                'species: ${character.species}',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('status: '),
                  Text(
                    '${character.status}',
                    style: TextStyle(
                      color: (character.status == 'Alive')
                          ? Colors.green
                          : (character.status == 'Dead')
                              ? Colors.red
                              : Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _loadingWidget(
    BuildContext context,
  ) {
    return Center(
      child: Container(
        width: 50,
        height: 50,
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: const CircularProgressIndicator(),
      ),
    );
  }

  Widget _errorWidget(BuildContext context, String errorMessage) {
    return Center(
      child: Text(
        errorMessage,
      ),
    );
  }
}
