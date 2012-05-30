## Spanish Number Translator

The **translator** module exports a single method, **translate**, that accepts an integer between -9999 and 9999 and returns its Spanish translation.

### Usage

```coffeescript
translator = require('translator')
translator.translate(87) # 'ochenta y siete'
```

### Instructions

These instructions assume that [node.js](http://nodejs.org/) and [npm](http://npmjs.org/) are installed.

1. If the [CoffeeScript](http://coffeescript.org/) node module isn't installed, install it with ```npm install -g coffee-script``` (you might need root permissions)
2. git clone git@github.com:spartan-developer/number_translator.git
3. cd number_translator
4. npm install jasmine-node
5. jasmine-node translator_spec.coffee --verbose --coffee
