use base "installedtest";
use strict;
use testapi;

sub run {
    my $self = shift;
    # switch to tty and login as root
    $self->root_console(tty => 3);

    assert_screen "root_console";
    # check that RAID is used
    assert_script_run "cat /proc/mdstat | grep 'Personalities : \\\[raid1\\\]'";
}

sub test_flags {
    return {fatal => 1};
}

1;

# vim: set sw=4 et:
