if (window.location.hash && window.location.hash == '#_=_') {
  window.history.pushState("", document.title, window.location.pathname);
}
