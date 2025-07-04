<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="Header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Catalogo Prodotti</title>
    <link rel="stylesheet" type="text/css" href="css/ProdottiStyle.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/14.6.0/nouislider.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

<div class="catalogo-container">
    <aside class="sidebar">
        <ul class="filtri-lista">
            <li>
                <button class="filtro-btn" onclick="toggleMenu('categorie-menu')">
                    <img src="img/icon/categories-icon.png" alt="Categorie">
                    <span>CATEGORIE</span>
                </button>
                <div class="menu-filtri" id="categorie-menu">
                    <%-- VERSIONE STATICA INIZIO --%>
                    <label><input type="checkbox"> Cover</label>
                    <label><input type="checkbox"> Custodie MagSafe</label>
                    <label><input type="checkbox"> Accessori</label>
                    <%-- VERSIONE STATICA FINE --%>
                    
                    <%-- VERSIONE DINAMICA INIZIO 
                    <c:forEach var="categoria" items="${categorie}">
                        <label>
                            <input type="checkbox" name="categoria" value="${categoria.id}" 
                                   onchange="filtraProdotti()"> ${categoria.nome}
                        </label>
                    </c:forEach>
                    VERSIONE DINAMICA FINE --%>
                </div>
            </li>

            <li>
                <button class="filtro-btn" onclick="toggleMenu('prezzo-menu')">
                    <img src="img/icon/euro-icon.png" alt="Prezzo">
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
                    <img src="img/icon/filter-icon.png" alt="Tutti i filtri">
                    <span>TUTTI I FILTRI</span>
                </button>
                <div class="menu-filtri" id="filtri-menu">
                    <%-- VERSIONE STATICA INIZIO --%>
                    <label><input type="checkbox"> Solo prodotti in sconto</label>
                    <label><input type="checkbox"> Compatibili con MagSafe</label>
                    <label><input type="checkbox"> Novità</label>
                    <%-- VERSIONE STATICA FINE --%>
                    
                    <%-- VERSIONE DINAMICA INIZIO 
                    <label><input type="checkbox" name="inSconto" onchange="filtraProdotti()"> Solo prodotti in sconto</label>
                    <label><input type="checkbox" name="magsafe" onchange="filtraProdotti()"> Compatibili con MagSafe</label>
                    <label><input type="checkbox" name="novita" onchange="filtraProdotti()"> Novità</label>
                    <label><input type="checkbox" name="disponibili" onchange="filtraProdotti()"> Solo disponibili</label>
                    VERSIONE DINAMICA FINE --%>
                </div>
            </li>
        </ul>
    </aside>

    <main class="griglia-prodotti">
        <%-- VERSIONE STATICA INIZIO --%>
        <div class="card-prodotto">            
            <button class="cuore-btn">
                <img src="img/icon/heart-icon.png" alt="Preferiti" class="cuore-icon">
            </button>
            
            <a href="DettaglioProdotto.jsp?id=1">
                <img src="img/covers/Naruto.png" alt="Cover Naruto" class="img-prodotto">
            </a>
            
            <a href="DettaglioProdotto.jsp?id=1" class="nome-prodotto">Cover Naruto</a>

            <div class="prezzo">
                €10,99 <span class="prezzo-scontato">€15,99</span>
            </div>

            <button class="btn-carrello" onclick="mostraModaleCarrello()">
                <img src="img/icon/cart-icon.png" alt="Aggiungi al carrello" class="carrello-icon"> Aggiungi
            </button>
        </div>
        
        <div class="card-prodotto">            
            <button class="cuore-btn">
                <img src="img/icon/heart-icon.png" alt="Preferiti" class="cuore-icon">
            </button>
            
            <a href="DettaglioProdotto.jsp?id=2">
                <img src="img/covers/Inter.png" alt="Cover Inter" class="img-prodotto">
            </a>
            
            <a href="DettaglioProdotto.jsp?id=2" class="nome-prodotto">Cover Inter</a>

            <div class="prezzo">
                €12,99 <span class="prezzo-scontato">€17,99</span>
            </div>

            <button class="btn-carrello" onclick="mostraModaleCarrello()">
                <img src="img/icon/cart-icon.png" alt="Aggiungi al carrello" class="carrello-icon"> Aggiungi
            </button>
        </div>
        
        <div class="card-prodotto">            
            <button class="cuore-btn">
                <img src="img/icon/heart-icon.png" alt="Preferiti" class="cuore-icon">
            </button>
            
            <a href="DettaglioProdotto.jsp?id=3">
                <img src="img/covers/Hello-Kitty.png" alt="Cover Hello Kitty" class="img-prodotto">
            </a>
            
            <a href="DettaglioProdotto.jsp?id=3" class="nome-prodotto">Cover Hello Kitty</a>

            <div class="prezzo">
                €9,99 <span class="prezzo-scontato">€12,99</span>
            </div>

            <button class="btn-carrello" onclick="mostraModaleCarrello()">
                <img src="img/icon/cart-icon.png" alt="Aggiungi al carrello" class="carrello-icon"> Aggiungi
            </button>
        </div>
        <%-- VERSIONE STATICA FINE --%>
        
        <%-- VERSIONE DINAMICA INIZIO 
        <c:forEach var="prodotto" items="${prodotti}">
            <div class="card-prodotto" data-id="${prodotto.id}">            
                <button class="cuore-btn" onclick="togglePreferito(this, ${prodotto.id})">
                    <img src="${utenteLoggato ? (prodotto.preferito ? 'img/icon/red-heart.png' : 'img/icon/heart-icon.png') : 'img/icon/heart-icon.png'}" 
                         alt="Preferiti" class="cuore-icon">
                </button>
                
                <a href="DettaglioProdottoServlet?id=${prodotto.id}">
                    <img src="ImageServlet?id=${prodotto.id}" alt="${prodotto.nome}" class="img-prodotto">
                </a>
                
                <a href="DettaglioProdottoServlet?id=${prodotto.id}" class="nome-prodotto">${prodotto.nome}</a>

                <div class="prezzo">
                    <c:choose>
                        <c:when test="${prodotto.sconto > 0}">
                            €${prodotto.prezzoScontato} <span class="prezzo-scontato">€${prodotto.prezzo}</span>
                        </c:when>
                        <c:otherwise>
                            €${prodotto.prezzo}
                        </c:otherwise>
                    </c:choose>
                </div>

                <button class="btn-carrello" onclick="aggiungiAlCarrello(${prodotto.id}, '${prodotto.nome}', ${prodotto.prezzoScontato > 0 ? prodotto.prezzoScontato : prodotto.prezzo}, 'ImageServlet?id=${prodotto.id}')">
                    <img src="img/icon/cart-icon.png" alt="Aggiungi al carrello" class="carrello-icon"> Aggiungi
                </button>
            </div>
        </c:forEach>
        VERSIONE DINAMICA FINE --%>
    </main>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/14.6.0/nouislider.min.js"></script>
<script>
// Funzioni comuni a entrambe le versioni
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
    if(slider) {
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

        slider.noUiSlider.on('update', (values, handle) => {
            filterInputs[handle].value = values[handle];
        });

        filterInputs.forEach((input, index) => {
            input.addEventListener('change', () => {
                slider.noUiSlider.setHandle(index, input.value);
            });
        });
    }
});

/* VERSIONE STATICA INIZIO */
document.querySelectorAll('.cuore-btn').forEach(btn => {
  btn.addEventListener('click', () => {
    const cuore = btn.querySelector('.cuore-icon');
    const src = cuore.getAttribute('src');
    cuore.setAttribute('src', src.includes('heart-icon.png') ? 'img/icon/red-heart.png' : 'img/icon/heart-icon.png');
  });
});

function mostraModaleCarrello() {
    document.getElementById('overlay').style.display = 'block';
    document.getElementById('modaleCarrello').style.display = 'block';
    document.body.style.overflow = 'hidden';
}

function chiudiModale() {
    document.getElementById('overlay').style.display = 'none';
    document.getElementById('modaleCarrello').style.display = 'none';
    document.body.style.overflow = 'auto';
}

// Chiudi modale cliccando sull'overlay
document.getElementById('overlay').addEventListener('click', chiudiModale);
/* VERSIONE STATICA FINE */

/* VERSIONE DINAMICA INIZIO 
function togglePreferito(btn, prodottoId) {
    if(!${utenteLoggato}) {
        window.location.href = 'AuthServlet';
        return;
    }
    
    fetch('GestisciPreferitoServlet', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: `azione=${btn.querySelector('.cuore-icon').src.includes('red-heart.png') ? 'rimuovi' : 'aggiungi'}&prodottoId=${prodottoId}`
    })
    .then(response => response.json())
    .then(data => {
        if(data.success) {
            const cuore = btn.querySelector('.cuore-icon');
            cuore.setAttribute('src', data.preferito ? 'img/icon/red-heart.png' : 'img/icon/heart-icon.png');
        }
    })
    .catch(error => console.error('Error:', error));
}

function aggiungiAlCarrello(prodottoId, nome, prezzo, immagine) {
    fetch('AggiungiCarrelloServlet', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: `prodottoId=${prodottoId}&quantita=1`
    })
    .then(response => response.json())
    .then(data => {
        if(data.success) {
            // Aggiorna il conteggio del carrello nell'header
            document.querySelectorAll('.cart-count').forEach(el => {
                el.textContent = data.numeroArticoli;
            });
            
            // Mostra modale carrello
            mostraModaleCarrelloDinamico(nome, prezzo, immagine);
        }
    })
    .catch(error => console.error('Error:', error));
}

function mostraModaleCarrelloDinamico(nome, prezzo, immagine) {
    // Aggiorna i contenuti della modale con i dati del prodotto
    const modale = document.getElementById('modaleCarrello');
    modale.querySelector('.prodotto-aggiunto img').src = immagine;
    modale.querySelector('.prodotto-info h3').textContent = nome;
    modale.querySelector('.prodotto-info p:nth-of-type(2)').textContent = `Prezzo: €${prezzo.toFixed(2)}`;
    
    // Mostra modale
    document.getElementById('overlay').style.display = 'block';
    modale.style.display = 'block';
    document.body.style.overflow = 'hidden';
}

function chiudiModale() {
    document.getElementById('overlay').style.display = 'none';
    document.getElementById('modaleCarrello').style.display = 'none';
    document.body.style.overflow = 'auto';
}

// Chiudi modale cliccando sull'overlay
document.getElementById('overlay').addEventListener('click', chiudiModale);

function filtraProdotti() {
    const categorieSelezionate = Array.from(document.querySelectorAll('input[name="categoria"]:checked')).map(el => el.value);
    const prezzoMin = document.getElementById('input-min').value;
    const prezzoMax = document.getElementById('input-max').value;
    const inSconto = document.querySelector('input[name="inSconto"]').checked;
    const magsafe = document.querySelector('input[name="magsafe"]').checked;
    const novita = document.querySelector('input[name="novita"]').checked;
    const disponibili = document.querySelector('input[name="disponibili"]').checked;
    
    const params = new URLSearchParams();
    if(categorieSelezionate.length) params.append('categorie', categorieSelezionate.join(','));
    if(prezzoMin) params.append('prezzoMin', prezzoMin);
    if(prezzoMax) params.append('prezzoMax', prezzoMax);
    if(inSconto) params.append('inSconto', true);
    if(magsafe) params.append('magsafe', true);
    if(novita) params.append('novita', true);
    if(disponibili) params.append('disponibili', true);
    
    fetch('FiltraProdottiServlet?' + params.toString())
        .then(response => response.text())
        .then(html => {
            document.querySelector('.griglia-prodotti').innerHTML = html;
        })
        .catch(error => console.error('Error:', error));
}

// Aggiungi event listener per il cambio prezzo
document.getElementById('input-min').addEventListener('change', filtraProdotti);
document.getElementById('input-max').addEventListener('change', filtraProdotti);

// Carica prodotti consigliati
function caricaProdottiConsigliati() {
    fetch('ProdottiConsigliatiServlet')
        .then(response => response.json())
        .then(data => {
            const container = document.querySelector('.griglia-consigliati');
            container.innerHTML = '';
            
            data.forEach(prodotto => {
                container.innerHTML += `
                    <div class="card-consigliato" onclick="window.location.href='DettaglioProdottoServlet?id=${prodotto.id}'">
                        <img src="ImageServlet?id=${prodotto.id}" alt="${prodotto.nome}">
                        <h4>${prodotto.nome}</h4>
                        <div class="prezzo">€${prodotto.prezzoScontato > 0 ? prodotto.prezzoScontato.toFixed(2) : prodotto.prezzo.toFixed(2)}</div>
                    </div>
                `;
            });
        });
}

// Carica prodotti consigliati al caricamento della modale
document.getElementById('modaleCarrello').addEventListener('click', function(e) {
    if(e.target.classList.contains('btn-carrello')) {
        caricaProdottiConsigliati();
    }
});
VERSIONE DINAMICA FINE */
</script>

<%@ include file="Footer.jsp" %>
</body>
</html>
