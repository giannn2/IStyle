<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- Per attivare la versione dinamica, rimuovere i commenti dalla riga seguente --%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<link rel="stylesheet" href="css/HeaderStyle.css">

<%-- VERSIONE STATICA INIZIO --%>
<%
    // Simulazione utente loggato (modificare per test)
    boolean autenticato = false;
    
    // Simulazione elementi nel carrello (modificare per test)
    int carrelloCount = 2;
%>
<%-- VERSIONE STATICA FINE --%>

<%-- VERSIONE DINAMICA INIZIO 
<c:set var="autenticato" value="${not empty sessionScope.utente}" />
<c:set var="carrelloCount" value="${not empty sessionScope.carrello ? sessionScope.carrello.numeroArticoli : 0}" />
VERSIONE DINAMICA FINE --%>

<header>
    <div class="header-top-mobile">
        <button class="hamburger-menu" onclick="toggleMobileMenu()">
            <i class="fas fa-bars"></i>
        </button>
        <div class="logo-mobile">
            <a href="Home.jsp">
                <img src="img/icon/logo.png" alt="Logo">
            </a>
        </div>
        <div class="cart-mobile">
            <a href="Carrello.jsp">
                <i class="fas fa-shopping-cart"></i>
                <%-- VERSIONE STATICA --%>
                <span class="cart-count"><%= carrelloCount %></span>
                <%-- VERSIONE DINAMICA 
                <span class="cart-count"><c:out value="${carrelloCount}" /></span>
                --%>
            </a>
        </div>
    </div>

    <div class="header-main">
        <div class="search-box">
            <form action="ricerca.jsp" method="get">
                <input type="text" name="query" placeholder="Cerca tra i prodotti...">
                <button type="submit">
                    <i class="fas fa-search"></i>
                </button>
            </form>
        </div>

        <div class="logo">
            <a href="Home.jsp">
                <img src="img/icon/logo.png" alt="Logo">
            </a>
        </div>

        <div class="top-bar">
            <a href="wishlist.jsp" class="icon-link">
                <i class="far fa-heart icon"></i>
                <span class="icon-label">Wishlist</span>
            </a>

            <div class="dropdown" id="userDropdown">
                <%-- VERSIONE STATICA --%>
                <% if (autenticato) { %>
                    <div class="icon-link dropdown-toggle" onclick="toggleDropdownMenu()">
                        <img src="img/icon/user-icon.png" class="user-icon" alt="Account">
                        <span class="icon-label">Account</span>
                    </div>
                    <div class="dropdown-menu" id="dropdownMenu">
                        <a href="MyAccount.jsp"><i class="fas fa-user-circle"></i> Area Utente</a>
                        <a href="ordini.jsp"><i class="fas fa-box-open"></i> I miei ordini</a>
                        <a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
                    </div>
                <% } else { %>
                    <a href="Auth.jsp" class="icon-link">
                        <img src="img/icon/user-icon.png" class="user-icon" alt="Account">
                        <span class="icon-label">Account</span>
                    </a>
                <% } %>
                <%-- VERSIONE DINAMICA 
                <c:choose>
                    <c:when test="${autenticato}">
                        <div class="icon-link dropdown-toggle" onclick="toggleDropdownMenu()">
                            <img src="img/icon/user-icon.jpg" class="user-icon" alt="Account">
                            <span class="icon-label">Account</span>
                        </div>
                        <div class="dropdown-menu" id="dropdownMenu">
                            <a href="MyAccountServlet"><i class="fas fa-user-circle"></i> Area Utente</a>
                            <a href="OrdiniServlet"><i class="fas fa-box-open"></i> I miei ordini</a>
                            <a href="LogoutServlet"><i class="fas fa-sign-out-alt"></i> Logout</a>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <a href="AuthServlet" class="icon-link">
                            <img src="img/icon/user-icon.jpg" class="user-icon" alt="Account">
                            <span class="icon-label">Account</span>
                        </a>
                    </c:otherwise>
                </c:choose>
                --%>
            </div>

            <a href="Carrello.jsp" class="icon-link">
                <i class="fas fa-shopping-cart icon"></i>
                <span class="icon-label">Carrello</span>
                <%-- VERSIONE STATICA --%>
                <span class="cart-count"><%= carrelloCount %></span>
                <%-- VERSIONE DINAMICA 
                <span class="cart-count"><c:out value="${carrelloCount}" /></span>
                --%>
            </a>
        </div>
    </div>

    <nav id="mainNav">
        <a href="novita.jsp">Novità</a>
        <a href="creaCover.jsp">CreaLaTuaCover</a>
        <a href="bestSeller.jsp">BestSeller</a>
        <a href="Prodotti.jsp">Cover</a>
        <a href="accessori.jsp">Accessori</a>
    </nav>

    <div class="mobile-menu" id="mobileMenu">
        <a href="novita.jsp">Novità</a>
        <a href="creaCover.jsp">CreaLaTuaCover</a>
        <a href="bestSeller.jsp">BestSeller</a>
        <a href="Prodotti.jsp">Cover</a>
        <a href="accessori.jsp">Accessori</a>
        <div class="mobile-menu-account">
            <%-- VERSIONE STATICA --%>
            <% if (autenticato) { %>
                <a href="MyAccount.jsp"><i class="fas fa-user-circle"></i> Area Utente</a>
                <a href="ordini.jsp"><i class="fas fa-box-open"></i> I miei ordini</a>
                <a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
            <% } else { %>
                <a href="Auth.jsp"><i class="fas fa-sign-in-alt"></i> Accedi</a>
                <a href="Auth.jsp?action=register"><i class="fas fa-user-plus"></i> Registrati</a>
            <% } %>
            <%-- VERSIONE DINAMICA 
            <c:choose>
                <c:when test="${autenticato}">
                    <a href="MyAccountServlet"><i class="fas fa-user-circle"></i> Area Utente</a>
                    <a href="OrdiniServlet"><i class="fas fa-box-open"></i> I miei ordini</a>
                    <a href="LogoutServlet"><i class="fas fa-sign-out-alt"></i> Logout</a>
                </c:when>
                <c:otherwise>
                    <a href="AuthServlet?action=login"><i class="fas fa-sign-in-alt"></i> Accedi</a>
                    <a href="AuthServlet?action=register"><i class="fas fa-user-plus"></i> Registrati</a>
                </c:otherwise>
            </c:choose>
            --%>
        </div>
    </div>
</header>

<script>
function toggleDropdownMenu() {
    const menu = document.getElementById("dropdownMenu");
    if(menu) {
        menu.style.display = (menu.style.display === "block") ? "none" : "block";
    }
}

function toggleMobileMenu() {
    const menu = document.getElementById("mobileMenu");
    if(menu) {
        menu.style.display = (menu.style.display === "flex") ? "none" : "flex";
    }
}

// Chiudi i menu quando si clicca fuori
document.addEventListener("click", function(event) {
    const dropdown = document.getElementById("userDropdown");
    const menu = document.getElementById("dropdownMenu");
    const hamburger = document.querySelector(".hamburger-menu");
    const mobileMenu = document.getElementById("mobileMenu");

    if (menu && !dropdown.contains(event.target)) {
        menu.style.display = "none";
    }
    
    if (mobileMenu && !hamburger.contains(event.target) && !mobileMenu.contains(event.target)) {
        mobileMenu.style.display = "none";
    }
});

<%-- VERSIONE DINAMICA 
// Funzionalità AJAX per aggiornare il carrello
function updateCartCount() {
    fetch('GetCartCountServlet')
        .then(response => response.json())
        .then(data => {
            document.querySelectorAll('.cart-count').forEach(el => {
                el.textContent = data.count;
            });
        })
        .catch(error => console.error('Error:', error));
}

// Aggiorna il conteggio ogni 30 secondi e al caricamento
setInterval(updateCartCount, 30000);
document.addEventListener('DOMContentLoaded', updateCartCount);
--%>
</script>