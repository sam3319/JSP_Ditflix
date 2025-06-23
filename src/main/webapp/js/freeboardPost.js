// 게시글 삭제 메소드
function deletePost(freeBoardId) {
    if (confirm('정말로 이 게시글을 삭제하시겠습니까?')) {
        const form = document.createElement('form');
        form.method = 'POST';
        form.action = 'FreeBoardDelete.FreeBoardDo';

        const input = document.createElement('input');
        input.type = 'hidden';
        input.name = 'id';
        input.value = freeBoardId;

        form.appendChild(input);
        document.body.appendChild(form);
        form.submit();
    }
}
// 댓글 삭제 함수
function deleteComment(commentId, freeBoardId) {
    if (confirm('정말로 이 댓글을 삭제하시겠습니까?')) {
        const form = document.createElement('form');
        form.method = 'POST';
        form.action = 'FreeBoardCommentDelete.FreeBoardDo';

        const commentIdInput = document.createElement('input');
        commentIdInput.type = 'hidden';
        commentIdInput.name = 'commentId';
        commentIdInput.value = commentId;

        const boardIdInput = document.createElement('input');
        boardIdInput.type = 'hidden';
        boardIdInput.name = 'freeBoardId';
        boardIdInput.value = freeBoardId;

        form.appendChild(commentIdInput);
        form.appendChild(boardIdInput);
        document.body.appendChild(form);
        form.submit();
    }
}