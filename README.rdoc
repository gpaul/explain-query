== DESCRIPTION:

The explain-query gem allows you to 'EXPLAIN' your ActiveRecord::Base#find calls from the safety of your Rails console.

== FEATURES/PROBLEMS:

The library adds the #explain method to ActiveRecord::Base (ie. all your models.)

== SYNOPSIS:

Here's a quick sample:

  >> Post.explain do
  ?> Post.first
  >> end
  SELECT * FROM `posts`  LIMIT 1
   select_type | key_len | table | id | possible_keys | type | Extra | rows | ref | key
   ------------------------------------------------------------------------------------
   SIMPLE      |         | posts | 1  |               | ALL  |       | 6    |     |

  => #<Post id: 2, title: "First Post", content: "some content\r\n", created_at: "2009-07-07 09:19:46", updated_at: "2009-07-17 14:15:01", permalink: "first-post">

== REQUIREMENTS:

This library obviously requires the ActiveRecord library.

== INSTALL:

To install, simply run:

  sudo gem install g00k-explain-query

and then require it from your Rails console:

  $ ./script/console
  >> require 'explain-query'

== LICENSE:

(The MIT License)

Copyright (c) 2009 FIXME full name

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

== CREDITS:

This gem is pretty much just a gemified version of Bob Silva's (http://nfectio.us/) query-analyzer Rails plugin, with the addition of the block syntax instead of writing output to the logfile. Thanks!