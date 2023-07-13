package Data::Person;

sub new {
    my $class = shift;

    # Create hash
    # my %self = (
    #     "name" => shift,
    #     "age" => shift,
    # );
    
    # Crete reference to hash
    my $self = {
        "name" => shift,
        "age" => shift,
    };

    bless($self,$class);

    return $self;
}

sub greet {
    my ($self,$other) = @_;

    print "Hello, $other, I am " . $self->{"name"} . ". My age is " . $self->{"age"} . ".\n";
}

1;