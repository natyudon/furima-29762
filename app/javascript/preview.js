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
      }
      });
});
