abstract class UseCase<Type, Params> {
  //all usecases have a 'call' method which returns 'type'
  //in the call method we get the data we need from
  //the repository
  Future<Type> call({Params params});
}
