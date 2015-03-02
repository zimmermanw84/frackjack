$(document).ready(function() {
 var nonGameEvents = nonGameEventModule()
 var activeGame = activeGameModule()
 nonGameEvents.dropDown()
 nonGameEvents.bindFadeCardAnnimation()
 nonGameEvents.renderSignUpForm()
 activeGame.getNewCard()
});

// Non Game event module
(function() {
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
  };

  function triggerDisplay() {
    $eventTrigger.mouseenter(displayMenu);
    $menuContainer.mouseleave(hideMenu);
  };

  triggerDisplay();

};

  //  Play Screen Card Annimation On Hover

  var bindFadeCardAnnimation = function() {

    "use strict";

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

    "use strict";

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

  this.nonGameEventModule = function() {
    return {
      dropDown: dropDown,
      bindFadeCardAnnimation: bindFadeCardAnnimation,
      renderSignUpForm: renderSignUpForm
    }
  };

})();

// God Game Module >.< sigh lol

(function() {

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

    ajaxGameInfoCall()
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


    renderCardTemplate()
  };


  this.activeGameModule = function() {
    return {
      getNewCard: getNewCard,
      updateGameInfo: updateGameInfo
    }
  };

})();

