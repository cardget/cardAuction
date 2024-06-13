//header, footer 불러오기
async function asyncMarkupData() {
  const allElements = document.getElementsByTagName("*");
  Array.prototype.forEach.call(allElements, function (el) {
    const includePath = el.dataset.includePath;
    if (includePath) {
      const xhttp = new XMLHttpRequest();
      xhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
          el.outerHTML = this.responseText;
        }
      };
      xhttp.open("GET", includePath, true);
      xhttp.send();
    }
  });
}
asyncMarkupData()
  .then(() => {
  });

/*아코디언메뉴 */
document.addEventListener('DOMContentLoaded', function () {
  const accordionHeaders = document.querySelectorAll('.accordion-header');
  accordionHeaders.forEach(header => {
    header.addEventListener('click', () => {
      const accordionContent = header.nextElementSibling;
      accordionContent.classList.toggle('active');
    });
  });
  //사이드바 고정
  const sidebar = document.querySelector('.sidebar');
  const originalOffsetTop = sidebar.offsetTop;
  var offset = 300;  // 스크롤 높이 300 

  window.addEventListener('scroll', function () {
    const scrollY = window.scrollY;

    if (scrollY > offset) {
      sidebar.classList.add('fixed-sidebar');
      sidebar.style.top = '100px';
    } else {
      sidebar.classList.remove('fixed-sidebar');
      sidebar.style.top = '';
    }
  });
});
/*덱리스트 카드추가 js*/
const accordionImages = document.querySelectorAll('.listCard');
const deckListImages = document.querySelectorAll('.deckList .makerCard');

// 이미지 선택 상태를 저장할 Set
const selectedValues = new Set();

// accordion 이미지를 클릭해도 선택 해제되지 않도록 처리
accordionImages.forEach(image => {
  image.addEventListener('click', () => {
    const selectedValue = image.getAttribute('value');
    // 선택한 이미지를 Set에 추가
    if (!selectedValues.has(selectedValue)) {
      selectedValues.add(selectedValue);
    }
    updateDeckList();
    updateBorder();
  });
});
// deckList 이미지를 클릭하면 선택 해제
deckListImages.forEach(image => {
  image.addEventListener('click', () => {
    const selectedValue = image.getAttribute('value');
    // 선택 해제
    if (selectedValues.has(selectedValue)) {
      selectedValues.delete(selectedValue);
      updateDeckList();
      updateBorder();
    }
  });
});
// 리스트 보이게
function updateDeckList() {
  deckListImages.forEach(deckImage => {
    if (selectedValues.has(deckImage.getAttribute('value'))) {
      deckImage.parentElement.style.display = 'block';

    } else {
      deckImage.parentElement.style.display = 'none';
    }
  });
}
//선택된 카드 테두리
function updateBorder(){
  accordionImages.forEach(image =>{
    if(selectedValues.has(image.getAttribute('value'))){
      image.style.border = '3px solid #F8C501';
      image.style.borderRadius = '8px';
    }else{
      image.style.border = 'none';
    }
    image.style.boxSizing = 'border-box';
  });
}
// 기본적으로 이미지 안보이게
window.addEventListener('DOMContentLoaded', () => {
  deckListImages.forEach(deckImage => {
    deckImage.parentElement.style.display = 'none';
  });
});
/*---덱리스트 카드추가 js---*/

/*카드 움직이기 
var container = document.querySelector('.container')
var overlay = document.querySelector('.overlay')
container.addEventListener('mousemove', function (e) {
  var x = e.offsetX
  var y = e.offsetY
  console.log(x, y);
  var rotateY = -1 / 5 * x + 20
  var rotateX = 4 / 30 * y - 20

  overlay.style = `background-position : ${x / 5 + y / 5}%; filter : opacity(${x / 200}) brightness(1.2)`

  container.style = `transform : perspective(350px) rotateX(${rotateX}deg) rotateY(${rotateY}deg)`
})

container.addEventListener('mouseout', function () {
  overlay.style = 'filter : opacity(0)'
  container.style = 'transform : perspective(350px) rotateY(0deg) rotateX(0deg)'
})*/

