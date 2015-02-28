$(document).ready(function() {
  dropDown();
});

// Nav DropDown


var dropDown = function() {

"use strict";

  var $menuContainer = $('.dropdown-container');
  var $eventTrigger = $('#dropdown-listener');

  function displayMenu() {
    $menuContainer.css('display', 'block');
  };

  function hideMenu() {
    $menuContainer.css('display', 'none');
  }

  function triggerDisplay() {
    $eventTrigger.mouseenter(displayMenu);
    $menuContainer.mouseleave(hideMenu);
  };


  triggerDisplay();

};

//  Play Screen Card Annimation On Hover

var bindStartAnnimationEvent = function() {

  "use strict";

  var $triggerContainer = $("start-container")

}


// OO

 // function Card() {
 //    this.name = undefined,
 //    this.value = undefined,
 //    this.img_url = undefined,
 //    this.id = undefined,
 // }

 // Card.prototype.loadAttr = function() {
 //   // Recieve JSON object and assign attributes to card object
 // };

 // function Game() {
 //  this.id = undefined,
 // }

  // sudo JS

  // needs

    // Objects
    // Cards - Store attributes in DATA HTML

    // Game
    // Deck?

    // routes/api

    // Hit - Dynamic card retrieval
    // Stay - Start dealer action phase

  // Nav Bar

  // Modular
  // bind events
  // event listeners on hover
  // toggle slide dropdown

