
  document.addEventListener('turbolinks:load', function(){
    const categoryId = document.getElementById('q_category_id_eq');
    if (categoryId == null){
      return null
    }
    const value = categoryId.value;
    const stateId = document.getElementById('q_state_id_eq');
    const stateValue = stateId.value;
    const priceGteq = document.getElementById('q_price_gteq');
    const GteqValue = priceGteq.value;

    if ( !(value >= 2) && !(stateValue >= 2 ) && (GteqValue == "")){
      const resultsContent = document.getElementById('results-content');
      resultsContent.style.display="none"
    }
  });

