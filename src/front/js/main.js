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
    return loadItems();
  });
