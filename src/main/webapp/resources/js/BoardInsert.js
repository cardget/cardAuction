window.onload = function() {
            // 이미지 클릭 시 파일 입력 필드 클릭
            document.getElementById('imageLogo').addEventListener('click', function() {
                document.getElementById('fileInput').click();
            });

            // 폼 제출 시 숨겨진 입력 필드 추가
            document.getElementById('myForm').addEventListener('submit', function(event) {
                var commentContent = document.getElementById('comment').innerText;

                // 내용을 저장할 입력 필드 생성
                var hiddenInput = document.createElement('input');
                hiddenInput.type = 'hidden';
                hiddenInput.name = 'ctt';
                hiddenInput.value = commentContent;

                // 입력 필드를 폼에 추가
                this.appendChild(hiddenInput);
            });

            // 여러 줄 입력 지원
            document.getElementById('comment').addEventListener('input', function(event) {
                this.style.height = 'auto';
                this.style.height = (this.scrollHeight) + 'px';
            });
        };