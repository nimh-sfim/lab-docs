#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""Briefly describe the script"""


# standard library imports

# 3rd party imports

# within-package imports


# note that here, str is just a sample type
# there are two lines between your imports and function definitions
def your_function(argument: str) -> str:
    """Your function's docstring

    Parameters
    ----------
    argument: what your argument is

    Returns
    -------
    Whatever it returns

    Raises
    ------
    Any error this function might raise
    """
    # sample command so this runs
    return 'Hello, ' + argument + '!'


# two lines between your last function definition and next
def main():
    # sample command so this runs
    print(your_function('world'))


# make this execute by running "main"
if __name__ == '__main__':
    main()
