// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

// This is from http://www.javascript-menu.com/forum/viewthread_3570/
// 
function f_optionMove(form_name, s_from, s_to) 
{
  var e_from = document.forms[form_name].elements[s_from];
  var e_to = document.forms[form_name].elements[s_to];

  if (!e_from)
    return alert ("Error: selectbox with name '" + s_from + "' can't be found.");
  if (!e_to)
    return alert ("Error: selectbox with name '" + s_from + "' can't be found.");

  var n_moved = 0;
  for (var i = 0; i < e_from.options.length; i++) {
    if (e_from.options[i].selected) {
      e_to.options[e_to.options.length] = new Option(e_from.options[i].text, 
                                                     e_from.options[i].value);
      n_moved++;
    }
    else if (n_moved)
      e_from.options[i - n_moved] = new Option(e_from.options.text, e_from.options.value);
  }

  if (n_moved)
    e_from.options.length = e_from.options.length - n_moved;
  else
    alert("You haven't selected any options");
}

function f_optionAdd(form_name, s_from, s_to) 
{
  var e_from = document.forms[form_name].elements[s_from];
  var e_to = document.forms[form_name].elements[s_to];

  if (!e_from)
    return alert ("Error: selectbox with name '" + s_from + "' can't be found.");
  if (!e_to)
    return alert ("Error: selectbox with name '" + s_from + "' can't be found.");

  var n_moved = 0;
  for (var i = 0; i < e_from.options.length; i++) {
    if (e_from.options[i].selected) {
      var j = e_to.options.length;
      e_to.options[j] = new Option(e_from.options[i].text, e_from.options[i].value);
      e_to.options[j].selected = true;

    }
  }

  // Make sure everything is selected
  for (var i = 0; i < e_to.options.length; i++) {
      e_to.options[i].selected = true;
  }
}

function f_optionRemove(form_name, s_from) 
{
  var e_from = document.forms[form_name].elements[s_from];

  if (!e_from)
    return alert ("Error: selectbox with name '" + s_from + "' can't be found.");

  for (var i = 0; i < e_from.options.length; i++) {
    if (e_from.options[i].selected) {
      e_from.options[i] = null;
    }
  }
}

function f_selectAll(form_name, select_name) 
{
  var e_select = document.forms[form_name].elements[select_name];

  // Make sure everything is selected
  for (var i = 0; i < e_select.options.length; i++) {
      e_select.options[i].selected = true;
  }
}
