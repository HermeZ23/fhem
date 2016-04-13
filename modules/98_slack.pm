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


sub slack_Define($$) {
    my ($hash, $def) = @_;
    my @param = split('[ \t]+', $def);
    
    if(int(@param) > 2) {
        return "too many parameters: define <name> slack";
    }
    
    my $hash->{name}  = $param[0];
    
    return undef;
}

sub slack_Undef($$) {
    my ($hash, $arg) = @_; 
    # nothing to do
    return undef;
}

sub slack_Set($@) {
    my ($hash, @param) = @_;
    
    return '"set slack" needs at least one argument' if (int(@param) < 2);
    
    my $name = shift @param;
    my $opt = shift @param;
    my $value = join("", @param);
    
    if(!defined($Hello_gets{$opt})) {
        my @cList = keys %Hello_gets;
        return "Unknown argument $opt, choose one of " . join(" ", @cList);
    }
    $hash->{STATE} = $Hello_gets{$opt} = $value;
    
    return "$opt set to $value. Try to get it.";
}