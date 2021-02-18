const callOmdb = () => {
  const results = document.querySelector("#results");
  const searchMovies = (query) => {
    fetch(`https://www.omdbapi.com/?s=${query}&apikey=adf1f2d7`)
    .then(response => response.json())
    .then((data) => {
      // console.log(data)
      data.Search.forEach((result) => {
        const movieList = `<li class="list-inline-item">
          <p>${result.Title}</p>
          <img src="${result.Poster}" class="img-grid" alt="">
          </li>`;
          // console.log(result.Title)

        results.insertAdjacentHTML("beforeend", movieList);
      });;
    });
  };
  if (document.querySelector("#search-movies")) {
    const form = document.querySelector("#search-movies");
    form.addEventListener('submit', (event) => {
      event.preventDefault();
      const input = event.currentTarget.querySelector('.form-control');
      results.innerHTML = '';
      searchMovies(input.value);
    });
  };
};

export { callOmdb };