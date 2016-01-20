{
  pegedit_opts = { treenav: 'collapse' };
  traverse = function(ast){
    if (typeof ast !== undefined) {
      switch (ast.name) {
        case 'sum': return traverse(ast.children[0]) + traverse(ast.children[1]);
        case 'mult': return traverse(ast.children[0]) + traverse(ast.children[1]);
        case 'parenthesized': return traverse(ast.children[0]);
        default: return parseInt(ast.name);
      }
    }
  };
}

add   = l:fact '+' r:add {return {name: 'sum', children: [l, r] }; }
      / fact

fact  = l:term '*' r:fact {return {name: 'mult', children: [l, r] }; }
      / term

term  = '(' e:add ')' {return { name: 'parenthesized', children: [e] }; }
      / number

number = i:integer {return {name: i }; }

integer = ('+'/'-')? digit* {return parseInt(text()); }

digit = [0-9]
