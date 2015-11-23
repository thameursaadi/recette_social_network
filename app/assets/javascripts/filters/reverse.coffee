@cooking.filter 'reverse', ->
  return (items) ->
    return items.slice().reverse();
  