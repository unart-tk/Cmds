#!/usr/bin/perl -wn
#

BEGIN{
    use File::Basename;
}

if (/^(\w*)\s*\(\s*\).*/){
    $bn = basename($ARGV);
    $wrap=$1;
     open( FH, '>', $wrap ) or die $!;
    print FH '#!/bin/sh', "\n";
    print FH 'u=$CMDS_HOME', "\n";
    print FH '[ -e $u ] || { echo "Error with CMDS_HOME "; exit 1; }',"\n";
    print FH '. $u/' , $bn , ' && ' , $wrap ,' "$@"',  "\n";
    close FH;
    chmod(0755, $wrap) || die print $!;
    print $wrap , "\n";
}

# open( my $fh, '<', $filename ) or die "Can't open $filename: $!";
#     while ( my $line = <$fh> ) {
#         if ( $line =~ /wanted text/ ) {
#             print $line;
#         }
# }
# close $fh;
