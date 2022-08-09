import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class SportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      builder: (context, state) {
        var list = NewsCubit.get(context).sports;
        return ConditionalBuilder(
          condition: list.isNotEmpty ,
          builder: (context) => ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => buildArticleItem(NewsCubit.get(context).sports[index], context),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: 8,
          ),
          fallback: (context) => const Center(child: CircularProgressIndicator(),),
        );
      },
      listener: (context, state) {},
    );
  }

}