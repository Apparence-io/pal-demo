import 'package:flutter/material.dart';
import 'package:mvvm_builder/mvvm_builder.dart';

class ProfileViewModel extends MVVMModel {
  final Color bgColor = Color(0xFF111820);
  final Color textColor = Color(0xFFDFDFD5);
}

abstract class ProfileView {

}

class ProfilePresenter extends Presenter<ProfileViewModel, ProfileView> {

  ProfilePresenter(ProfileView viewInterface) : super(ProfileViewModel(), viewInterface);
}

class ProfilePage extends StatelessWidget implements ProfileView {
  @override
  Widget build(BuildContext context) {
    return MVVMPage<ProfilePresenter, ProfileViewModel>(
      key: ValueKey("presenter"),
      presenter: ProfilePresenter(
        this,
      ),
      builder: (context, presenter, model) => Container(
        child: Column(
          children: [
            Text(
              "My profile",
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 1,
                color: model.textColor.withOpacity(0.8),
                fontSize: 16
              ),
            ),
          ],
        ),
      ), //TODO
    );
  }
}


