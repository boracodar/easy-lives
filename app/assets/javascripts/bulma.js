document.addEventListener('DOMContentLoaded', () => {
  setupNotificationCloseButton();
});

function setupNotificationCloseButton() {
  document.querySelectorAll('.notification .delete').forEach((closeButton) => {
    const notification = closeButton.parentNode;

    closeButton.addEventListener('click', () => notification.parentNode.removeChild(notification));
  });
}
