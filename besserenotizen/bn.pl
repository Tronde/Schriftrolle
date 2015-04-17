#!/usr/bin/perl
# Dieses Perl-Programm wurde nach dem Perl-Tutorial aus Freies Magazin entwickelt.
# Teil 0: 2011-07 http://www.freiesmagazin.de/mobil/freiesMagazin-2011-07-bilder.html#11_07_perl0
# Teil 1: 2011-08 http://www.freiesmagazin.de/mobil/freiesMagazin-2011-08-bilder.html#11_08_perl1
# Teil 2: 2011-09 http://www.freiesmagazin.de/mobil/freiesMagazin-2011-09-bilder.html#11_09_perl2
use v5.18; # Verwende alle neuen Features aus Perl 5.18.
use strict; # Hilft Tippfehler zu finden. ;-)
use warnings; # Gibt ausführlichere Fehlermeldungen aus.
# use diagnostics; # Gibt noch ausführliche Meldungen aus.
use FindBin;

chdir $FindBin::Bin;

my $datei = 'notizblock.txt';

# open my $FH, '>', 'notizblock.txt'; # Befehl 'open'; Parameter 'my $FH' -> File Handle; '>' -> Schreibmodus; 'notizblock.txt' -> Dateiname.
open my $FH, '>>', $datei unless -e $datei;
open $FH, '+<', $datei;
# @notiz = <$FH>; # <>-Operator liest eine Zeile aus dem Handle $FH. Statt <> kann auch readline $FH genutzt werden.
my @notiz = <$FH>;
for my $nr (0 .. $#notiz)
	{ print "[$nr]", $notiz[$nr] }
print "Neue Notiz (nur ENTER wenn keine): ";
my $notiz = <STDIN>;
print $FH $notiz if $notiz ne "\n";
close $FH; # File Handle wird geschlossen und die Datei notizblock.txt freigegeben.
