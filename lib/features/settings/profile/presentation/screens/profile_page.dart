import 'package:chat_app/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/profile/profile_bloc.dart';
import '../widgets/widgets.dart';
import 'package:chat_app/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:talker_flutter/talker_flutter.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.userId});
  final String? userId;
  @override
  Widget build(BuildContext context) {
    if (userId == 'me') {
      return Consumer<AuthListener>(builder: (context, authListener, _) {
        if (authListener.uuid == null) {
          return PageNotAuthorized();
        } else {
          return BlocProvider(
            create: (context) => sl<ProfileBloc>(),
            child: ProfilePageContent(userId: authListener.uuid!),
          );
        }
      });
    } else {
      if (userId != null) {
        return ProfilePageContent(userId: userId!);
      } else {
        return PageNotFound();
      }
    }
  }
}

class ProfilePageContent extends StatefulWidget {
  final String userId;
  const ProfilePageContent({super.key, required this.userId});

  @override
  State<ProfilePageContent> createState() => _ProfilePageContentState();
}

class _ProfilePageContentState extends State<ProfilePageContent> {
  late final TextEditingController _nameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _birthDateController;
  late final ProfileBloc _profileBloc;

  @override
  void initState() {
    _nameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _birthDateController = TextEditingController();
    _profileBloc = context.read<ProfileBloc>()
      ..add(ProfileEvent.getCurrentUserProfile(userId: widget.userId));
    super.initState();
  }

  void _onSubmit({required String userId, required BuildContext context}) {
    if (_formKey.currentState?.validate() ?? false) {
      final firstName = _nameController.text;
      final lastName = _lastNameController.text;
      final birthDate = _birthDateController.text;
      _profileBloc.add(ProfileEvent.updateProfileData(
          userId: userId,
          firstName: firstName,
          lastName: lastName,
          birthDate: birthDate));
    } else {
      sl<Talker>().error("profile form is not correct");
      showErrorToast('Please enter correct data', context);
    }
  }

  final _dateTimeFormatter = MaskTextInputFormatter(
      mask: '##/##/####', filter: {"#": RegExp(r'[0-9]')});

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _birthDateController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return BlocListener<ProfileBloc, ProfileState>(
      bloc: _profileBloc,
      listener: _profileBlocListener,
      child: Scaffold(
          appBar: CustomAppBar(
            height: 50,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: AnimatedButton(
                  onTap: () =>
                      _onSubmit(userId: widget.userId, context: context),
                  child: Text('Done',
                      style: themeData.textTheme.bodyMedium?.copyWith(
                          color: themeData.primaryColor,
                          fontWeight: FontWeight.w500)),
                ),
              )
            ],
            pageContext: context,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: BlocBuilder<ProfileBloc, ProfileState>(
              bloc: _profileBloc,
              builder: (context, state) {
                switch (state) {
                  case ProfileLoading():
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  case ProfileLoaded():
                    if (state.currentUserProfile != null) {
                      final user = state.currentUserProfile!;
                      _nameController.text = user.firstName ?? '';
                      _lastNameController.text = user.lastName ?? '';
                      _emailController.text = user.email;
                      _birthDateController.text = user.birthDate ?? '';

                      return Form(
                        autovalidateMode: AutovalidateMode.onUnfocus,
                        key: _formKey,
                        child: ListView(
                          children: [
                            SizedBox(height: 15),
                            ProfileAvatarWidget(
                              onTap: _showChangeAvatarBottomSheet,
                              user: user,
                            ),
                            SizedBox(height: 20),
                            Text('Main info',
                                style: themeData.textTheme.bodyMedium
                                    ?.copyWith(color: themeData.canvasColor)),
                            SizedBox(
                              height: 5,
                            ),
                            LabeledTextFormField(
                              label: 'Name',
                              themeData: themeData,
                              controller: _nameController,
                              validator: validateName,
                            ),
                            Divider(
                              height: 1,
                              color: themeData.hintColor.withAlpha(70),
                            ),
                            LabeledTextFormField(
                              label: 'Last Name',
                              themeData: themeData,
                              validator: validateName,
                              controller: _lastNameController,
                            ),
                            Divider(
                              height: 1,
                              color: themeData.hintColor.withAlpha(70),
                            ),
                            LabeledTextFormField(
                              enabled: false,
                              keyboardType: TextInputType.emailAddress,
                              label: 'Email',
                              themeData: themeData,
                              controller: _emailController,
                              validator: validateEmail,
                            ),
                            Divider(
                              height: 1,
                              color: themeData.hintColor.withAlpha(70),
                            ),
                            LabeledTextFormField(
                              keyboardType: TextInputType.datetime,
                              label: 'Date of Birth',
                              hintText: 'dd/mm/yyyy',
                              themeData: themeData,
                              controller: _birthDateController,
                              validator: validateDate,
                              inputFormatters: [_dateTimeFormatter],
                            ),
                          ],
                        ),
                      );
                    } else {
                      return SizedBox();
                    }
                  default:
                    String message = "Unknown error occured, try again";
                    if (state is ProfileError) message = state.message;
                    return InfoWidget(
                      title: 'Oops, something happened',
                      subtitle: message,
                    );
                }
              },
            ),
          )),
    );
  }

  void _showChangeAvatarBottomSheet() {
    showBottomSheetWithButtons(context, title: 'Avatar', actions: [
      BottomSheetActionItem(
          onTap: () {}, text: 'Take a photo', icon: Icons.camera_alt_rounded),
      BottomSheetActionItem(
          onTap: () {},
          text: 'Select from gallery',
          icon: Icons.photo_album_rounded)
    ]);
  }

  void _profileBlocListener(BuildContext context, ProfileState state) {
    if (state is ProfileSuccess) {
      context.pop();
    } else if (state is ProfileError) {
      showErrorToast(state.message, context);
    }
  }
}
