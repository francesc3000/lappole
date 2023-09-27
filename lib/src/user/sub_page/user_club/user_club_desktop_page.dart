import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lappole/src/model/club.dart';
import 'package:lappole/src/user/sub_page/user_club/bloc/user_club_bloc.dart';
import 'package:lappole/src/user/sub_page/user_club/bloc/user_club_event.dart';
import 'package:lappole/src/user/sub_page/user_club/bloc/user_club_state.dart';
import 'package:lappole/src/user/sub_page/user_club/user_club_basic_page.dart';
import 'package:lappole/src/user/widget/add_delete_widget.dart';

class UserClubDesktopPage extends UserClubBasicPage {
  UserClubDesktopPage({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context) {
    Club? club;
    return BlocBuilder<UserClubBloc, UserClubState>(
        bloc: userClubBloc,
        buildWhen: (context, state) {
          return state is UploadUserClubLoginState;
        },
        builder: (BuildContext context, state) {
          if (state is UploadUserClubLoginState) {
            club = state.user.club;
          }

          bool isClubNull = club == null ? true : false;

          return Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Flexible(
                child: Column(
                  children: [
                    const Flexible(flex: 1, child: Text('Club')),
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Visibility(
                              visible: isClubNull,
                              child: TextField(
                                textInputAction: TextInputAction.next,
                                decoration: const InputDecoration(
                                    hintText: 'Ingesa password del Club'),
                                onChanged: (value) => userClubBloc
                                    .add(ClubPasswordChangeEvent(value)),
                                onSubmitted: (_) => AddDeleteClubEvent(),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Visibility(
                              visible: !isClubNull,
                              child: Column(children: [
                                Text(club?.name ?? ''),
                              ]),
                            ),
                          ),
                          Expanded(
                            child: AddDeleteWidget(
                              isObjectNull: isClubNull,
                              onTap: () =>
                                  userClubBloc.add(AddDeleteClubEvent()),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
