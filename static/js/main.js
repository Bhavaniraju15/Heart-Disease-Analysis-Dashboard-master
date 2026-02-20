/* ============================================
   Heart Disease Analytics - Main JS (Clean)
   Author: Professional Version
   ============================================ */

document.addEventListener("DOMContentLoaded", () => {
    initHeaderScroll();
    initSmoothScroll();
    initStatCounters();
    initDashboardSearch();
    initCardRevealAnimations();

    console.log("✅ Heart Disease Analytics initialized successfully.");
});

/* ============================================
   1. Header Scroll Effect
   Adds shadow/background when user scrolls
   ============================================ */
function initHeaderScroll() {
    const header = document.querySelector(".header");
    if (!header) return;

    window.addEventListener("scroll", () => {
        header.classList.toggle("scrolled", window.scrollY > 60);
    });
}

/* ============================================
   2. Smooth Scroll for Anchor Links
   Only applies to valid section targets
   ============================================ */
function initSmoothScroll() {
    const anchorLinks = document.querySelectorAll('a[href^="#"]');

    anchorLinks.forEach(link => {
        link.addEventListener("click", (e) => {
            const targetId = link.getAttribute("href");
            const target = document.querySelector(targetId);

            if (!target) return;

            e.preventDefault();
            target.scrollIntoView({
                behavior: "smooth",
                block: "start"
            });
        });
    });
}

/* ============================================
   3. Animated Stats Counter (Runs Once)
   Uses IntersectionObserver for performance
   ============================================ */
function initStatCounters() {
    const counters = document.querySelectorAll(".stat-number");
    if (!counters.length) return;

    const animateCounter = (el) => {
        const target = parseInt(el.dataset.count, 10);
        let current = 0;

        const step = () => {
            current += target / 80;

            if (current < target) {
                el.innerText = Math.ceil(current).toLocaleString();
                requestAnimationFrame(step);
            } else {
                el.innerText = target.toLocaleString();
            }
        };

        step();
    };

    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                animateCounter(entry.target);
                observer.unobserve(entry.target);
            }
        });
    }, { threshold: 0.4 });

    counters.forEach(counter => observer.observe(counter));
}

/* ============================================
   4. Dashboard Search Filter
   Works with id="dashboardSearch"
   ============================================ */
function initDashboardSearch() {
    const searchInput = document.getElementById("dashboardSearch");
    if (!searchInput) return;

    const cards = document.querySelectorAll(".dashboard-card");

    searchInput.addEventListener("input", () => {
        const query = searchInput.value.toLowerCase().trim();

        cards.forEach(card => {
            const text = card.innerText.toLowerCase();
            card.style.display = text.includes(query) ? "block" : "none";
        });
    });
}

/* ============================================
   5. Fade-in Animation for Dashboard Cards
   Adds class "animate-in" when visible
   ============================================ */
function initCardRevealAnimations() {
    const cards = document.querySelectorAll(".dashboard-card");
    if (!cards.length) return;

    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add("animate-in");
                observer.unobserve(entry.target);
            }
        });
    }, { threshold: 0.15 });

    cards.forEach(card => observer.observe(card));
}
