  <%@ include file="Header.jsp" %>
<!DOCTYPE html>
<html lang="it">
<head>
  <meta charset="UTF-8">
  <title>Area Personale</title>
  <link rel="stylesheet" href="css/MyAccountStyle.css">
</head>
<body>  
  <div class="container">
    <h1 class="section__headline">Benvenuto Gabriele!</h1>
    <p>Benvenuto nella tua area personale: qui gestisci i tuoi dati, preferenze e attività.</p>

    <div class="grid">
      <div class="card soft-orange">
        <h2>Ordini & Spedizioni</h2>
        <p>Controlla gli acquisti recenti e lo stato dei tuoi pacchi.</p>
      </div>
      <div class="card soft-sky">
        <h2>Preferiti</h2>
        <p>Rivedi i tuoi articoli preferiti.</p>
      </div>
      <div class="card soft-lavender">
        <h2>I tuoi dati</h2>
        <p>Modifica nome, email, password o elimina l'account.</p>
      </div>
      <div class="card soft-mint">
        <h2>Indirizzi Salvati</h2>
        <p>Gestisci le destinazioni per le consegne.</p>
      </div>
    </div>

    <!-- FAQ -->
    <h1 class="section__headline">FAQs</h1>

    <h2 class="c-faqs__headline">Fatturazione</h2>
    <ul class="c-faqs">
      <li class="c-faq">
        <span class="c-faq__title">Come visualizzo le mie fatture?</span>
        <div class="c-faq__answer">Puoi scaricarle dalla sezione \"Ordini\" una volta che l'ordine è stato spedito.</div>
      </li>
      <li class="c-faq">
        <span class="c-faq__title">Posso modificare i dati di fatturazione?</span>
        <div class="c-faq__answer">Sì, ma solo prima che l'ordine venga processato e spedito.</div>
      </li>
    </ul>

    <h2 class="c-faqs__headline">Metodi di pagamento</h2>
    <ul class="c-faqs">
      <li class="c-faq">
        <span class="c-faq__title">Quali metodi di pagamento accettate?</span>
        <div class="c-faq__answer">Carte di credito, PayPal, bonifico bancario e pagamento alla consegna.</div>
      </li>
      <li class="c-faq">
        <span class="c-faq__title">Posso salvare un metodo di pagamento?</span>
        <div class="c-faq__answer">Sì, nella sezione \"I tuoi dati\" puoi gestire le tue carte salvate.</div>
      </li>
    </ul>
  </div>

  <script>
    document.querySelectorAll('.c-faq__title').forEach(function(title) {
      title.addEventListener('click', function() {
        const parent = this.parentElement;
        parent.classList.toggle('c-faq--active');
      });
    });
  </script>
</body>
</html>