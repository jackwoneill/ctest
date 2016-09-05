// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"

document.getElementById("add-category-field").onclick = function() {myFunction()};

function myFunction() {
    var d1 = document.getElementsByClassName('category-field')[0];
    var count = document.getElementsByClassName('category-field').length;

 	/*SETTING VARS TO COUNT AS JS ARRAYS ARE BASE INDEX 0 */


    var labelFor = "item_categories_" + count + "_name"
    var inputId = "item_categories_" + count + "_name"
    var inputName = "item[categories][" + count + "][name]"

    var hiddenId = "item_categories_" + count + "_item_id"
    var hiddenName = "item[categories][" + count + "][item_id]"

	d1.insertAdjacentHTML('beforeend', '<div class="category-field">  <input id="' + hiddenId + '" name="' + hiddenName + '" type="hidden" value="-1"> <div class="form-group"><label class="control-label" for=' + labelFor + '>Category #' + (count + 1).toString() + '</label><input id=' + inputId + ' name=' + inputName + ' class="form-control" type="text"></div></div>');
}
