start = expr

expr  = add

add   = l:fact '+' r:add {return l + r; }
      / fact

fact  = l:term '*' r:fact {return l * r; }
      / term

term  = '(' e:add ')' {return e;}
      / number

number = integer

integer = ('+'/'-')? digit* {return parseInt(text()); }

digit = [0-9]