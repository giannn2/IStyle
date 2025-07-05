<script src="https://cdn.jsdelivr.net/npm/tsparticles@2"></script>


    /* Inizializzazione di tsParticles */
    tsParticles.load("tsparticles", {
      fpsLimit: 60,
      particles: {
        number: { value: 100, density: { enable: true, area: 800 } },
        color: { value: "#E75919" },          // Colore principale delle particelle
        shape: {
                type: "image",
                image: {
                    src: "img/icon/cover2.png",
                    width: 50000,
                    height: 50000,
                  }
                },         
        opacity: { value: 1, random: true },
        size: { value: { min: 3, max: 7 }, random: true },
        move: {
          enable: true,
          speed: 2,
          direction: "none",                 // none, top, top-right, right, ...
          outModes: { default: "bounce" }
        },
        links: {
          enable: true,
          distance: 120,
          color: "#ffffff",
          opacity: 0.3,
          width: 1
        }
      },
      interactivity: {
        detectsOn: "canvas",
        events: {
          onHover: { enable: true, mode: "grab" },
          onClick: { enable: true, mode: "push" },
          resize: true
        },
        modes: {
          grab:   { distance: 140, links: { opacity: 0.7 } },
          push:   { quantity: 4 }
        }
      },
      detectRetina: true
});

// Funzione per cambiare le cover (parte statica)
function changeCover(imageName, altText, bgColor, clickedButton, productId) { 
    const cover = document.getElementById('current-cover');
    const coverBg = document.getElementById('cover-bg');
    const buttons = document.querySelectorAll('.category-btn');
    
    // Aggiorna il bottone attivo
    buttons.forEach(btn => btn.classList.remove('active'));
    if (clickedButton) {
        clickedButton.classList.add('active'); 
    }
    
    // Animazione del cambio cover
    cover.style.opacity = '0';
    setTimeout(() => {
        cover.src = '${pageContext.request.contextPath}/img/covers/' + imageName;
        cover.alt = altText;
        coverBg.style.backgroundColor = bgColor;
        cover.style.opacity = '1';
        
        // Aggiorna il link della cover
        const coverLink = cover.parentElement;
        coverLink.href = 'DettaglioProdotto.jsp?product=' + productId;
    }, 300);


//carosello(function() {

    var slidersContainer = document.querySelector('.sliders-container');

    // Initializing the numbers slider
    var msNumbers = new MomentumSlider({
        el: slidersContainer,
        cssClass: 'ms--numbers',
        range: [1, 4],
        rangeContent: function (i) {
            return '0' + i;
        },
        style: {
            transform: [{scale: [0.4, 1]}],
            opacity: [0, 1]
        },
        interactive: false
    });

    // Initializing the titles slider
    var titles = [
        'King of the Ring Fight',
        'Sound of Streets',
        'Urban Fashion',
        'Windy Sunset'
    ];
    var msTitles = new MomentumSlider({
        el: slidersContainer,
        cssClass: 'ms--titles',
        range: [0, 3],
        rangeContent: function (i) {
            return '<h3>'+ titles[i] +'</h3>';
        },
        vertical: true,
        reverse: true,
        style: {
            opacity: [0, 1]
        },
        interactive: false
    });

    // Initializing the links slider
    var msLinks = new MomentumSlider({
        el: slidersContainer,
        cssClass: 'ms--links',
        range: [0, 3],
        rangeContent: function () {
            return '<a class="ms-slide__link">View Case</a>';
        },
        vertical: true,
        interactive: false
    });

    // Get pagination items
    var pagination = document.querySelector('.pagination');
    var paginationItems = [].slice.call(pagination.children);

    // Initializing the images slider
    var msImages = new MomentumSlider({
        // Element to append the slider
        el: slidersContainer,
        // CSS class to reference the slider
        cssClass: 'ms--images',
        // Generate the 4 slides required
        range: [0, 3],
        rangeContent: function () {
            return '<div class="ms-slide__image-container"><div class="ms-slide__image"></div></div>';
        },
        // Syncronize the other sliders
        sync: [msNumbers, msTitles, msLinks],
        // Styles to interpolate as we move the slider
        style: {
            '.ms-slide__image': {
                transform: [{scale: [1.5, 1]}]
            }
        },
        // Update pagination if slider change
        change: function(newIndex, oldIndex) {
            if (typeof oldIndex !== 'undefined') {
                paginationItems[oldIndex].classList.remove('pagination__item--active');
            }
            paginationItems[newIndex].classList.add('pagination__item--active');
        }
    });

    // Select corresponding slider item when a pagination button is clicked
    pagination.addEventListener('click', function(e) {
        if (e.target.matches('.pagination__button')) {
            var index = paginationItems.indexOf(e.target.parentNode);
            msImages.select(index);
        }
    });

})();
