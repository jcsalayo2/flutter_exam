import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam/core/router/args/social_args.dart';
import 'package:flutter_exam/main.dart';
import 'package:flutter_exam/models/singleton/user_details_singleton.dart';
import 'package:flutter_exam/screens/home/bloc/home_bloc.dart';
import 'package:flutter_exam/utilities/constants.dart';
import 'package:flutter_exam/widgets/home_user_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(LoadHome()),
      child: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state.loggedOut) {
          Navigator.pushReplacementNamed(context, '/');
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: state.isLoading
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Theme(
                        data: ThemeData(platform: TargetPlatform.iOS),
                        child: const CircularProgressIndicator.adaptive()),
                    Center(child: Text(state.loadingText))
                  ],
                )
              : Padding(
                  padding: const EdgeInsets.fromLTRB(30, 50, 30, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      HomeUserHeader(),
                      GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.socials.length + 1,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            if (index == state.socials.length) {
                              return Padding(
                                padding: const EdgeInsets.all(20),
                                child: IconButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        WidgetStatePropertyAll<Color>(
                                            Colors.amber),
                                    shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            8), // Square shape
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      "/other",
                                    );
                                  },
                                  icon: Icon(
                                    Icons.input_rounded,
                                    size: 40,
                                    color: Colors.white,
                                  ),
                                ),
                              );
                            }
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context,
                                    "/social/${state.socials[index].name}",
                                    arguments: SocialArgs(
                                        social: state.socials[index],
                                        color: socialColors[state
                                                .socials[index].name
                                                .toLowerCase()] ??
                                            Colors.amber));
                              },
                              child: Container(
                                margin: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        state.socials[index].iconUrl),
                                  ),
                                ),
                              ),
                            );
                          })
                    ],
                  ),
                ),
        );
      },
    );
  }
}
