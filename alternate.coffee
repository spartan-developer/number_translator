FIRST_29 = ['_', 'uno', 'dos', 'tres', 'cuatro', 'cinco', 'seis', 'siete', 'ocho', 'nueve', 'diez',
                 'once', 'doce', 'trece', 'catorce', 'quince', 'dieciseis', 'diecisiete', 'dieciocho', 'diecinueve', 'veinte',
                 'veintiuno', 'veintidos', 'veintitres', 'veinticuatro', 'veinticinco', 'veintiseis', 'veintisiete', 'veintiocho', 'veintinueve']

TENS = ['_', '_', '_', 'treinta', 'cuarenta', 'cincuenta', 'sesenta', 'setenta', 'ochenta', 'noventa']

HUNDREDS = ['_', 'ciento', 'doscientos', 'trescientos', 'cuatrocientos', 'quinientos', 'seiscientos', 'setecientos', 'ochocientos', 'novecientos']

parts = []

_translate = (x) ->
  scale = Math.pow(10, parseInt (Math.log(x) / Math.log(10))) # 8 -> 1, 73 -> 10, 365 -> 100, 3495 -> 1000
  first_digit = parseInt(x / scale) # 734 -> 7
  remainder = unless x < 30 then x % scale else 0

  parts.push(
    if      x <= 29   then FIRST_29[x]
    else if x <= 99   then TENS[first_digit]
    else if x == 100  then 'cien'
    else if x <= 999  then HUNDREDS[first_digit]
    else if x == 1000 then 'mil'
    else if x <= 9999 then FIRST_29[first_digit] + " mil"
  )

  if remainder > 0
    parts.push "y" if remainder < 10
    _translate remainder

exports.translate = (x) ->
  if x is 0
    'cero'
  else if x < -9999 or x > 9999
    throw new Error('Sorry, I can only count to plus/minus 9999 :(')
  else
    parts = []
    parts.push('menos') if x < 0
    _translate(Math.abs(x))
    parts.join(' ')
