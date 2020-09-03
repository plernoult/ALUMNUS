const navbarClick = () => {

  const currentLocation = document.location.href;
  const menuItem = document.querySelectorAll(".link-resp");
  const menuLength = menuItem.length;
  for (let i = 0; i < menuLength; i++) {
    if (menuItem[i].href === currentLocation){
      menuItem[i].firstElementChild.classList.remove("logo-link");
      menuItem[i].firstElementChild.classList.add("active");
    }
  }
}

export { navbarClick };