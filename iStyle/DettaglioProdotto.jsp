<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="Header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Dettaglio Prodotto</title>
    <link rel="stylesheet" type="text/css" href="css/DettaglioProdotto.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

<div class="dettaglio-prodotto-container">

    <!-- Area superiore con immagine e dettagli -->
    <div class="prodotto-top">

        <div class="immagini-prodotto">
            <img src="img/covers/Naruto.png.jpg" alt="naruto" class="immagine-principale">
            
            <!-- Miniature sotto -->
            <div class="miniature-container">
                <!-- da aggiungere jsp, per ora solo visivo -->
                <img src="img/covers/Naruto.png.jpg" class="miniatura" alt="thumb">
                <img src="img/covers/FFast&Furious.png" class="miniatura" alt="thumb">
                <img src="img/covers/inter.png" class="miniatura" alt="thumb">
            </div>
        </div>

        <!-- Dettagli prodotto -->
        <div class="dettagli-prodotto">
            <!-- da aggiungere jsp, per ora solo visivo -->
            <h2 class="titolo-prodotto">TITOLO PRODOTTO</h2>
            <p class="modello">Modello: iPhone X</p>
            <p class="colore">Colore:</p>
            
            <!-- Selettori colore -->
            <div class="selettori-colore">
                <span class="colore-option" style="background-color: red;"></span>
                <span class="colore-option" style="background-color: blue;"></span>
                <span class="colore-option" style="background-color: green;"></span>
                <!-- da aggiungere jsp, per ora solo visivo -->
            </div>

            <!-- Pulsante per personalizzazione -->
            <button class="btn-personalizza">Personalizza</button>
        </div>
    </div>

    <!-- Descrizione dettagliata -->
    <section class="descrizione-sezione">
        <h3>Scopri dettaglio di questo prodotto</h3>
        <p class="descrizione-testo">
            <!-- da aggiungere jsp, per ora solo visivo -->
            DESCRIZIONE PRODOTTO
        </p>
    </section>

    <!-- Prodotti simili -->
    <section class="prodotti-simili-sezione">
        <h3>Prodotti Simili</h3>
        <div class="griglia-prodotti-simili">
            <!-- da aggiungere jsp, per ora solo visivo -->
            <div class="card-prodotto">
                <img src="img/covers/inter.png" alt="Prodotto simile">
                <p class="nome-prodotto">NOME SIMILE</p>
                <button class="btn-carrello">🛒</button>
            </div>
            <div class="card-prodotto">
                <img src="img/covers/FFast&Furious.png" alt="Prodotto simile">
                <p class="nome-prodotto">NOME SIMILE</p>
                <button class="btn-carrello">🛒</button>
            </div>
        </div>
    </section>
</div>

<%@ include file="Footer.jsp" %>
</body>
</html>
