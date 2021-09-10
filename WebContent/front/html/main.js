//메뉴바 클릭
const togglebtn = document.querySelector('.navbar_togglebtn');
const menu = document.querySelector('.navbar_menu');
const visual_inner = document.querySelector('.visual_inner');

togglebtn.addEventListener('click', () => {
  menu.classList.toggle('active');
  visual_inner.classList.toggle('active');
});


