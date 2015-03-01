$(document).ready(function() {
 nonGameEventModule.dropDown()
 nonGameEventModule.bindFadeCardAnnimation()
 nonGameEventModule.renderSignUpForm()
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
    }

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
    }

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

    var $formContainer = $('#sign-up-container')
    var $formTrigger = $('#form-trigger')
    var $unRenderFormTrigger = $('#form-un-trigger')

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

  var nonGameEventModule =  {
      dropDown: dropDown,
      bindFadeCardAnnimation: bindFadeCardAnnimation,
      renderSignUpForm: renderSignUpForm
  };

  return nonGameEventModule

})();
