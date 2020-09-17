
document.addEventListener('turbolinks:load', function(){
  const image = document.getElementById('image-box-0');
  if (image == null ){
    return null
  }
  const image1 = document.getElementById('image-box-1');
  if (image1 == null ){
    return null
  }
  const image2 = document.getElementById('image-box-2');


  const button = document.getElementById('image-button-0');
  const button1 = document.getElementById('image-button-1');
  const button2 = document.getElementById('image-button-2');

  button.addEventListener('click', function(){
      image.style.display= "block";
      image1.style.display = "none";

      button.style.backgroundColor = "#444444";
      button1.style.backgroundColor = "#ccc";

      if(image2){
        image2.style.display = "none";
        button2.style.backgroundColor = "#ccc";
      }
  });

  button1.addEventListener('click', function(){
      image1.style.display= "block";
      image.style.display = "none";

      button1.style.backgroundColor = "#444444";
      button.style.backgroundColor = "#ccc";

      if(image2){
        image2.style.display = "none";
        button2.style.backgroundColor = "#ccc";
      }
  });

  if(image2){
    button2.addEventListener('click', function(){
      image2.style.display= "block";
      image.style.display = "none";
      image1.style.display = "none";

      button2.style.backgroundColor = "#444444";
      button.style.backgroundColor = "#ccc";
      button1.style.backgroundColor = "#ccc";
    });
  } 
});