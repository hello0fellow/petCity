//메뉴바 클릭
const togglebtn = document.querySelector('.navbar_togglebtn');
const menu = document.querySelector('.navbar_menu');

togglebtn.addEventListener('click', () => {
  menu.classList.toggle('active');
});
