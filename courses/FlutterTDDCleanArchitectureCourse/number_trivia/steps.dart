/**
 ! ++ : Create
 ! -- : Delete
 ! R : Refactor
 ! [] : package
 ! {} : class
 ! <> : abstract class
 ! {n} : entity class
 ! [T] : test package
 ! {T} : test class
 ! {TF} : test file
 !
 * */

/** Steps *******************************************
 *
 * ?Create all needed packages:
 * ++[] features
 * ++[] features.number_trivia
 * ++[] features.number_trivia.data
 * ++[] features.number_trivia.data.models
 * ++[] features.number_trivia.data.datasources
 * ++[] features.number_trivia.data.repositories
 * ++[] features.number_trivia.domain
 * ++[] features.number_trivia.domain.entities
 * ++[] features.number_trivia.domain.usecases
 * ++[] features.number_trivia.domain.repositories
 * ++[] features.number_trivia.presentation
 * ++[] features.number_trivia.presentation.bloc
 * ++[] features.number_trivia.presentation.pages
 * ++[] features.number_trivia.presentation.widgets
 * ++[] core
 * ++[] core.error
 * ++[] core.usecases
 *
 * ++<> core.error> Failures
 * ++{n} features.number_trivia.domain.entities> NumberTrivia
 * ++<> features.number_trivia.domain.repositories> NumberTriviaRepository
 *
 * ?Create all needed packages for test:
 * ++[T] features
 * ++[T] features.number_trivia
 * ++[T] features.number_trivia.data
 * ++[T] features.number_trivia.data.models
 * ++[T] features.number_trivia.data.datasources
 * ++[T] features.number_trivia.data.repositories
 * ++[T] features.number_trivia.domain
 * ++[T] features.number_trivia.domain.entities
 * ++[T] features.number_trivia.domain.usecases
 * ++[T] features.number_trivia.domain.repositories
 * ++[T] features.number_trivia.presentation
 * ++[T] features.number_trivia.presentation.bloc
 * ++[T] features.number_trivia.presentation.pages
 * ++[T] features.number_trivia.presentation.widgets
 * ++[T] core
 * ++[T] core.error
 *
 * ++{T} features.number_trivia.domain.usecases> GetConcreteNumberTriviaTest
 * ++{} features.number_trivia.domain.usecases> GetConcreteNumberTrivia
 *
 * ++<> core.usecases> UseCase
 * * Start TDD ...
 *
 * ++{T} features.number_trivia.domain.usecases> GetRandomNumberTriviaTest
 * ++{} features.number_trivia.domain.usecases> GetRandomNumberTrivia
 *
 * ++[T] fixture
 *
 * ++{TF} fixture> trivia.json
 * ++{TF} fixture> trivia_double.json
 *
 * ++{t} features.number_trivia.data.repositories> NumberTriviaRepositoryImplTest
 * ++{} features.number_trivia.data.repositories> NumberTriviaRepositoryImpl
 *
 * ++{} core.error> exceptions.dart
 * ++[] core.platform
 * ++{} core.platform> NetworkInfo
 *
 * ++{} features.number_trivia.data.datasources> NumberTriviaLocalDataSource
 * ++{} features.number_trivia.data.datasources> NumberTriviaRemoteDataSource
 *
 *  R[] core.platform > core.network
 *
 *
 * ++{t} features.number_trivia.data.datasources> NumberTriviaLocalDataSourceImplTest
 *
 * ++{TF} fixture> trivia_cached.json
 *
 * ++{t} features.number_trivia.data.datasources> NumberTriviaRemoteDataSourceImplTest
 *
 *
 *
 *
 *
 * */
