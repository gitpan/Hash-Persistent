
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "nested hashref serializable to the file",
  "AUTHOR" => "Vyacheslav Matyukhin <me\@berekuk.ru>, Andrei Mishchenko <druxa\@yandex-team.ru>, Artyom V. Kulikov <breqwas\@yandex-team.ru>",
  "BUILD_REQUIRES" => {
    "IPC::System::Simple" => 0,
    "Test::Fatal" => 0,
    "Test::More" => "0.95"
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Hash-Persistent",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Hash::Persistent",
  "PREREQ_PM" => {
    "Carp" => 0,
    "Data::Dumper" => 0,
    "JSON" => 0,
    "Lock::File" => "1.01",
    "Storable" => 0,
    "autodie" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "1.00",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



