// JavaScript to handle the slideshow
let slideIndex = 0; // Starting index

// Function to show the slides
function showSlides() {
    let slides = document.querySelectorAll('.slide-content'); // Select all slides
    for (let i = 0; i < slides.length; i++) {
        slides[i].style.display = 'none'; // Hide all slides
    }
    slideIndex++;
    if (slideIndex > slides.length) {
        slideIndex = 1; // Reset to the first slide if we reach the end
    }
    slides[slideIndex - 1].style.display = 'block'; // Show the current slide
    setTimeout(showSlides, 3000); // Change slide every 4 seconds
}

// Start the slideshow when the page loads
window.onload = function() {
    showSlides();
};
