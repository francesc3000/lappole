import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lappole/src/model/watch.dart';
import 'package:lappole/src/user/sub_page/user_club/bloc/user_club_bloc.dart';
import 'package:lappole/src/user/sub_page/user_club/bloc/user_club_event.dart';
import 'package:lappole/src/user/sub_page/user_club/bloc/user_club_state.dart';
import 'package:lappole/src/user/widget/add_delete_widget.dart';

class WatchWidget extends SliverPersistentHeaderDelegate {
  final userClubBloc = Modular.get<UserClubBloc>();

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    Watch? watch;

    return BlocBuilder<UserClubBloc, UserClubState>(
        bloc: userClubBloc,
        buildWhen: (context, state) {
          return state is UploadUserClubLoginState;
        },
        builder: (BuildContext context, state) {
          bool canAddWatch = false;

          if (state is UploadUserClubLoginState) {
            watch = state.user.watch;
            canAddWatch = state.user.canAddWatch;
          }

          bool isWatchNull = watch == null ? true : false;

          return Visibility(
            visible: canAddWatch,
            child: Column(
              children: [
                const Text('Reloj'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: isWatchNull,
                      child: const Text('No tienes ningun reloj emparejado'),
                    ),
                    Visibility(
                      visible: !isWatchNull,
                      child: Column(
                        children: [
                          Text('Nombre: ${watch?.name ?? ''}'),
                        ],
                      ),
                    ),
                    AddDeleteWidget(
                      isObjectNull: isWatchNull,
                      onTap: () => userClubBloc.add(AddDeleteWatchEvent()),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }

  @override
  double get maxExtent => 64;

  @override
  double get minExtent => 24;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
