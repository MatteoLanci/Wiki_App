part of 'wiki_data_cubit.dart';

@immutable
sealed class WikiDataState {}

final class WikiDataLoading extends WikiDataState {}

final class WikiDataLoaded extends WikiDataState {
  List<WikiDataModel>? wikiData;
}
