// 댓글 글자수
function updateCharCount() {
    var commentInput = document.getElementById('commentInput');
    var charCount = commentInput.value.length;
    document.getElementById('charCount').innerText = charCount;
}