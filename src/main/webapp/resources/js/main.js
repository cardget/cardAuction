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


//


//
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
    const itemsPerPage = 9;
    let currentPage = 1;

    function renderDecks(page, decks) {
        const deckContainer = document.getElementById('deckContainer');
        deckContainer.innerHTML = '';

        const start = (page - 1) * itemsPerPage;
        const end = page * itemsPerPage;
        const paginatedDecks = decks.slice(start, end);

        paginatedDecks.forEach(deck => {
            const deckDiv = document.createElement('div');
            deckDiv.classList.add('deckType');
            deckDiv.innerHTML = `
                <a href="deckListDetail.do">
                    <div class="deck-overlay-container">
                        <img src="\${deck.thumbnail}" alt="Thumbnail">
                        <div class="overlay-text">
                            <div class="deck-number">\${deck.deckTitle}</div>
                            <div class="deck-info">
                                <div class="username">\${deck.userId}</div>
                                <div class="date">\${deck.createDate}</div>
                                <div class="recommend">\${deck.recommend}</div>
                            </div>
                        </div>
                    </div>
                </a>
            `;
            deckContainer.appendChild(deckDiv);
        });
    }

  function renderPagination(decks) {
        const paginationContainer = document.getElementById('paginationContainer');
        paginationContainer.innerHTML = '';

        const pageCount = Math.ceil(decks.length / itemsPerPage);

        const prevButton = document.createElement('a');
        prevButton.href = "#";
        prevButton.innerHTML = "&laquo;";
        prevButton.addEventListener('click', () => {
            if (currentPage > 1) {
                currentPage--;
                renderDecks(currentPage, decks);
                renderPagination(decks);
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
                renderDecks(currentPage, decks);
                renderPagination(decks);
            });
            paginationContainer.appendChild(pageButton);
        }

        const nextButton = document.createElement('a');
        nextButton.href = "#";
        nextButton.innerHTML = "&raquo;";
        nextButton.addEventListener('click', () => {
            if (currentPage < pageCount) {
                currentPage++;
                renderDecks(currentPage, decks);
                renderPagination(decks);
            }
        });
        paginationContainer.appendChild(nextButton);
    }
 	const decks = window.decksData; 
    renderDecks(currentPage, decks);
    renderPagination(decks);
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

