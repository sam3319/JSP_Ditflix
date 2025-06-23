			// 이미지 모달 처리
      document.querySelectorAll('.review-image').forEach(img => {
        img.addEventListener('click', function() {
          const imgSrc = this.getAttribute('data-src');
          document.getElementById('modalImage').src = imgSrc;
        });
      });
      
      // 리뷰 삭제 함수
      function deleteReview(reviewBoardId) {
        if (confirm('정말로 이 리뷰를 삭제하시겠습니까?')) {
          const form = document.createElement('form');
          form.method = 'POST';
          form.action = 'ReviewBoardDelete.ReviewBoardDo';
          
          const input = document.createElement('input');
          input.type = 'hidden';
          input.name = 'id';
          input.value = reviewBoardId;
          
          form.appendChild(input);
          document.body.appendChild(form);
          form.submit();
        }
      }