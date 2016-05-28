Liquid.readTemplateFile = function(path) {
  var partialPath, template;
  partialPath = replaceLast(path, '/', '/_');
  template = window.Templates[path] || window.Templates[partialPath];
  if (template) {
    return template;
  } else {
    throw "Cannot find template! " + path;
  }

  function replaceLast(string, from, to) {
      var last, pieces;
    pieces = string.split(from);
    last = pieces.pop();
    return pieces.join(from) + to + last;
  }
}
