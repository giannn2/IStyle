<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="Header.jsp" %>
<!-- Carosello: https://codepen.io/hoanghien0410/pen/MMPaqm?editors=0100 -->
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Home - IStyle</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/HomeStyle.css">
    <script src="${pageContext.request.contextPath}/js/HomeScript.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body class="animated-gradient">
<!-- Background animato -->
<div id="tsparticles"></div>

<!-- Carosello 3D -->
<div class="container">
 <main class="sliders-container">
<ul class="pagination">
            <li class="pagination__item"><a class="pagination__button"></a></li>
            <li class="pagination__item"><a class="pagination__button"></a></li>
            <li class="pagination__item"><a class="pagination__button"></a></li>
            <li class="pagination__item"><a class="pagination__button"></a></li>
        </ul>
    </main>
</div>

<section class="product-section">
    <h2 class="section-title">Le nostre cover</h2>
    <div class="cover-gallery">
        <div class="cover-container">
            <!-- Versione statica -->
            <div class="cover-image-container" id="cover-bg" style="background-color: #FF9E3F">
                <a href="DettaglioProdotto.jsp?product=Naruto">
                    <img id="current-cover" src="${pageContext.request.contextPath}/img/covers/Naruto.png" alt="Cover Anime Naruto" class="cover-image">
                </a>
            </div>
            
            <!-- Versione dinamica 
            <div class="cover-image-container" id="cover-bg" style="background-color: ${mainProduct.categoryColor}">
                <a href="DettaglioProdottoServlet?id=${mainProduct.id}">
                    <img id="current-cover" src="ImageServlet?id=${mainProduct.id}" alt="${mainProduct.name}" class="cover-image">
                </a>
            </div>
            -->
            
            <div class="category-buttons">
                <!-- Versione statica -->
                <button class="category-btn active" onclick="changeCover('Naruto.png', 'Cover Anime Naruto', '#FF9E3F', this, 'Naruto')">Anime</button>
                <button class="category-btn" onclick="changeCover('Fast&Furious.png', 'Cover Film Fast & Furious', '#2D3748', this, 'FastAndFurious')">Film</button>
                <button class="category-btn" onclick="changeCover('Inter.png', 'Cover calcio', '#03358a', this, 'Inter')">Calcio</button>
                
                <!-- Versione dinamica 
                <c:forEach var="category" items="${categories}">
                    <button class="category-btn ${category.id == selectedCategoryId ? 'active' : ''}" 
                            onclick="changeDynamicCover('${category.id}', '${category.color}', this)">
                        ${category.name}
                    </button>
                </c:forEach>
                -->
            </div>
        </div>
    </div>
</section>

<section class="other-products">
    <h2 class="section-title">Altri prodotti</h2>
    <div class="other-products-gallery">
        <!-- Versione statica -->
        <a href="DettaglioProdotto.jsp?product=Nasa" class="product-card">
            <img src="img/covers/Nasa.png" alt="Cover NASA">
        </a>
        <a href="DettaglioProdotto.jsp?product=HelloKitty" class="product-card">
            <img src="img/covers/Hello-Kitty.png" alt="Cover Hello Kitty">
        </a>
        <a href="DettaglioProdotto.jsp?product=HarryPotter" class="product-card">
            <img src="img/covers/Harry-Potter.png" alt="Cover Harry Potter">
        </a>
        
        <!-- Versione dinamica 
        <c:forEach var="product" items="${otherProducts}">
            <a href="DettaglioProdottoServlet?id=${product.id}" class="product-card">
                <img src="ImageServlet?id=${product.id}" alt="${product.name}">
            </a>
        </c:forEach>
        -->
    </div>
</section>



<!-- Script per la versione dinamica (commentato)
<script>
// Funzione per cambiare le cover (parte dinamica)
function changeDynamicCover(categoryId, bgColor, clickedButton) {
    const cover = document.getElementById('current-cover');
    const coverBg = document.getElementById('cover-bg');
    const buttons = document.querySelectorAll('.category-btn');
    
    // Aggiorna il bottone attivo
    buttons.forEach(btn => btn.classList.remove('active'));
    clickedButton.classList.add('active');
    
    // Animazione del cambio cover
    cover.style.opacity = '0';
    
    // Chiamata AJAX per ottenere il prodotto principale della categoria
    fetch('GetMainProductServlet?categoryId=' + categoryId)
        .then(response => response.json())
        .then(data => {
            setTimeout(() => {
                cover.src = 'ImageServlet?id=' + data.id;
                cover.alt = data.name;
                coverBg.style.backgroundColor = bgColor;
                cover.style.opacity = '1';
                
                // Aggiorna il link della cover
                const coverLink = cover.parentElement;
                coverLink.href = 'DettaglioProdottoServlet?id=' + data.id;
            }, 300);
        })
        .catch(error => console.error('Error:', error));
}
</script>
-->



<%@ include file="Footer.jsp" %>
</body>
</html>

