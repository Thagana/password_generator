import 'package:cyberman/constants.dart';
import 'package:cyberman/src/add_password/blocs/password_bloc/password_bloc.dart';
import 'package:cyberman/src/home/widgets/header.dart';
import 'package:cyberman/src/home/widgets/passwords_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeApp extends StatelessWidget {
  const HomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<PasswordBloc>().state;
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            onStretchTrigger: () async {},
            stretchTriggerOffset: 150,
            expandedHeight: 100,
            backgroundColor: Colors.black,
            elevation: 10,
            flexibleSpace: const Center(
              child: Header(),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ColoredBox(
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Image.network(
                                          fit: BoxFit.fill,
                                          state.passwords[index].logo ??
                                              'https://avatars.githubusercontent.com/u/68122202?s=400&u=4abc9827a8ca8b9c19b06b9c5c7643c87da51e10&v=4'),
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.passwords[index].password,
                                      style: GoogleFonts.shareTechMono(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          state.passwords[index].name ??
                                              'Unknown',
                                          style: GoogleFonts.shareTechMono(
                                            color: const Color.fromRGBO(
                                              217,
                                              222,
                                              226,
                                              1,
                                            ),
                                            fontSize: 15,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          state.passwords[index].date ?? 'Unknown',
                                          style: GoogleFonts.shareTechMono(
                                            color: const Color.fromRGBO(
                                              217,
                                              222,
                                              226,
                                              1,
                                            ),
                                            fontSize: 15,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () async {
                            await Clipboard.setData(
                              ClipboardData(
                                text: state.passwords[index].password,
                              ),
                            );
                            final snackBar = SnackBar(
                              content: Text(
                                'Password copied!',
                                style: GoogleFonts.shareTechMono(
                                  color: primaryColor,
                                ),
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                          icon: const Icon(
                            Icons.copy,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: state.passwords.length,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GoRouter.of(context).push('/add/quick');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
