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
asyncMarkupData().then(() => {
  // 나머지 초기화 코드
});

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

const accordionImages = document.querySelectorAll('.listCard');
const deckListImages = document.querySelectorAll('.deckList .makerCard');

const selectedValues = new Set();

accordionImages.forEach(image => {
  image.addEventListener('click', () => {
      const selectedValue = image.getAttribute('value');
      if (!selectedValues.has(selectedValue)) {
          selectedValues.add(selectedValue);
      }
      updateDeckList();
      updateBorder();
  });
});

deckListImages.forEach(image => {
  image.addEventListener('click', () => {
      const selectedValue = image.getAttribute('value');
      if (selectedValues.has(selectedValue)) {
          selectedValues.delete(selectedValue);
          updateDeckList();
          updateBorder();
      }
  });
});

function updateDeckList() {
  deckListImages.forEach(deckImage => {
      if (selectedValues.has(deckImage.getAttribute('value'))) {
          deckImage.parentElement.style.display = 'block';
      } else {
          deckImage.parentElement.style.display = 'none';
      }
  });
}

function updateBorder() {
  accordionImages.forEach(image => {
      if (selectedValues.has(image.getAttribute('value'))) {
          image.style.border = '3px solid #F8C501';
          image.style.borderRadius = '8px';
      } else {
          image.style.border = 'none';
      }
      image.style.boxSizing = 'border-box';
  });
}

window.addEventListener('DOMContentLoaded', () => {
  deckListImages.forEach(deckImage => {
      deckImage.parentElement.style.display = 'none';
  });
});

document.addEventListener("DOMContentLoaded", function () {
  const decks = [
      { number: '1번덱', username: '사용자명1', date: '2023-01-01', recommend: '추천수 : 5' },
      { number: '2번덱', username: '사용자명2', date: '2023-01-02', recommend: '추천수 : 5' },
      { number: '3번덱', username: '사용자명3', date: '2023-01-03', recommend: '추천수 : 5' },
      { number: '4번덱', username: '사용자명4', date: '2023-01-04', recommend: '추천수 : 5' },
      { number: '5번덱', username: '사용자명5', date: '2023-01-05', recommend: '추천수 : 5' },
      { number: '6번덱', username: '사용자명6', date: '2023-01-06', recommend: '추천수 : 5' },
      { number: '7번덱', username: '사용자명7', date: '2023-01-07' },
      { number: '8번덱', username: '사용자명8', date: '2023-01-08' },
      { number: '9번덱', username: '사용자명9', date: '2023-01-09' },
      { number: '10번덱', username: '사용자명10', date: '2023-01-10' },
      { number: '11번덱', username: '사용자명11', date: '2023-01-11' },
      { number: '12번덱', username: '사용자명12', date: '2023-01-12' },
      { number: '13번덱', username: '사용자명13', date: '2023-01-12' },
      { number: '14번덱', username: '사용자명14', date: '2023-01-12' },
      { number: '15번덱', username: '사용자명15', date: '2023-01-12' },
      { number: '16번덱', username: '사용자명16', date: '2023-01-12' },
      { number: '17번덱', username: '사용자명17', date: '2023-01-12' },
      { number: '18번덱', username: '사용자명18', date: '2023-01-12' },
      { number: '19번덱', username: '사용자명19', date: '2023-01-12' },
  ];

  const itemsPerPage = 9;
  let currentPage = 1;

  function renderDecks(page) {
      const deckContainer = document.getElementById('deckContainer');
      deckContainer.innerHTML = '';

      const start = (page - 1) * itemsPerPage;
      const end = page * itemsPerPage;
      const paginatedDecks = decks.slice(start, end);

      paginatedDecks.forEach(deck => {
          const deckDiv = document.createElement('div');
          deckDiv.classList.add('deckType');
          deckDiv.innerHTML = `
              <a href="deckListDetail.html">
                  <div class="deck-overlay-container">
                      <img src="${path }/resources/images/default/deckSample.png">
                      <div class="overlay-text">
                          <div class="deck-number">${deck.number}</div>
                          <div class="deck-info">
                              <div class="username">${deck.username}</div>
                              <div class="date">${deck.date}</div>
                              <div class="date">${deck.recommend}</div>
                          </div>
                      </div>
                  </div>
              </a>
          `;
          deckContainer.appendChild(deckDiv);
      });
  }

  function renderPagination() {
      const paginationContainer = document.getElementById('paginationContainer');
      paginationContainer.innerHTML = '';

      const pageCount = Math.ceil(decks.length / itemsPerPage);

      const prevButton = document.createElement('a');
      prevButton.href = "#";
      prevButton.innerHTML = "&laquo;";
      prevButton.addEventListener('click', () => {
          if (currentPage > 1) {
              currentPage--;
              renderDecks(currentPage);
              renderPagination();
          }
      });
      paginationContainer.appendChild(prevButton);

      for (let i = 1; i <= pageCount; i++) {
          const pageButton = document.createElement('a');
          pageButton.href = "#";
          pageButton.innerHTML = i;
          if (i === currentPage) {
              pageButton.classList.add('active');
          }
          pageButton.addEventListener('click', () => {
              currentPage = i;
              renderDecks(currentPage);
              renderPagination();
          });
          paginationContainer.appendChild(pageButton);
      }

      const nextButton = document.createElement('a');
      nextButton.href = "#";
      nextButton.innerHTML = "&raquo;";
      nextButton.addEventListener('click', () => {
          if (currentPage < pageCount) {
              currentPage++;
              renderDecks(currentPage);
              renderPagination();
          }
      });
      paginationContainer.appendChild(nextButton);
  }

  renderDecks(currentPage);
  renderPagination();
});


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

