document.addEventListener('DOMContentLoaded', () => {
  setupNotificationCloseButton();
  setupNavbarBurger();
});

function setupNotificationCloseButton() {
  document.querySelectorAll('.notification .delete').forEach((closeButton) => {
    const notification = closeButton.parentNode;

    closeButton.addEventListener('click', () => notification.parentNode.removeChild(notification));
  });
}

function setupNavbarBurger() {
  const navbarBurger = document.querySelector('.navbar-burger');

  navbarBurger.addEventListener('click', (e) => {
    const menu = document.getElementById(e.target.dataset.target);

    e.target.classList.toggle('is-active');
    menu.classList.toggle('is-active');
  });
}
