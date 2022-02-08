import 'package:flutter/material.dart';
import 'package:flutter_navigation_packages/models/book_details.entity.dart';

class BookDetailsCard extends StatelessWidget {
  const BookDetailsCard({
    Key? key,
    required this.details,
  }) : super(key: key);

  final BookDetails details;

  @override
  Widget build(BuildContext context) => Card(
        margin: const EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 3 / 4,
                      child: Image.network(
                        details.imageUrl,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    flex: 2,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final width = constraints.maxWidth;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              details.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  ?.copyWith(
                                    fontSize: width / 10,
                                  ),
                            ),
                            Text(
                              details.author,
                              style:
                                  Theme.of(context).textTheme.caption?.copyWith(
                                        fontSize: width / 15,
                                      ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                details.description,
                textAlign: TextAlign.justify,
              )
            ],
          ),
        ),
      );
}
