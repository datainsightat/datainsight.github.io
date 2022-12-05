# Python Boilerplate

    #!/usr/bin/env python3
    """
    Module Docstring
    """

    __author__ = "Your Name"
    __version__ = "0.1.0"
    __license__ = "MIT"

    import argparse
    from logzero import logger
    
    class Meta(type):
        """
        Flexible metaclass for defining useful decorator functions.
        """
        def __new__(cls, clsname, bases, clsdict):
            clsobj = super().__new__(cls, clsname, bases, clsdict)
            return clsobj


    class Base(object, metaclass=Meta):
        """
        Base class.
        Args:
            *args (list): list of arguments
            **kwargs (dict): dict of keyword arguments
        Attributes:
            self
        """

        def __init__(self, *args, **kwargs):
            allowed_keys = set([])
            self.__dict__.update((k, False) for k in allowed_keys)
            self.__dict__.update((k, v) for k, v in kwargs.items() if k in allowed_keys)

        def foo(self):
            """
            Function.
            """
            pass


    class Derived(Base):
        """
        Derived class.
        Args:
            *args (list): list of arguments
            **kwargs (dict): dict of keyword arguments
        Attributes:
            self
        """

        def __init__(self, *args, **kwargs):
            allowed_keys = set([])
            self.__dict__.update((k, False) for k in allowed_keys)
            self.__dict__.update((k, v) for k, v in kwargs.items() if k in allowed_keys)

    def main(args):
        """ Main entry point of the app """
        logger.info("hello world")
        logger.info(args)


    if __name__ == "__main__":
        """ This is executed when run from the command line """
        parser = argparse.ArgumentParser()

        # Required positional argument
        parser.add_argument("arg", help="Required positional argument")

        # Optional argument flag which defaults to False
        parser.add_argument("-f", "--flag", action="store_true", default=False)

        # Optional argument which requires a parameter (eg. -d test)
        parser.add_argument("-n", "--name", action="store", dest="name")

        # Optional verbosity counter (eg. -v, -vv, -vvv, etc.)
        parser.add_argument(
            "-v",
            "--verbose",
            action="count",
            default=0,
            help="Verbosity (-v, -vv, etc)")

        # Specify output of "--version"
        parser.add_argument(
            "--version",
            action="version",
            version="%(prog)s (version {version})".format(version=__version__))

        args = parser.parse_args()
        main(args)
