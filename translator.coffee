FIRST_29 = ['_', 'uno', 'dos', 'tres', 'cuatro', 'cinco', 'seis', 'siete', 'ocho', 'nueve', 'diez',
                 'once', 'doce', 'trece', 'catorce', 'quince', 'dieciseis', 'diecisiete', 'dieciocho', 'diecinueve', 'veinte',
                 'veintiuno', 'veintidos', 'veintitres', 'veinticuatro', 'veinticinco', 'veintiseis', 'veintisiete', 'veintiocho', 'veintinueve']

TENS = ['_', '_', '_', 'treinta', 'cuarenta', 'cincuenta', 'sesenta', 'setenta', 'ochenta', 'noventa']

HUNDREDS = ['_', 'ciento', 'doscientos', 'trescientos', 'cuatrocientos', 'quinientos', 'seiscientos', 'setecientos', 'ochocientos', 'novecientos']

# Translates an integer [-9999, 9999] into Spanish.
#
# Examples:
# translate(-5)  | "menos cinco"
# translate 1000 | "mil"
# translate 461  | "cuarenta sesenta y uno"
translate = (x, prefix = '') ->
  if -9999 <= x < 0 then 'menos ' + translate(Math.abs x)
  else if x == 0    then 'cero'
  else if x <= 9    then prefix + FIRST_29[x] # prefix = 'y ' if x > 30 and there's a remainder <= 9
  else if x <= 29   then FIRST_29[x]
  else if x <= 99   then TENS[parseInt x/10] + ' ' + translate(x%10, 'y ')
  else if x == 100  then 'cien'
  else if x <= 999  then HUNDREDS[parseInt x/100] + ' ' + translate(x%100, 'y ')
  else if x == 1000 then 'mil'
  else if x <= 9999 then FIRST_29[parseInt x/1000] + " mil " + translate(x%1000, 'y ')
  else throw new Error('Sorry, I can only count to plus/minus 9999 :(')

exports.translate = translate
