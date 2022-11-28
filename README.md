[![Actions Status](https://github.com/frithnanth/raku-Math-Libgsl-Constants/workflows/test/badge.svg)](https://github.com/frithnanth/raku-Math-Libgsl-Constants/actions)

NAME
====

Math::Libgsl::Constants - An interface to libgsl, the Gnu Scientific Library - constants and exceptions.

SYNOPSIS
========

```raku
use Math::Libgsl::Constants;
use Math::Libgsl::Exception;
```

DESCRIPTION
===========

This module provides the constants and the exception class used by all the other modules.

CHANGES
=======

From v0.0.11 the version variable `$gsl-version` is a `Version` object.

Installation
============

To install it using zef (a module management tool):

    $ zef install Math::Libgsl::Constants

AUTHOR
======

Fernando Santagata <nando.santagata@gmail.com>

COPYRIGHT AND LICENSE
=====================

Copyright 2019 Fernando Santagata

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

