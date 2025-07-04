<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="Header.jsp" %>
<%
    HttpSession session = request.getSession(false);
    if (session == null || session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    String user = (String) session.getAttribute("user");
%>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Area Personale</title>
    <link rel="stylesheet" href="css/accountStyle.css">
</head>
<body>
    <div class="container">
        <h1>Benvenuto <%= user %>!</h1>
        <p>Benvenuto nella tua area personale: qui gestisci i tuoi dati, preferenze e attività. Tutto sotto controllo, in un unico posto.</p>

        <div class="grid">
            <div class="card soft-orange">
                <h2>Ordini & Spedizioni</h2>
                <p>Controlla gli acquisti recenti e lo stato dei tuoi pacchi.</p>
            </div>
            <div class="card soft-sky">
                <h2>Preferiti</h2>
                <p>Hai messo il cuore? Rivedi i tuoi articoli preferiti.</p>
            </div>
            <div class="card soft-lavender">
                <h2>Programma Fedeltà</h2>
                <p>Scopri premi, punti e offerte esclusive.</p>
            </div>
            <div class="card soft-mint">
                <h2>Indirizzi Salvati</h2>
                <p>Gestisci le destinazioni per le tue consegne.</p>
            </div>
        </div>

        <div class="profile-section">
            <div class="profile-card">
                <h3>I tuoi dati <a href="#">Modifica</a></h3>
                <p>Gestisci le tue info personali, cambia password o elimina l’account.</p>
            </div>
            <ul class="link-list">
                <li><a href="#">Fatturazione</a></li>
                <li><a href="#">Metodi di pagamento</a></li>
                <li><a href="#">Supporto clienti</a></li>
                <li><a href="#">Privacy e sicurezza</a></li>
                <li><a href="#">Gestione cookie</a></li>
            </ul>
        </div>
    </div>
</body>
</html>
