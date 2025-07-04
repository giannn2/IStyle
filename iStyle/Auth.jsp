<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <title>iStyle - Autenticazione</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="css/AuthStyle.css">
</head>
<body>
    <div class="iphone-container">
        
        <div class="iphone-frame">
            <!-- Notch -->
            <div class="notch">
                <div class="speaker"></div>
                <div class="camera"></div>
            </div>
            
            <!-- Screen Content -->
            <div class="screen-content">
                
                <!-- Tabs -->
                <div class="auth-tabs">
                    <button class="tab-btn active" id="login-tab">Accedi</button>
                    <button class="tab-btn" id="register-tab">Registrati</button>
                </div>
                
                <!-- Login Form -->
                <form action="authenticate.jsp" method="post" class="auth-form" id="login-form">
                    <div class="form-group">
                        <div class="input-with-icon">
                            <i class="fas fa-user"></i>
                            <input type="email" id="email" name="email" placeholder="Email" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="input-with-icon">
                            <i class="fas fa-lock"></i>
                            <input type="password" id="password" name="password" placeholder="Password" required>
                            <button type="button" class="toggle-password" aria-label="Mostra password">
                                <i class="fas fa-eye"></i>
                            </button>
                        </div>
                    </div>
                    
                    <button type="submit" class="btn-continue">Accedi</button>
                    
                    <div class="footer-links">
                        <a href="password-recovery.jsp" class="forgot-password">Password dimenticata?</a>
                    </div>
                </form>
                
                <!-- Register Form -->
                <form action="register.jsp" method="post" class="auth-form hidden" id="register-form">
                    <div class="form-group">
                        <div class="input-with-icon">
                            <i class="fas fa-user"></i>
                            <input type="text" id="fullname" name="fullname" placeholder="Nome e cognome" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="input-with-icon">
                            <i class="fas fa-envelope"></i>
                            <input type="email" id="new-email" name="email" placeholder="Email" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="input-with-icon">
                            <i class="fas fa-lock"></i>
                            <input type="password" id="new-password" name="password" placeholder="Password" required>
                            <button type="button" class="toggle-password" aria-label="Mostra password">
                                <i class="fas fa-eye"></i>
                            </button>
                        </div>
                        <div class="password-strength">
                            <div class="strength-bar"></div>
                            <div class="strength-bar"></div>
                            <div class="strength-bar"></div>
                            <span class="strength-text"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="input-with-icon">
                            <i class="fas fa-lock"></i>
                            <input type="password" id="confirm-password" placeholder="Conferma password" required>
                        </div>
                    </div>
                    
                    <button type="submit" class="btn-continue">Registrati</button>
                    
                    <div class="terms">
                        <p>Registrandoti accetti i <a href="terms.jsp">Termini di servizio</a> e la <a href="privacy.jsp">Privacy Policy</a></p>
                    </div>
                </form>
            </div>
            
            <!-- Home Indicator -->
            <div class="home-indicator"></div>
        </div>
    </div>

    <script>
    document.addEventListener('DOMContentLoaded', function() {
    // Mostra l'iPhone con animazione
    const phoneContainer = document.querySelector('.iphone-container');
    setTimeout(() => {
        phoneContainer.classList.add('show');
    }, 100);

    // Elementi UI
    const loginTab = document.getElementById('login-tab');
    const registerTab = document.getElementById('register-tab');
    const loginForm = document.getElementById('login-form');
    const registerForm = document.getElementById('register-form');
    
    // Simula la batteria
    function updateBattery() {
        const batteryIcon = document.querySelector('.ios-status .fa-battery-full');
        if (!batteryIcon) return;
        
        // Simula il livello della batteria (per demo)
        const levels = ['battery-quarter', 'battery-half', 'battery-three-quarters', 'battery-full'];
        const randomLevel = levels[Math.floor(Math.random() * levels.length)];
        batteryIcon.className = `fas fa-${randomLevel}`;
    }
    
    // Aggiorna l'ora
    function updateTime() {
        const timeElement = document.querySelector('.ios-time');
        if (!timeElement) return;
        
        const now = new Date();
        let hours = now.getHours();
        let minutes = now.getMinutes();
        minutes = minutes < 10 ? '0' + minutes : minutes;
        timeElement.textContent = `${hours}:${minutes}`;
    }
    
    // Aggiorna l'ora ogni minuto
    updateTime();
    updateBattery();
    setInterval(updateTime, 60000);
    
    // Gestione tab
    function switchTab(showLogin) {
        if(showLogin) {
            loginTab.classList.add('active');
            registerTab.classList.remove('active');
            loginForm.classList.remove('hidden');
            registerForm.classList.add('hidden');
        } else {
            registerTab.classList.add('active');
            loginTab.classList.remove('active');
            registerForm.classList.remove('hidden');
            loginForm.classList.add('hidden');
        }
    }
    
    loginTab.addEventListener('click', () => switchTab(true));
    registerTab.addEventListener('click', () => switchTab(false));
    
    // Toggle password
    document.querySelectorAll('.toggle-password').forEach(btn => {
        btn.addEventListener('click', function() {
            const input = this.parentElement.querySelector('input');
            const icon = this.querySelector('i');
            const isVisible = input.type === 'text';
            
            input.type = isVisible ? 'password' : 'text';
            icon.classList.toggle('fa-eye-slash', !isVisible);
            icon.classList.toggle('fa-eye', isVisible);
            this.setAttribute('aria-label', isVisible ? 'Mostra password' : 'Nascondi password');
        });
    });
    
    // Password strength
    const newPassword = document.getElementById('new-password');
    if(newPassword) {
        newPassword.addEventListener('input', function() {
            const strengthContainer = this.closest('.form-group').querySelector('.password-strength');
            if(!strengthContainer) return;
            
            const password = this.value;
            let strength = 0;
            
            // Lunghezza
            if(password.length >= 8) strength++;
            // Caratteri speciali
            if(/[!@#$%^&*(),.?":{}|<>]/.test(password)) strength++;
            // Maiuscole e numeri
            if(/[A-Z]/.test(password) && /\d/.test(password)) strength++;
            
            // Aggiornamento UI
            strengthContainer.className = 'password-strength';
            const bars = strengthContainer.querySelectorAll('.strength-bar');
            const strengthText = strengthContainer.querySelector('.strength-text');
            
            if(password.length === 0) {
                if(strengthText) strengthText.textContent = '';
                bars.forEach(bar => bar.style.backgroundColor = '');
                return;
            }
            
            strengthContainer.classList.add(
                strength <= 1 ? 'password-weak' : 
                strength === 2 ? 'password-medium' : 'password-strong'
            );
            
            if(strengthText) {
                strengthText.textContent = 
                    strength <= 1 ? 'Debole' : 
                    strength === 2 ? 'Media' : 'Forte';
            }
        });
    }
    
    // Conferma password
    const confirmPwd = document.getElementById('confirm-password');
    if(confirmPwd) {
        confirmPwd.addEventListener('input', function() {
            const pwd = document.getElementById('new-password').value;
            if(this.value && this.value !== pwd) {
                this.setCustomValidity("Le password non coincidono");
            } else {
                this.setCustomValidity("");
            }
        });
    }
    
    // Form validation
    document.querySelectorAll('.auth-form').forEach(form => {
        form.addEventListener('submit', function(e) {
            if(!form.checkValidity()) {
                e.preventDefault();
                e.stopPropagation();
            }
            form.classList.add('was-validated');
        });
    });
    
    // Effetto pressione tasti iOS
    document.querySelectorAll('button, .tab-btn, .toggle-password').forEach(btn => {
        btn.addEventListener('touchstart', function() {
            this.style.transform = 'scale(0.97)';
            this.style.opacity = '0.8';
        });
        
        btn.addEventListener('touchend', function() {
            this.style.transform = '';
            this.style.opacity = '';
        });
    });
    
    // Adatta le dimensioni su dispositivi più piccoli
    function adjustPhoneSize() {
        if(window.innerWidth <= 480) return;
        
        const windowHeight = window.innerHeight;
        
        if(windowHeight > 800) {
            phoneContainer.style.transform = 'scale(1)';
        } else if(windowHeight > 700) {
            phoneContainer.style.transform = 'scale(0.9)';
        } else if(windowHeight > 600) {
            phoneContainer.style.transform = 'scale(0.8)';
        } else {
            phoneContainer.style.transform = 'scale(0.7)';
        }
    }
    
    window.addEventListener('resize', adjustPhoneSize);
    adjustPhoneSize();
});
    </script>
</body>
</html>