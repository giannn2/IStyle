<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Home - IStyle</title>
    <link rel="stylesheet" href="css/HomeStyle.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body class="animated-gradient">

<%@ include file="Header.jsp" %>

<!-- Background animato -->
<div id="tsparticles"></div>

<!-- Carosello 3D -->
<div class="carousel-container">
    <div id="drag-container">
        <div id="spin-container">
            <img src="img/covers/Naruto.png" alt="Cover Anime">
            <img src="img/covers/Fast&Furious.png" alt="Cover Film">
            <img src="img/covers/Harry-Potter.png" alt="Cover Calcio">
            <img src="img/covers/Hello-Kitty.png" alt="Cover NASA">
            <img src="img/covers/Harry-Potter2.png" alt="Cover Harry Potter">
            <img src="img/covers/Nasa.png" alt="Cover NASA">
            <p>iStyle Covers</p>
        </div>
        <div id="ground"></div>
    </div>
</div>

<section class="product-section">
    <h2 class="section-title">Le nostre cover</h2>
    <div class="cover-gallery">
        <div class="cover-container">
            <div class="cover-image-container" id="cover-bg" style="background-color: #FF9E3F">
                <a href="DettaglioProdotto.jsp?product=Naruto">
                    <img id="current-cover" src="img/covers/Naruto.png" alt="Cover Anime Naruto" class="cover-image">
                </a>
            </div>
            
            <div class="category-buttons">
                <button class="category-btn active" onclick="changeCover('img/covers/Naruto.png', 'Cover Anime Naruto', '#FF9E3F', this, 'Naruto')">Anime</button>
                <button class="category-btn" onclick="changeCover('img/covers/Fast&Furious.png', 'Cover Film Fast & Furious', '#2D3748', this, 'FastAndFurious')">Film</button>
                <button class="category-btn" onclick="changeCover('img/covers/Inter.png', 'Cover calcio', '#03358a', this, 'Inter')">Calcio</button>
            </div>
        </div>
    </div>
</section>

<section class="other-products">
    <h2 class="section-title">Altri prodotti</h2>
    <div class="other-products-gallery">
        <a href="DettaglioProdotto.jsp?product=Nasa" class="product-card">
            <img src="img/covers/Nasa.png" alt="Cover NASA">
        </a>
        <a href="DettaglioProdotto.jsp?product=HelloKitty" class="product-card">
            <img src="img/covers/Hello-Kitty.png" alt="Cover Hello Kitty">
        </a>
        <a href="DettaglioProdotto.jsp?product=HarryPotter" class="product-card">
            <img src="img/covers/Harry-Potter.png" alt="Cover Harry Potter">
        </a>
    </div>
</section>

<script src="https://cdn.jsdelivr.net/npm/tsparticles@2"></script>
<script>
    // Inizializzazione tsParticles
    tsParticles.load("tsparticles", {
        fpsLimit: 60,
        particles: {
            number: { value: 80, density: { enable: true, area: 800 } },
            color: { value: "#E75919" },
            shape: { type: "circle" },
            opacity: { value: 0.6, random: true },
            size: { value: { min: 2, max: 5 }, random: true },
            move: {
                enable: true,
                speed: 1.5,
                direction: "none",
                outModes: { default: "bounce" }
            },
            links: {
                enable: true,
                distance: 120,
                color: "#ffffff",
                opacity: 0.2,
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
                grab: { distance: 140, links: { opacity: 0.5 } },
                push: { quantity: 4 }
            }
        },
        detectRetina: true
    });

    // Configurazione carosello 3D
    var radius = 340;
    var autoRotate = true;  
    var rotateSpeed = -60;
    var imgWidth = 220;
    var imgHeight = 270;

    setTimeout(init, 1000);

    var odrag = document.getElementById('drag-container');
    var ospin = document.getElementById('spin-container');
    var aEle = ospin.getElementsByTagName('img');

    ospin.style.width = imgWidth + "px";
    ospin.style.height = imgHeight + "px";

    var ground = document.getElementById('ground');
    ground.style.width = radius * 3 + "px";
    ground.style.height = radius * 3 + "px";

        function init(delayTime) {
            for (var i = 0; i < aEle.length; i++) {
                aEle[i].style.transform = "rotateY(" + (i * (360 / aEle.length)) + "deg) translateZ(" + radius + "px)";
                aEle[i].style.transition = "transform 1s";
                aEle[i].style.transitionDelay = delayTime || (aEle.length - i) / 4 + "s";
            }
        }


        function applyTranform(obj) {
            if(tY > 180) tY = 180;
            if(tY < 0) tY = 0;
            obj.style.transform = "rotateX(" + (-tY) + "deg) rotateY(" + (tX) + "deg)";
        }

                function playSpin(yes) {
            ospin.style.animationPlayState = (yes?'running':'paused');
        }

                var sX, sY, nX, nY, desX = 0, desY = 0, tX = 0, tY = 10;

document.onpointerdown = function (e) {
            clearInterval(odrag.timer);
            e = e || window.event;
            var sX = e.clientX, sY = e.clientY;

            this.onpointermove = function (e) {
                e = e || window.event;
                var nX = e.clientX, nY = e.clientY;
                desX = nX - sX;
                desY = nY - sY;
                tX += desX * 0.1;
                tY += desY * 0.1;
                applyTranform(odrag);
                sX = nX;
                sY = nY;
            };

            if (autoRotate) {
    var animationName = (rotateSpeed > 0 ? 'spin' : 'spinRevert');
    ospin.style.animation = animationName + ' ' + Math.abs(rotateSpeed) + 's infinite linear';
}

            this.onpointerup = function (e) {
                odrag.timer = setInterval(function () {
                    desX *= 0.95;
                    desY *= 0.95;
                    tX += desX * 0.1;
                    tY += desY * 0.1;
                    applyTranform(odrag);
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

    function changeCover(imageUrl, altText, bgColor, clickedButton, productId) {
        const cover = document.getElementById('current-cover');
        const coverBg = document.getElementById('cover-bg');
        const buttons = document.querySelectorAll('.category-btn');
        
        buttons.forEach(btn => btn.classList.remove('active'));
        clickedButton.classList.add('active');
        
        cover.style.opacity = '0';
        setTimeout(() => {
            cover.src = imageUrl;
            cover.alt = altText;
            coverBg.style.backgroundColor = bgColor;
            cover.style.opacity = '1';
        }, 300);
    }

    window.addEventListener("scroll", function() {
        const carousel = document.querySelector(".carousel-container");
        if (window.scrollY > 300) {
            carousel.classList.add("hidden");
        } else {
            carousel.classList.remove("hidden");
        }
    });
</script>

<%@ include file="Footer.jsp" %>

</body>
</html>
