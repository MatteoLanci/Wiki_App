import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'wiki_data_state.dart';

class WikiDataCubit extends Cubit<WikiDataState> {
  WikiDataCubit() : super(WikiDataLoading());
}
