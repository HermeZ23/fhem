package main;
use strict;
use warnings;


sub slack_Initialize($) {
    my ($hash) = @_;

    $hash->{DefFn}      = 'slack_Define';
    $hash->{UndefFn}    = 'slack_Undef';
    $hash->{SetFn}      = 'slack_Set';
    $hash->{GetFn}      = 'slack_Get';
    $hash->{AttrFn}     = 'slack_Attr';
    $hash->{ReadFn}     = 'slack_Read';

    $hash->{AttrList} =
          "formal:yes,no "
        . $readingFnAttributes;
}
