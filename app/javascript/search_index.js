
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
    const priceLt = document.getElementById('q_price_lt');
    const ltValue = priceLt.value;

    if ( !(value >= 2) && !(stateValue >= 2 ) && (GteqValue == "") && (ltValue == "")){
      const resultsContent = document.getElementById('results-content');
      resultsContent.style.display="none"
      const searchIndex = document.getElementById('search-index-form');
      searchIndex.style.height="calc(100vh - 350px)"
    }
  });

