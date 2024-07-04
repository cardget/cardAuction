window.onload = function() {
    // 이미지 클릭 시 파일 입력 필드 클릭
    document.getElementById('imageLogo').addEventListener('click', function() {
        document.getElementById('imageFile').click();
    });

    // 폼 제출 시 숨겨진 입력 필드 추가
    document.getElementById('myForm').addEventListener('submit', function(event) {
        var commentContent = document.getElementById('comment').innerHTML;

        // 줄바꿈을 <br>로 변경하여 저장
        var formattedContent = commentContent.replace(/\n/g, '<br>').replace(/<div>/g, '<br>').replace(/<\/div>/g, '').replace(/&nbsp;/g, ' ');

        // 내용을 저장할 입력 필드 생성
        var hiddenInput = document.createElement('input');
        hiddenInput.type = 'hidden';
        hiddenInput.name = 'ctt';
        hiddenInput.value = formattedContent;

        // 입력 필드를 폼에 추가
        this.appendChild(hiddenInput);
    });

    // 이미지 파일 선택 시 미리보기
    const imageFileInput = document.getElementById('imageFile');
    const imagePreview = document.createElement('img');
    imagePreview.id = 'imagePreview';
    imagePreview.style.maxWidth = '100%';
    imageFileInput.parentElement.appendChild(imagePreview);

    imageFileInput.addEventListener('change', function () {
        const file = imageFileInput.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function (e) {
                imagePreview.src = e.target.result;
                imagePreview.style.display = 'block';
            };
            reader.readAsDataURL(file);
        } else {
            imagePreview.src = '';
            imagePreview.style.display = 'none';
        }
    });

    // 여러 줄 입력 지원
    document.getElementById('comment').addEventListener('input', function(event) {
        this.style.height = 'auto';
        this.style.height = (this.scrollHeight) + 'px';
    });

    // 초기 높이 설정
    document.getElementById('comment').style.height = document.getElementById('comment').scrollHeight + 'px';
};

function setCheckboxValue() {
    var checkbox = document.getElementById("boardType");
    var isSecretInput = document.getElementById("isSecret");
    if (checkbox.checked) {
        isSecretInput.value = "1";
    } else {
        isSecretInput.value = "0";
    }
}
