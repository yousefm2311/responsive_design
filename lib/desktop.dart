// ignore_for_file: unused_local_variable, must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive/cubit/cubit.dart';
import 'package:responsive/cubit/states.dart';
import 'package:responsive/shared/component.dart';
import 'package:responsive/shared/list.dart';
import 'package:responsive/shared/mytextfield.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DesktopPage extends StatelessWidget {
  DesktopPage({super.key});

  var pageViewController = PageController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 150;
    double height = MediaQuery.of(context).size.height - 200;
    return BlocConsumer<ResponsiveCubit, ResponsiveState>(
      builder: (context, state) {
        ResponsiveCubit cubit = ResponsiveCubit.get(context);
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: cubit.isDark
                            ? Colors.grey[900]
                            : const Color.fromARGB(255, 242, 244, 248),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20.0),
                            InkWell(
                                onTap: () {
                                  cubit.changeTheme();
                                },
                                child: Stack(
                                  alignment: AlignmentDirectional.center,
                                  children: [
                                    Container(
                                      width: 35,
                                      height: 35,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color.fromARGB(255, 60, 55, 255),
                                      ),
                                    ),
                                    cubit.isDark
                                        ? const Icon(
                                            Icons.dark_mode,
                                            size: 25,
                                          )
                                        : const Icon(
                                            Icons.light_mode,
                                            size: 25,
                                          ),
                                  ],
                                )),
                            if (MediaQuery.of(context).size.width.toInt() <
                                    1300 &&
                                MediaQuery.of(context).size.height.toInt() <
                                    649)
                              const SizedBox(
                                height: 100,
                              ),
                            if (MediaQuery.of(context).size.width.toInt() >
                                1300)
                              const SizedBox(height: 100),
                            Text(
                              'Let us help you run your freelance business',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Our registeration process  is  quick and easy, taking no more than 10 minutes to complete.',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const SizedBox(height: 100),
                            if (MediaQuery.of(context).size.width.toInt() >
                                    645 &&
                                MediaQuery.of(context).size.height.toInt() >
                                    599)
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(30.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color:
                                          const Color.fromARGB(255, 45, 51, 70),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: MediaQuery.of(context)
                                                .size
                                                .width
                                                .toInt() >
                                            730
                                        ? PageView.builder(
                                            controller: pageViewController,
                                            itemCount: data.length,
                                            itemBuilder: (context, index) {
                                              return buildPageView(
                                                  context, data[index]);
                                            },
                                          )
                                        : PageView.builder(
                                            controller: pageViewController,
                                            itemCount: data.length,
                                            itemBuilder: (context, index) {
                                              return buildPageViewSizer(
                                                  context, data[index]);
                                            },
                                          ),
                                  ),
                                ),
                              ),
                            if (MediaQuery.of(context).size.width.toInt() > 645)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SmoothPageIndicator(
                                    effect: const ExpandingDotsEffect(
                                      activeDotColor:
                                          Color.fromARGB(255, 45, 51, 70),
                                      dotHeight: 10,
                                      dotWidth: 10,
                                      dotColor: Colors.grey,
                                    ),
                                    count: data.length,
                                    controller: pageViewController,
                                  ),
                                ],
                              )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: MediaQuery.of(context).size.width.toInt() > 830
                          ? const EdgeInsets.all(50.0)
                          : const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 50.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 20,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Get Started',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge),
                                Text('Create a new account now',
                                    style:
                                        Theme.of(context).textTheme.bodySmall),
                                const MyTextFormField(
                                  hintText: 'Name ',
                                  title: 'Full Name',
                                ),
                                const MyTextFormField(
                                  hintText: 'example@.com',
                                  title: 'Email',
                                ),
                                const MyTextFormField(
                                  hintText: 'Password',
                                  title: 'Password',
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                        onPressed: () {},
                                        child: const Text('Forgot Password?',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 60, 55, 255)))),
                                  ],
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 60, 55, 255),
                                      borderRadius: BorderRadius.circular(6.0)),
                                  child: MaterialButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Sign Up',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Have an account?',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                TextButton(
                                  child: const Text(
                                    "Login",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 60, 55, 255)),
                                  ),
                                  onPressed: () {},
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
