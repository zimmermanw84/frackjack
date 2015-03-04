$(document).ready(function() {
 var nonGameEvents = nonGameEventModule()
 var activeGame = activeGameModule()
 nonGameEvents.inititialize()
 activeGame.inititialize()
});

// Non Game event module
(function() {
// Nav DropDown
  "use strict";

  var dropDown = function() {

    var $menuContainer = $('.dropdown-container');
    var $eventTrigger = $('#dropdown-listener');

    function displayMenu() {
      $menuContainer.css('display', 'block');
    };

    function hideMenu() {
      $menuContainer.css('display', 'none');
    };

    function triggerDisplay() {
      $eventTrigger.mouseenter(displayMenu);
      $menuContainer.mouseleave(hideMenu);
    };

    triggerDisplay();

  };

  //  Play Screen Card Annimation On Hover

  var bindFadeCardAnnimation = function() {

    var $triggerContainer = $(".start-container");
    var $cardContainer = $(".play-card-container")

    function cardsFadeIn() {
      $cardContainer.fadeIn("slow");
    };

    function cardsFadeOut() {
      $cardContainer.fadeOut("slow");
    };

    function triggerCardFade() {
      $triggerContainer.mouseenter(cardsFadeIn);
    };

    function triggerCardFadeOut() {
      $triggerContainer.mouseleave(cardsFadeOut);
    };

    $cardContainer.hide();
    triggerCardFadeOut();
    triggerCardFade();

  };

  // Hide and Render sign up sheet for landing page

  var renderSignUpForm = function() {

    var $formContainer = $('#sign-up-container');
    var $formTrigger = $('#form-trigger');
    var $unRenderFormTrigger = $('#form-un-trigger');

    function renderEventTrigger() {
      $formContainer.fadeIn('slow');
    };

    function unRenderEventTrigger() {
      $formContainer.fadeOut('slow');
    };

    function unRenderForm() {
      $unRenderFormTrigger.on('click', unRenderEventTrigger);
    };

    function renderForm() {
      $formTrigger.on('click', renderEventTrigger);
    };

    $formContainer.hide();
    renderForm();
    unRenderForm();

  };

  var inititialize = function() {
    dropDown();
    bindFadeCardAnnimation();
    renderSignUpForm();
  };

  window.nonGameEventModule = function() {
    return {
      inititialize: inititialize,
    }
  };

})();

// God Game Module >.< sigh lol

(function() {

  "use strict";

  var updateGameInfo = function() {

    function ajaxGameInfoCall() {
      $.ajax({
        type: 'put',
        url: '/api/playfj/gameinfo',
        success: function(response) {
          return response;
        }
      })
    };
    // Work on next. Add player hand info to JSON
    ajaxGameInfoCall();

  };

  var getNewCard = function() {

    var $newCardLocation = $('#player-card-container');
    var $hitEventTarget = $('#hit-btn');

    function getCardAjax(callback) {
      $.ajax({
        type: 'put',
        url: '/api/playfj/hit',
        success: function(response) {
          callback(response);
        }
      })
    };

    function appendCard(card) {
      $newCardLocation.append("<li class='cards'><img src='"+card.img_url+"'></li>");
    };

    function renderCardTemplate() {
      $hitEventTarget.on('click', function(event) {
        event.preventDefault();
        getCardAjax(appendCard);
      });
    };

    renderCardTemplate();

  };

  var inititialize = function() {
    getNewCard();
    updateGameInfo();
  };

  window.activeGameModule = function() {
    return {
      inititialize: inititialize,
    }
  };

})();

