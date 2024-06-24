// 댓글 글자수
function updateCharCount() {
    var commentInput = document.getElementById('commentInput');
    var charCount = commentInput.value.length;
    document.getElementById('charCount').innerText = charCount;
}

// wtp 임시 서버 경로