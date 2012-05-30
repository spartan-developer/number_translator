translate = require('./alternate').translate

examples =
  '-100': 'menos cien'
  0: 'cero'
  4: 'cuatro'
  87: 'ochenta y siete'
  100: 'cien'
  428: 'cuatrocientos veintiocho'
  1000: 'mil'
  2345: 'dos mil trescientos cuarenta y cinco'

describe "the translator", ->

  # When looping over the examples, we need to create a closure to create unique test cases
  build_testcase = (number, translation) ->
    it "translates #{number} to #{translation}", ->
      expect(translate(parseInt number)).toEqual(translation)

  build_testcase(key, value) for own key, value of examples

  it "throws an Error when passed a number < -9999 or > 9999", ->
    expect(-> translate(50342)).toThrow()
