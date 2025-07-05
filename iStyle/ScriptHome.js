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




//script carosello:

// Configurazione
var radius = 240; // Raggio del carosello
var autoRotate = true; // Rotazione automatica
var rotateSpeed = -60; // Velocità di rotazione (secondi per giro completo)
var imgWidth = 120; // Larghezza elementi
var imgHeight = 170; // Altezza elementi

// Musica di sottofondo (opzionale)
var bgMusicURL = null;
var bgMusicControls = true;

// Avvia animazione dopo 1s
setTimeout(init, 1000);

var odrag = document.getElementById('drag-container');
var ospin = document.getElementById('spin-container');
var aEle = Array.from(ospin.children); // Supporta immagini e video

// Dimensioni spin-container
ospin.style.width = imgWidth + "px";
ospin.style.height = imgHeight + "px";

// Dimensioni ground se presente
var ground = document.getElementById('ground');
if (ground) {
  ground.style.width = radius * 3 + "px";
  ground.style.height = radius * 3 + "px";
}

function init(delayTime) {
  for (var i = 0; i < aEle.length; i++) {
    aEle[i].style.transform = "rotateY(" + (i * (360 / aEle.length)) + "deg) translateZ(" + radius + "px)";
    aEle[i].style.transition = "transform 1s";
    aEle[i].style.transitionDelay = delayTime || (aEle.length - i) / 4 + "s";
  }
}

function applyTransform(obj) {
  if (tY > 180) tY = 180;
  if (tY < 0) tY = 0;
  obj.style.transform = "rotateX(" + (-tY) + "deg) rotateY(" + (tX) + "deg)";
}

function playSpin(yes) {
  ospin.style.animationPlayState = yes ? 'running' : 'paused';
}

// Variabili di controllo rotazione
var sX, sY, nX, nY, desX = 0,
    desY = 0,
    tX = 0,
    tY = 10;

// Rotazione automatica
if (autoRotate) {
  var animationName = (rotateSpeed > 0 ? 'spin' : 'spinRevert');
  ospin.style.animation = `${animationName} ${Math.abs(rotateSpeed)}s infinite linear`;
}

// Eventi per il drag con mouse/touch
document.onpointerdown = function (e) {
  clearInterval(odrag.timer);
  e = e || window.event;
  sX = e.clientX;
  sY = e.clientY;

  this.onpointermove = function (e) {
    e = e || window.event;
    nX = e.clientX;
    nY = e.clientY;
    desX = nX - sX;
    desY = nY - sY;
    tX += desX * 0.1;
    tY += desY * 0.1;
    applyTransform(odrag);
    sX = nX;
    sY = nY;
  };

  this.onpointerup = function () {
    odrag.timer = setInterval(function () {
      desX *= 0.95;
      desY *= 0.95;
      tX += desX * 0.1;
      tY += desY * 0.1;
      applyTransform(odrag);
      playSpin(false);
      if (Math.abs(desX) < 0.5 && Math.abs(desY) < 0.5) {
        clearInterval(odrag.timer);
        playSpin(true);
      }
    }, 17);
    this.onpointermove = this.onpointerup = null;
  };

  return false;
};

// Zoom con rotellina
document.onwheel = function(e) {
  e = e || window.event;
  var d = e.deltaY || -e.wheelDelta;
  radius += d * 0.1;
  init(1);
};
}

