Viitelaskuri
    by Toni Tuominen
    http://github.com/tjtuom/viitelaskuri

== DESCRIPTION:

A collection of methods for calculating finnish bank references.

== FEATURES/PROBLEMS:

* Calculate the check number for different numbers
* Format the reference number
* Check for validity of existing references
* Generate (almost certainly) unique references

== SYNOPSIS:

To calculate a valid reference from an invoice id for instance use something along these lines.

require 'viitelaskuri'
Viitelaskuri.calculate(100) # => 1009

See the documentation for other uses.

== REQUIREMENTS:

None.

Tested on ruby 1.8.7 but should work on other versions as well.

== INSTALL:

sudo gem install viitelaskuri

== LICENSE:

(The MIT License)

Copyright (c) 2010 Toni Tuominen

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
