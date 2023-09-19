import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lappole/src/main/main_basic_page.dart';
import 'package:lappole/src/main/bloc/main_bloc.dart';
import 'package:lappole/src/main/bloc/main_event.dart';
import 'package:lappole/src/main/bloc/main_state.dart';
import 'package:lappole/src/model/event.dart';

class MainMobilePage extends MainBasicPage {
  final ScrollController _scrollController = ScrollController();
  MainMobilePage(String title, {Key? key}) : super(title, key: key);

  @override
  Widget body(BuildContext context) {
    bool isLoading = false;

    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.position.pixels) {
        if (!isLoading) {
          isLoading = !isLoading;
          // Perform event when user reach at the end of list (e.g. do Api call)
        }
      }
    });

    return BlocBuilder<MainBloc, MainState>(
        bloc: mainBloc,
        builder: (BuildContext context, state) {
          bool loading = false;
          List<Event>? events;

          if (state is MainInitState) {
            loading = true;
            mainBloc.add(MainInitialDataEvent());
          } else if (state is UploadMainFields) {
            events = state.events;
            if (_scrollController.hasClients) {
              _scrollController.animateTo(
                _scrollController.position.maxScrollExtent,
                curve: Curves.easeOut,
                duration: const Duration(milliseconds: 500),
              );
            }
          }

          if (loading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: ListView.builder(
              controller: _scrollController,
              shrinkWrap: true,
              // physics: const PageScrollPhysics(),
              itemCount: events?.length ?? 0,
              itemBuilder: (context, index) {
                Event event = events![index];
                return SizedBox(
                  height: (MediaQuery.of(context).size.height / 3) - 40,
                  child: Column(
                    // mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(event.name),
                      event.hasData
                          ? Text(event.eventData!.counter.round().toString())
                          : Container(),
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.personRunning),
                        onPressed: event.hasData
                            ? () => mainBloc.add(AddKmEvent(event.id))
                            : null,
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        });
  }
}
