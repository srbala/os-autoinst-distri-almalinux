use base "installedtest";
use strict;
use testapi;

sub run {
    my $self = shift;
    # switch to tty and login as root
    $self->root_console(tty => 3);
        
    assert_screen "root_console";
    # check that second disk is intact
    assert_script_run 'mount /dev/vdb1 /mnt';
    validate_script_output 'cat /mnt/testfile', sub { $_ =~ m/Hello, world!/ };
}

sub test_flags {
    return {fatal => 1};
}

1;

# vim: set sw=4 et:
