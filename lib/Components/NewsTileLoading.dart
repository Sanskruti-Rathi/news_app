import 'package:flutter/material.dart';
import 'package:news_app/Components/LoadingContainer.dart';

class NewsTileLoading extends StatelessWidget {
  const NewsTileLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(margin: EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          LoadingContainer(height: 120, width: 120),

          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [LoadingContainer(
                    width: 30,
                    height: 30,
                  ),
                    const SizedBox(width: 10),
                    LoadingContainer(
                        width: MediaQuery.of(context).size.width/2.3 ,
                        height: 20
                    ),
                  ],
                ),

                const SizedBox(height: 15),
                LoadingContainer(height:15,
                  width: MediaQuery.of(context).size.width/1.6,
                ),
                const SizedBox(height: 10),
                LoadingContainer(height:15,
                  width: MediaQuery.of(context).size.width/1.8,
                ),

                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LoadingContainer(height:15,
                      width: MediaQuery.of(context).size.width/5,
                    ),
                    LoadingContainer(height:15,
                      width: MediaQuery.of(context).size.width/5,
                    ),
                  ],
                )


              ],
            ),
          ),
        ],
      ),
    );

  }
}
