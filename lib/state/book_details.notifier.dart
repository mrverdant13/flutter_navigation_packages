import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_navigation_packages/models/book.entity.dart';

import 'package:flutter_navigation_packages/models/book_details.entity.dart';

@immutable
class BookDetailsState extends Equatable {
  const BookDetailsState({
    required this.isLoading,
    this.bookDetails,
  });

  final bool isLoading;
  final BookDetails? bookDetails;

  BookDetailsState copyWith({
    bool? isLoading,
    BookDetails? bookDetails,
  }) =>
      BookDetailsState(
        isLoading: isLoading ?? this.isLoading,
        bookDetails: bookDetails ?? this.bookDetails,
      );

  @override
  List<Object?> get props => [isLoading, bookDetails];
}

class BookDetailsNotifier extends ValueNotifier<BookDetailsState> {
  BookDetailsNotifier() : super(const BookDetailsState(isLoading: true));
  final r = Random();

  bool get isLoading => value.isLoading;
  BookDetails? get details => value.bookDetails;

  @override
  @protected
  set value(BookDetailsState state) => super.value = state;
  @override
  @protected
  BookDetailsState get value => super.value;

  Future<void> loadDetails({
    required int bookId,
  }) async {
    value = value.copyWith(isLoading: true);
    await Future<void>.delayed(Duration(milliseconds: r.nextInt(1000)));
    final book = Book.fakeFromId(bookId);
    final bookDetails = BookDetails(
      id: bookId,
      title: book.title,
      author: book.author,
      imageUrl: book.imageUrl,
      description: _descriptions[r.nextInt(_descriptions.length)],
    );
    value = value.copyWith(isLoading: false, bookDetails: bookDetails);
  }

  static const _descriptions = <String>[
    '''
Exercitation enim mollit ipsum eu. Aliquip occaecat aliqua qui incididunt aliqua qui sit dolor duis labore. Elit officia elit nisi nostrud tempor dolore tempor amet do aliqua ex. Irure anim qui labore fugiat non dolor est elit minim. Veniam proident nulla ex labore Lorem cillum ex amet sit. Consectetur anim cupidatat occaecat tempor ullamco elit irure id deserunt cillum laborum dolor voluptate.''',
    '''
Dolore anim amet ea nostrud elit enim. Cupidatat quis non Lorem magna aliqua eu elit irure ea. Fugiat reprehenderit minim eu ad nulla anim voluptate elit cupidatat pariatur ea. Magna eiusmod amet velit cillum ipsum quis. Duis elit Lorem occaecat dolore voluptate do irure labore elit magna aliquip est incididunt id.

Ipsum nulla deserunt tempor anim elit dolor occaecat deserunt nulla non tempor. Veniam dolor eiusmod cupidatat sit pariatur sunt ullamco. Duis incididunt aliqua occaecat id quis sunt anim elit voluptate eu tempor ad eu. Dolor qui eu eiusmod ad dolore consequat anim. Tempor cillum id dolore nostrud velit. Pariatur aliqua voluptate officia irure consectetur enim amet est consectetur excepteur ullamco quis do. Nisi excepteur nulla ut laborum consequat labore tempor duis consectetur nisi esse.''',
    '''
Duis irure in incididunt in sit consectetur tempor Lorem nulla mollit culpa. Sunt consectetur mollit sunt reprehenderit enim dolore ad minim nisi ut amet consequat. Cillum consequat excepteur cupidatat consectetur excepteur reprehenderit exercitation reprehenderit elit deserunt Lorem. Irure aliquip excepteur quis et dolore proident et dolor cupidatat minim fugiat deserunt ad amet. Consectetur dolore commodo incididunt quis cillum enim occaecat. Anim excepteur eu minim incididunt in ut anim Lorem magna veniam mollit. Qui exercitation pariatur sit cupidatat nisi dolore tempor enim duis veniam.

Ullamco excepteur esse do qui magna. Dolore dolore exercitation magna eu eiusmod. Do do voluptate officia cillum pariatur ipsum.

Labore tempor officia ad nostrud ullamco sint et incididunt sunt incididunt nisi occaecat anim. Adipisicing irure ut minim veniam. Deserunt velit veniam id exercitation cillum irure nostrud enim nostrud minim eu. Quis commodo elit ex do do mollit nisi.''',
    '''
Nisi veniam ex aliqua nostrud excepteur enim deserunt excepteur. Proident nulla id irure voluptate nulla sunt ad. Nostrud occaecat id adipisicing consequat.

Nisi consequat ipsum in sint nulla anim eiusmod ut deserunt veniam. In irure nostrud eiusmod pariatur officia duis excepteur minim et anim do veniam anim irure. Esse adipisicing eiusmod commodo in amet velit. Amet consectetur tempor do magna laborum nisi dolore cupidatat officia magna ipsum incididunt elit. Laborum anim aliqua aute magna ipsum aliqua excepteur quis sit duis. Ut et id aliquip do mollit deserunt incididunt quis officia dolor officia.

Ut aute elit aliqua in consectetur occaecat magna ad. Minim ad in Lorem dolore sunt occaecat. Ea commodo laborum enim minim irure velit duis laboris esse id eu anim. Ullamco cupidatat sunt aliquip voluptate sint aliqua reprehenderit exercitation aliquip proident non enim fugiat. Incididunt dolor enim officia consectetur aliquip quis ex dolore. Ut elit deserunt mollit veniam culpa. Esse dolore qui irure do consequat magna occaecat id consequat consectetur elit.

Elit anim laborum dolore voluptate commodo adipisicing tempor deserunt quis in tempor id qui. Aliqua dolor aliqua elit cupidatat consequat proident occaecat non. Reprehenderit irure excepteur aute ea adipisicing cillum esse anim eiusmod tempor.''',
    '''
Ad eiusmod aute velit veniam sit commodo id aute pariatur. Quis elit in id elit. Laborum commodo dolore dolore ipsum laboris quis mollit cillum incididunt aliquip officia ipsum. Magna cupidatat fugiat pariatur sit amet commodo ea magna irure Lorem exercitation fugiat sunt eu. Enim aliquip magna ex cillum sint aliquip nisi labore excepteur cupidatat aute. Proident consequat consequat non tempor ad esse tempor et aliquip.

Sunt duis nostrud officia voluptate ad adipisicing aute eu consectetur consequat mollit adipisicing voluptate aute. Nostrud velit aliquip occaecat voluptate nisi ad commodo ullamco adipisicing quis cillum commodo. Amet fugiat quis ex laboris do occaecat. Officia occaecat exercitation consectetur sit.

Enim irure dolore ad eiusmod labore. Qui aliquip ea adipisicing voluptate dolor in aliqua reprehenderit proident in. Ex magna amet culpa mollit. Laborum consequat nulla magna aliquip mollit ullamco.

Eiusmod officia qui laboris veniam consectetur dolore occaecat consequat aliqua sunt et. Et qui velit ipsum veniam aliqua do. In duis culpa pariatur officia velit ullamco velit reprehenderit commodo ex Lorem magna quis. Labore sint tempor fugiat amet officia ad duis nulla do sunt officia.

Id fugiat dolor eiusmod labore nulla mollit. Officia magna quis deserunt ex velit. Tempor et magna exercitation proident velit fugiat consectetur mollit labore in non amet. Cupidatat ad consequat nulla cillum. Ad commodo proident duis reprehenderit dolore est incididunt ea cupidatat deserunt ipsum. Aliqua eu ea fugiat occaecat quis et aliquip dolor.''',
    '''
Qui consequat duis Lorem commodo. Cillum elit laborum Lorem sint fugiat dolor duis voluptate duis aliqua culpa. Nostrud laboris laboris ipsum ipsum amet consectetur ut occaecat ex cillum ut non ipsum voluptate. Anim est pariatur ipsum elit deserunt.

Tempor aute ullamco incididunt sint ad enim mollit. Lorem eu consequat mollit ut do adipisicing ut qui veniam irure. Reprehenderit ea in laboris qui non enim consequat anim consectetur nostrud mollit deserunt. Magna ex aute minim ipsum labore. Non aliqua magna id nostrud. Non id non tempor pariatur ea aliqua deserunt nisi consequat veniam cupidatat eu dolor.

Ipsum sint culpa cillum cillum consequat quis duis amet qui. Aliqua excepteur mollit ipsum elit pariatur. Commodo elit quis id et voluptate sit non cupidatat ad amet mollit sit elit deserunt. Enim exercitation velit et irure ea nulla laboris. Do aliqua deserunt pariatur tempor aliqua sit veniam ex.

Sint quis tempor proident nulla laboris elit dolore pariatur laboris. Aute tempor officia consectetur enim laborum mollit velit amet. Ex sint nisi eu et excepteur. Esse cillum cupidatat amet sit eiusmod. Occaecat pariatur adipisicing adipisicing consectetur ipsum sunt aliqua ipsum Lorem.

Voluptate labore aute aliqua veniam reprehenderit consectetur do esse voluptate. Nulla mollit quis do voluptate. Duis est ad in culpa minim sit incididunt laborum ex. Et consectetur mollit in nulla ex occaecat aliqua. Nostrud aute dolor reprehenderit eiusmod magna dolore cupidatat Lorem qui do ad irure nisi proident. Ea elit laboris cupidatat labore velit commodo eiusmod fugiat adipisicing veniam occaecat. Commodo anim ullamco do elit cupidatat qui nostrud.

Tempor laboris labore sit in adipisicing aute anim labore est velit magna laboris incididunt. Ex eu ipsum quis ex non ex excepteur sit veniam proident. Ut dolore duis excepteur velit enim voluptate nisi proident dolore pariatur non et adipisicing. Minim proident nisi ex nisi fugiat proident cillum aliqua. Eiusmod et irure dolore non excepteur Lorem aliqua consectetur. Nulla duis voluptate dolore aute Lorem in proident mollit elit. Esse aute dolor commodo id magna eu quis qui deserunt laborum sunt ad consectetur.''',
  ];
}
