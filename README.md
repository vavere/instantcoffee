Cloud9 InstantCoffee Extension
==============================

This is a simple Cloud9 extension which compile cofffe script files next after saving. 
If you are writing code in coffeescript, this extension makes much easier to debug precompiled javascript files.

Installation
------------

This extension currently only works with self-hosted copies of Cloud9 (either via
cloning `https://github.com/ajaxorg/cloud9` or `npm install cloud9`).  Third-party
extensions are not supported on c9.io. 

    git clone git://github.com/vavere/instantcoffe.git plugins-client/ext.instantcoffe

Open the `Tools -> Extension Manager` window, put the path to the extension in

    ext/instantcoffee/instantcoffee

Click add.

Conventions
-----------

LivaeCoffee plugin watch files only in directory 'src' and place compiled javascript files in directory 'lib'


