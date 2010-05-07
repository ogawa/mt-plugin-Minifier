use ExtUtils::MakeMaker;
use YAML::Tiny qw(LoadFile);

my $name    = 'Minifier';
my $version = LoadFile("plugins/$name/config.yaml")->{version}
  || die 'No version found in config.yaml';

WriteMakefile(
    NAME     => $name,
    VERSION  => $version,
    DISTNAME => $name,
);
