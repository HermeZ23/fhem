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


1;

=pod
=begin html

<a name="slack"></a>
<h3>slack</h3>
<ul>
    <i>slack</i> implements notification to slack / maybe more in the future
    <br><br>
    <a name="slackdefine"></a>
    <b>Define</b>
    <ul>
        <code>define <name> Hello </code>
        <br><br>
        Example: <code>define testslack slack </code>
        <br><br>
    </ul>
    <br>
    
    <a name="slackset"></a>
    <b>Set</b><br>
    <ul>
        <code>set <name> <option> <value></code>
        <br><br>
        You can <i>set</i> any value to any of the following options. They're just there to 
        <i>get</i> them. See <a href="http://fhem.de/commandref.html#set">commandref#set</a> 
        for more info about the set command.
        <br><br>
        Options:
        <ul>
              <li><i>satisfaction</i><br>
                  Defaults to "no"</li>
              <li><i>whatyouwant</i><br>
                  Defaults to "can't"</li>
              <li><i>whatyouneed</i><br>
                  Defaults to "try sometimes"</li>
        </ul>
    </ul>
    <br>


</ul>

=end html

=cut