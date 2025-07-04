<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="Header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Carrello</title>
    <link rel="stylesheet" type="text/css" href="css/CarrelloStyle.css  ">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

<div class="carrello-container">
    <h1>Il totale del tuo carrello è di € 119,97</h1>
    
    <div class="coupon-section">
        <span>Non hai un codice coupon</span>
        <a href="#">Inserisci codice</a>
    </div>

    <div class="prodotto-carrello">
        <img src="img/covers/Naruto.png" alt="Prodotto" class="img-prodotto-carrello">
        <div class="dettagli-prodotto-carrello">
            <h3>Panzac/Glass Privacy Pellicola in Vetro Temperato iPhone</h3>
            <p class="descrizione-breve">16 Pro Max | Ultra-Wide Fit</p>
            <div class="quantita-prodotto">
                <button>-</button>
                <span>2</span>
                <button>+</button>
            </div>
        </div>
        <div class="prezzo-prodotto">
            <span>€ 39,99</span>
            <p class="prezzo-unitario">Prezzo unitario: € 39,99</p>
            <p class="prezzo-totale">€ 79,98</p>
        </div>
    </div>

    <div class="prodotto-carrello">
        <img src="img/covers/inter.png" alt="Prodotto" class="img-prodotto-carrello">
        <div class="dettagli-prodotto-carrello">
            <h3>Panzac/Glass Gaming Pellicola in Vetro Temperato iPhone</h3>
            <p class="descrizione-breve">16 Pro Max | Ultra-Wide Fit</p>
            <div class="quantita-prodotto">
                <button>-</button>
                <span>1</span>
                <button>+</button>
            </div>
        </div>
        <div class="prezzo-prodotto">
            <span>€ 39,99</span>
            <p class="prezzo-unitario">Prezzo unitario: € 39,99</p>
            <p class="prezzo-totale">€ 39,99</p>
        </div>
    </div>

    <div class="info-consegna">
        <h3>Consegna stimata: 05 - 08 luglio 2025</h3>
    </div>

    <div class="info-pagamento">
        <p>Scegliendo il pagamento in negozio per i tuoi prodotti, potrai acquistare i servizi direttamente in negozio.</p>
    </div>

    <div class="info-reso">
        <h4>Reso e diritto di recesso</h4>
    </div>

    <div class="info-sicurezza">
        <h4>Acquista in sicurezza con</h4>
        <p>Scoopi la sicurezza nei pagamenti</p>
    </div>

    <div class="info-assistenza">
        <h4>Assistenza Clienti</h4>
        <p>Altre informazioni qui</p>
    </div>

    <div class="riepilogo-totale">
        <div class="subtotale">
            <span>Subtotale</span>
            <span>(Prodotti, Servizi, Sconti)</span>
            <span>€ 119,97</span>
        </div>
        <div class="totale">
            <span>Totale</span>
            <span>(iva inclusa)</span>
            <span>€ 119,97</span>
        </div>
        <form action="Checkout.jsp" method="get">
            <button class="btn-acquista" type="submit">PROSEGUI</button>
        </form>
    </div>

    <div class="coupon-section">
        <a href="#"><i class="fas fa-tag"></i> Ho un codice coupon</a>
        <a href="#">Prosegui</a>
    </div>
</div>

<%@ include file="Footer.jsp" %>
</body>
</html>