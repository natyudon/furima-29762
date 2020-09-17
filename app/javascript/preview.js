document.addEventListener('turbolinks:load', function(){
    const itemImage = document.getElementById('item-image');
    if (itemImage == null){
      return null
    }

    const createImageHTML = (blob) => {
      const imageElement = document.createElement('div');
      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);
      imageElement.setAttribute('id', 'image-data');
      
      
      imageElement.appendChild(blobImage);
      const parent = itemImage.parentNode;
      const prev =parent.previousElementSibling;
      prev.appendChild(imageElement);

      // 以下複数枚投稿するため、新しくdiv要素の追加
      const alreadyContent = document.getElementById('add-image-content');
      if (alreadyContent == null){
      const addImageContent = document.createElement('div');
      addImageContent.setAttribute('id', 'add-image-content');
      addImageContent.insertAdjacentHTML('afterbegin', '<div id="left-side"></div><div id="right-side"><input type="file" id="add-input" name="product[images][]"></div>')

      const imageUpload = document.getElementById('upload-image-file');
      const formItem = document.getElementById('form-item');
      formItem.insertBefore(addImageContent, imageUpload.nextSibling);
      }
    }


    const createImageHTML2 = (blob) => {
      const blobImage2 = document.createElement('img');
      blobImage2.setAttribute('src', blob);
      blobImage2.setAttribute('id', 'left-side-image');
      
      const leftSide = document.getElementById('left-side');
      leftSide.appendChild(blobImage2);

      // 以下複数枚投稿するため、新しくdiv要素の追加
      const alreadyContent = document.getElementById('add-image-content2');
      if(alreadyContent == null ){
      const addImageContent2 = document.createElement('div');
      addImageContent2.setAttribute('id', 'add-image-content2');
      addImageContent2.insertAdjacentHTML('afterbegin', '<div id="left-side2"></div><div id="right-side2"><input type="file" id="add-input2" name="product[images][]"></div>')
      const addImageContent = document.getElementById('add-image-content');
      const formItem = document.getElementById('form-item');
      formItem.insertBefore(addImageContent2, addImageContent.nextSibling);
      }
    }

    const createImageHTML3 = (blob) => {
      const blobImage3 = document.createElement('img');
      blobImage3.setAttribute('src', blob);
      blobImage3.setAttribute('id', 'left-side-image2');
      
      const leftSide2 = document.getElementById('left-side2');
      leftSide2.appendChild(blobImage3);
    }

    itemImage.addEventListener('change', function(e){
      const imageContent = document.getElementById('image-data');
      if (imageContent){
        imageContent.remove();
      }

      const file = e.target.files[0];
      if (file){
      const blob = window.URL.createObjectURL(file);
      
      createImageHTML(blob);

      //　２枚目の写真選択に変化があったときの処理
      const addInput = document.getElementById('add-input');
       addInput.addEventListener('change', function (e) {
         const leftSideImage = document.getElementById('left-side-image');
         if (leftSideImage) {
           leftSideImage.remove();
         }

         const file2 = e.target.files[0];
         if (file2){
          const blob2 = window.URL.createObjectURL(file2);

          createImageHTML2(blob2);
         }

         // 3枚目の写真選択に変化があったときの処理
         const addInput2 = document.getElementById('add-input2');
         addInput2.addEventListener('change', function (e){
           const leftSideImage2 = document.getElementById('left-side-image2');
           if (leftSideImage2) {
             leftSideImage2.remove();
           }

            const file3 = e.target.files[0];
            if (file3){
              const blob3 = window.URL.createObjectURL(file3);

              createImageHTML3(blob3);
            }
         });
        });
      }

    });
      
});
