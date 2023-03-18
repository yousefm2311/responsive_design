import 'package:flutter/material.dart';
import 'package:responsive/shared/model.dart';

Widget buildPageView(context, PageViewData model) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MediaQuery.of(context).size.height.toInt() > 650
            ? MainAxisAlignment.start
            : MainAxisAlignment.center,
        children: [
          if (MediaQuery.of(context).size.height.toInt() > 650 )
            Expanded(
              flex: 2,
              child: Text(
                model.text,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(
                  model.image,
                ),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(model.job, style: Theme.of(context).textTheme.bodySmall),
                ],
              )
            ],
          )
        ],
      ),
    );

Widget buildPageViewSizer(context, PageViewData model) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MediaQuery.of(context).size.width.toInt() < 730
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        children: [
          if (MediaQuery.of(context).size.height.toInt() > 650)
            Expanded(
              flex: 2,
              child: Text(
                model.text,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(
                  model.image,
                ),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.title,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(model.job,
                      style: Theme.of(context).textTheme.displaySmall),
                ],
              )
            ],
          )
        ],
      ),
    );
