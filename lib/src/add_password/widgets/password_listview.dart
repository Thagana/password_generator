import 'package:cyberman/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:password_repository/password_repository.dart';

class PasswordListView extends StatelessWidget {
  const PasswordListView({required this.state, super.key});

  final List<Password> state;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: state.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                state[index].logo ??
                                    'https://avatars.githubusercontent.com/u/68122202?s=400&u=4abc9827a8ca8b9c19b06b9c5c7643c87da51e10&v=4'),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state[index].password,
                            style: GoogleFonts.shareTechMono(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                state[index]?.name ?? 'Unknwon',
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
                                state[index]?.date != null
                                    ? state[index].date
                                    : 'Unknwon',
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
                      text: state[index].password,
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
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                icon: const Icon(
                  Icons.copy,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
