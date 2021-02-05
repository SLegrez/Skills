// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)

const results = document.querySelector("#results");
const searchMovies = (query) => {
  fetch(`http://www.omdbapi.com/?s=${query}&apikey=adf1f2d7`)
  .then(response => response.json())
  .then((data) => {
    // console.log(data)
    data.Search.forEach((result) => {
        const movieList = `<li class="list-inline-item">
          <img src="${result.Poster}" alt="">
          <p>${result.Title}</p>
          </li>`;
          // console.log(movieList)

        results.insertAdjacentHTML("beforeend", movieList);
      });;
    });

const form = document.querySelector('#search-movies');

form.addEventListener('submit', (event) => {
  event.preventDefault(); // <-- to prevent <form>'s native behaviour
  const input = event.currentTarget.querySelector('.form-control');
  results.innerHTML = '';
  searchMovies(input.value);
});