#!/usr/bin/perl
#
#
# Trova tutti i termini non marcati come \glossaryItem{} e li marca come tali
# Author: Salvatore Pilò
# Version: 1.0

use warnings;
use strict;
use open qw/:std :utf8/;

my ($fh, $glossary_file, @glossary, @base, @tex_files, @mytex);
$glossary_file = `find . -type f -name "Glossario*.tex"`;
chomp $glossary_file;
open $fh, '<:encoding(UTF-8)', $glossary_file or die "Could not open file $glossary_file for read $!";
# populate @base array with glossary words
while(<$fh>) {
    if($_ =~/(?<=\\glossaryElement\{)(.*?)(?=\})/g) {
        push @base, $1;
    }
}
close $fh;
@glossary = map { $_ } @base;
foreach(map { /\(([^)]+)\)/gi } @base) {
    push @glossary, $_;
}
foreach(grep { s/(\w?)(\s*)\([^()]*\)(\s*)(\w?)/($1&&$4)?($1.($2?$2:$3).$4):($1?$1:$4)/ex } @glossary) {
    push @glossary, $_;
}
if(@ARGV == 0) {
    # find all project files .tex except Glossario*
    @tex_files = `find . -type f -name "*.tex" -a -not -name "Glossario*"`;
    foreach my $i(@tex_files){
      my $str = substr $i, 2, 11;
      push @mytex, $str;
    }
} else {
    (@tex_files) = @ARGV;
    # .tex extension check on arguments
    if(grep(/(?<!\.tex)$/, @tex_files)) {
        print "Only .tex files allowed\n";
        exit 1;
    }
}

foreach my $file(@mytex) {
    chomp $file;
    open $fh, '<:encoding(UTF-8)', $file or die "Could not open file $file for read $!";
    my $contents = do { local $/ = undef; <$fh>};
    close $fh;
    # search for glossary words without \glossaryItem
    foreach my $word(@glossary) {
        $contents =~ s/(?<!\{)$word(?!\})/\\glossaryItem\{$word}/gi;
    }
    open my $out, '>:encoding(UTF-8)', $file or die "Could not open file $file for write $!";
    print $out $contents;
    close $out;
}
