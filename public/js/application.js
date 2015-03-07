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

  var landingAnimationEvents = function() {

    var $frackHeader = $('#frack');
    var $landingImg = $('#landing-pic');
    var $rules = $('#intro-body');

    function bindTimeoutEvents() {

      setTimeout(function() {
        $frackHeader.show();
        $frackHeader.addClass('animated bounceInLeft');
      } ,500);

      setTimeout(function() {
        $landingImg.show();
        $landingImg.addClass('animated bounceInRight');
      } ,1500);

      setTimeout(function() {
        $rules.show();
        $rules.addClass('animated bounceInLeft');
      } ,2000);

    };

    $rules.hide()
    $landingImg.hide()
    $frackHeader.hide()
    bindTimeoutEvents();

  };

  var dropDown = function() {

    var $menuContainer = $('.dropdown-container');
    var $eventTrigger = $('#dropdown-listener');

    function displayMenu() {
      $menuContainer.show()
      $menuContainer.removeClass('animated fadeOutUpBig');
      $menuContainer.addClass('animated fadeInDownBig');
    };

    function hideMenu() {
      $menuContainer.removeClass('animated fadeInDownBig');
      $menuContainer.addClass('animated fadeOutUpBig');
    };

    function triggerDisplay() {
      $eventTrigger.mouseenter(displayMenu);
      $menuContainer.mouseleave(hideMenu);
    };

    $menuContainer.hide()
    triggerDisplay();

  };

  //  Play Screen Card Annimation On Hover

  var bindFadeCardAnnimation = function() {

    var $triggerContainer = $(".start-container");
    var $cardContainer = $(".play-card-container");

    function cardsFadeIn() {
      $cardContainer.show();
      $cardContainer.addClass("animated lightSpeedIn");
    };

    function cardsFadeOut() {
      $cardContainer.addClass("animated lightSpeedOut");
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
    landingAnimationEvents();
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

    var $playerHandNode = $('#p-hand-value');
    var $currentCardCount = $('#card-count');
    var $currentActions = $('#action-count');
    var $hitEventTarget = $('#hit-btn');


    function ajaxGameInfoCall(callback) {
      $.ajax({
        type: 'put',
        url: '/api/playfj/gameinfo',
        success: function(response) {
          callback(response);
        }
      })
    };

    function changeGameInfo(gameInfo) {
      $playerHandNode.text(' ' + gameInfo.updated_player_hand);
      $currentActions.text(' ' + gameInfo.actions_left);
      $currentCardCount.text(' ' + gameInfo.card_count);

      // Animate if bust
      if (typeof(gameInfo.updated_player_hand) === 'string') {
        $playerHandNode.parent().addClass('animated hinge');
      };

      // Hide Hit Button id current hand value is over 21 or Bust!

      if (typeof(gameInfo.updated_player_hand) === 'string' || gameInfo.updated_player_hand > 16){
        $hitEventTarget.addClass('animated rollOut');
      };

    };

    function bindGameInfoCall() {
      $hitEventTarget.on('click', function(event) {
        event.preventDefault()
        ajaxGameInfoCall(changeGameInfo);
      })
    };

    bindGameInfoCall();

  };

  var getNewCard = function() {

    var $newCardLocation = $('#player-card-container');
    var $hitEventTarget = $('#hit-btn');
    var $newCard;

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
      $newCardLocation.append("<li class='cards' id='new-card'><img src='"+card.img_url+"'></li>");
      $newCard = $('#new-card');
      $newCard.addClass('animated fadeInRight');
      // Take new card id so annimation wont repeat for muli hit situations
      $newCard.attr('id', '');
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

