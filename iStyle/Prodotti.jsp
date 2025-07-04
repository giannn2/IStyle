<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="Header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Catalogo Prodotti</title>
    <link rel="stylesheet" type="text/css" href="css/ProdottiStyle.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/14.6.0/nouislider.min.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

<div class="catalogo-container">
    <aside class="sidebar">
        <ul class="filtri-lista">

            <li>
                <button class="filtro-btn" onclick="toggleMenu('categorie-menu')">
                    <img src="img/categories-icon.png" alt="Categorie">
                    <span>CATEGORIE</span>
                </button>
                <div class="menu-filtri" id="categorie-menu">
                    <label><input type="checkbox"> Cover</label>
                    <label><input type="checkbox"> Custodie MagSafe</label>
                    <label><input type="checkbox"> Accessori</label>
                </div>
            </li>

            <li>
                <button class="filtro-btn" onclick="toggleMenu('prezzo-menu')">
                    <img src="img/euro-icon.png" alt="Prezzo">
                    <span>PREZZO</span>
                </button>
                <div class="menu-filtri" id="prezzo-menu">
                    <div class="filter">
                        <label class="filter__label">
                            <input type="text" class="filter__input" id="input-min" placeholder="Min">
                        </label>  
                        <label class="filter__label">
                            <input type="text" class="filter__input" id="input-max" placeholder="Max">
                        </label>
                        <div id="sliderPrice" class="filter__slider-price" data-min="0" data-max="100" data-step="5"></div>
                    </div>
                </div>
            </li>

            <li>
                <button class="filtro-btn" onclick="toggleMenu('filtri-menu')">
                    <img src="img/filter-icon.png" alt="Tutti i filtri">
                    <span>TUTTI I FILTRI</span>
                </button>
                <div class="menu-filtri" id="filtri-menu">
                    <label><input type="checkbox"> Solo prodotti in sconto</label>
                    <label><input type="checkbox"> Compatibili con MagSafe</label>
                    <label><input type="checkbox"> Novità</label>
                </div>
            </li>
        </ul>
    </aside>

    <main class="griglia-prodotti">
        <div class="card-prodotto">            
            <!-- Cuore in alto a destra -->
            <button class="cuore-btn">
                <img src="img/icon/heart-icon.png" alt="Preferiti" class="cuore-icon">
            </button>
            
            <!-- Immagine del prodotto -->
            <img src="img/covers/Naruto.png" alt="Prodotto" class="img-prodotto">
            
            <p class="nome-prodotto">cover naruto</p>

            <div class="prezzo">
                €10,99 <span class="prezzo-scontato">€15,99</span>
            </div>

            <button class="btn-carrello">
                <img src="img/icon/cart-icon.png" alt="Aggiungi al carrello" class="carrello-icon"> Aggiungi
            </button>
        </div>
    </main>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/14.6.0/nouislider.min.js"></script>
<script>
document.addEventListener("DOMContentLoaded", function () {
    // Toggle menu filtri
    document.querySelectorAll(".filtro-btn").forEach(btn => {
        btn.addEventListener("click", function () {
            document.querySelectorAll(".menu-filtri").forEach(menu => {
                if (menu !== btn.nextElementSibling) menu.style.display = "none";
            });
            const menu = btn.nextElementSibling;
            menu.style.display = menu.style.display === "block" ? "none" : "block";
        });
    });

    document.addEventListener("click", e => {
        if (!e.target.closest(".sidebar"))
            document.querySelectorAll(".menu-filtri").forEach(menu => menu.style.display = "none");
    });

    // Slider prezzo noUiSlider
    const slider = document.getElementById('sliderPrice');
    const rangeMin = parseInt(slider.dataset.min);
    const rangeMax = parseInt(slider.dataset.max);
    const step = parseInt(slider.dataset.step);
    const inputMin = document.getElementById('input-min');
    const inputMax = document.getElementById('input-max');
    const filterInputs = [inputMin, inputMax];

    noUiSlider.create(slider, {
        start: [rangeMin, rangeMax],
        connect: true,
        step: step,
        range: {
            'min': rangeMin,
            'max': rangeMax
        },
        format: {
            to: value => value,
            from: value => value
        }
    });

    // aggiorna input quando muovi slider
    slider.noUiSlider.on('update', (values, handle) => {
        filterInputs[handle].value = values[handle];
    });

    // aggiorna slider quando modifichi input
    filterInputs.forEach((input, index) => {
        input.addEventListener('change', () => {
            slider.noUiSlider.setHandle(index, input.value);
        });
    });
});

document.querySelectorAll('.cuore-btn').forEach(btn => {
  btn.addEventListener('click', () => {
    const cuore = btn.querySelector('.cuore-icon');
    const src = cuore.getAttribute('src');

    if (src.includes('heart.png')) {
      cuore.setAttribute('src', 'img/icon/heart.png');
    } else {
      cuore.setAttribute('src', 'img/icon/red-heart.png');
    }
  });
});

</script>

<%@ include file="Footer.jsp" %>
</body>
</html>
