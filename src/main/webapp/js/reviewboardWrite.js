 			// 이미지 미리보기 및 파일 관리
      let selectedFiles = [];
      
      document.getElementById('image-upload').addEventListener('change', function(e) {
        const preview = document.querySelector('.image-preview');
        const placeholder = document.getElementById('preview-placeholder');
        
        if (this.files && this.files.length > 0) {
          // 기존 선택된 파일들과 새 파일들 합치기
          for (let i = 0; i < this.files.length; i++) {
            if (selectedFiles.length < 5) { // 최대 5개 제한
              selectedFiles.push(this.files[i]);
            }
          }
          
          // 미리보기 업데이트
          updatePreview();
        }
      });
      
      function updatePreview() {
        const preview = document.querySelector('.image-preview');
        const placeholder = document.getElementById('preview-placeholder');
        
        // 기존 미리보기 제거
        const existingContainers = preview.querySelectorAll('.preview-image-container');
        existingContainers.forEach(container => container.remove());
        
        if (selectedFiles.length > 0) {
          placeholder.style.display = 'none';
          
          selectedFiles.forEach((file, index) => {
            const reader = new FileReader();
            
            reader.onload = function(e) {
              // 이미지 컨테이너 생성
              const container = document.createElement('div');
              container.className = 'preview-image-container';
              container.dataset.fileIndex = index;
              
              // 이미지 생성
              const img = document.createElement('img');
              img.src = e.target.result;
              container.appendChild(img);
              
              // 삭제 버튼
              const removeBtn = document.createElement('div');
              removeBtn.className = 'remove-image';
              removeBtn.innerHTML = '<i class="bi bi-x"></i>';
              removeBtn.addEventListener('click', function() {
                removeFile(index);
              });
              container.appendChild(removeBtn);
              
              preview.appendChild(container);
            }
            
            reader.readAsDataURL(file);
          });
        } else {
          placeholder.style.display = 'block';
        }
      }
      
      function removeFile(index) {
        selectedFiles.splice(index, 1);
        updatePreview();
        updateFileInput();
      }
      
      function updateFileInput() {
        const fileInput = document.getElementById('image-upload');
        const dt = new DataTransfer();
        
        selectedFiles.forEach(file => {
          dt.items.add(file);
        });
        
        fileInput.files = dt.files;
      }
      
      // 폼 제출 시 파일 개수 확인
      document.querySelector('form').addEventListener('submit', function(e) {
        if (selectedFiles.length > 5) {
          e.preventDefault();
          alert('최대 5개의 이미지만 업로드할 수 있습니다.');
          return false;
        }
      });