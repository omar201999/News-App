
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/states.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        builder: (context, state) {
          var list = NewsCubit.get(context).business;
          return ConditionalBuilder(
              condition: list.isNotEmpty ,
              builder: (context) => ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => buildArticleItem(NewsCubit.get(context).business[index], context),
                  separatorBuilder: (context, index) => myDivider(),
                  itemCount: list.length,
              ),
              fallback: (context) => Center(child: CircularProgressIndicator(),),
          );
        },
        listener: (context, state) {},
    );
  }


}