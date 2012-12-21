The best way to develop Javascript applications?
===

I'm surprised more people aren't doing this. But this gives you stitch
and express, all you need to complete organized applications front to
back. Put all your Javascript application code in the app folder, and
code using `require('foo')` and use `module.exports = Foo` just like
you would in Node. Stitch will package it all up in the CommonJS format
and serve it to `<script src="/application.js"></script>` on your index
page. 

The project demonstrates a really contrived example. I use bower to
manage client side dependencies. you can configure stitch in `app.js`,
just add your dependencies in the order you need them to load.
