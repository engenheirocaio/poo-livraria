    <footer class="pb-4 bg-primary-3 text-light" id="footer">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col col-md-auto text-center">
            <p class="text-muted">&copy;2019 TADES Ltda. Um sistema desenvolvido pela equipe The Avengers.</p>
          </div>
        </div>
      </div>
    </footer>

    <a href="#" class="btn back-to-top btn-primary btn-round" data-smooth-scroll data-aos="fade-up" data-aos-anchor="section:last-of-type" data-aos-mirror="true" data-aos-once="false">
      <svg class="icon" width="24px" height="24px" viewBox="0 0 24 24" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
        <title>Icon For Arrow-up</title>
        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
          <polygon points="0 0 24 0 24 24 0 24" opacity="0"></polygon>
          <rect fill="#000000" x="11" y="5" width="2" height="14" rx="1"></rect>
          <path d="M6.70710678,12.7071068 C6.31658249,13.0976311 5.68341751,13.0976311 5.29289322,12.7071068 C4.90236893,12.3165825 4.90236893,11.6834175 5.29289322,11.2928932 L11.2928932,5.29289322 C11.6714722,4.91431428 12.2810586,4.90106866 12.6757246,5.26284586 L18.6757246,10.7628459 C19.0828436,11.1360383 19.1103465,11.7686056 18.7371541,12.1757246 C18.3639617,12.5828436 17.7313944,12.6103465 17.3242754,12.2371541 L12.0300757,7.38413782 L6.70710678,12.7071068 Z"
          fill="#000000" fill-rule="nonzero"></path>
        </g>
      </svg>
    </a>

    <!-- Required vendor scripts (Do not remove) -->
    <script type="text/javascript" src="https://brubsduarte.github.io/assets/js/jquery.min.js"></script>
    <script type="text/javascript" src="https://brubsduarte.github.io/assets/js/popper.min.js"></script>
    <script type="text/javascript" src="https://brubsduarte.github.io/assets/js/bootstrap.js"></script>

    <!-- Optional Vendor Scripts (Remove the plugin script if current page does not use that feature) -->

    <!-- AOS (Animate On Scroll - animates elements into view while scrolling down) -->
    <script type="text/javascript" src="https://brubsduarte.github.io/assets/js/aos.js"></script>
    <!-- Clipboard (copies content from browser into OS clipboard) -->
    <script type="text/javascript" src="https://brubsduarte.github.io/assets/js/clipboard.js"></script>
    <!-- Fancybox (handles image and video lightbox and galleries) -->
    <script type="text/javascript" src="https://brubsduarte.github.io/assets/js/jquery.fancybox.min.js"></script>
    <!-- Flickity (handles touch enabled carousels and sliders) -->
    <script type="text/javascript" src="https://brubsduarte.github.io/assets/js/flickity.pkgd.min.js"></script>
    <!-- Ion rangeSlider (flexible and pretty range slider elements) -->
    <script type="text/javascript" src="https://brubsduarte.github.io/assets/js/ion.rangeSlider.min.js"></script>
    <!-- Isotope (masonry layouts and filtering) -->
    <script type="text/javascript" src="https://brubsduarte.github.io/assets/js/isotope.pkgd.min.js"></script>
    <!-- jarallax (parallax effect and video backgrounds) -->
    <script type="text/javascript" src="https://brubsduarte.github.io/assets/js/jarallax.min.js"></script>
    <script type="text/javascript" src="https://brubsduarte.github.io/assets/js/jarallax-video.min.js"></script>
    <script type="text/javascript" src="https://brubsduarte.github.io/assets/js/jarallax-element.min.js"></script>
    <!-- jQuery Countdown (displays countdown text to a specified date) -->
    <script type="text/javascript" src="https://brubsduarte.github.io/assets/js/jquery.countdown.min.js"></script>
    <!-- Plyr (unified player for Video, Audio, Vimeo and Youtube) -->
    <script type="text/javascript" src="https://brubsduarte.github.io/assets/js/plyr.polyfilled.min.js"></script>
    <!-- Prism (displays formatted code boxes) -->
    <script type="text/javascript" src="https://brubsduarte.github.io/assets/js/prism.js"></script>
    <!-- ScrollMonitor (manages events for elements scrolling in and out of view) -->
    <script type="text/javascript" src="https://brubsduarte.github.io/assets/js/scrollMonitor.js"></script>
    <!-- Smooth scroll (animation to links in-page)-->
    <script type="text/javascript" src="https://brubsduarte.github.io/assets/js/smooth-scroll.polyfills.min.js"></script>
    <!-- TwitterFetcher (displays a feed of tweets from a specified account)-->
    <script type="text/javascript" src="https://brubsduarte.github.io/assets/js/twitterFetcher_min.js"></script>
    <!-- Typed text (animated typing effect)-->
    <script type="text/javascript" src="https://brubsduarte.github.io/assets/js/typed.min.js"></script>
    <!-- Required theme scripts (Do not remove) -->
    <script type="text/javascript" src="https://brubsduarte.github.io/assets/js/theme.js"></script>
    <!-- Date picker -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
    <!-- Removes page load animation when window is finished loading -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
    
    <script type="text/javascript">
      var ctx = document.getElementById('myChart').getContext('2d');
      
        var aux = document.getElementsByName('valorTotal'); 
        var aux2 = document.getElementsByName('dataFinal');
        var textos2 = [];
        for (var i = 0; i < aux2.length; i++){
            textos2[i] = {data: aux2[i].innerHTML, valor: aux[i].innerHTML};
        }
        
        textos2.sort(function(a, b) {
        var dateA = new Date(a.data), dateB = new Date(b.data);
            return dateA - dateB;
        });
      
      var chart = new Chart(ctx, {
          // The type of chart we want to create
          type: 'line',

          // The data for our dataset
          data: {
              labels: textos2.map(function(x) {return x.data}),
              datasets: [{
                  label: 'Valor total de aluguel por dia (em R$)',
                  backgroundColor: 'rgb(0, 0, 0, 0)',
                  borderColor: '#379d6a',
                  data: textos2.map(function(x) {return x.valor})
              }]
          },

          // Configuration options go here
              
          options: {}
      });
      
       function pega () {
              var aux = document.getElementsByName('valorTotal');
              var textos = [];
              for (var i = 0; i < aux.length; i++){
                  textos[i] = aux[i].innerHTML;
              }
              var textos2 = aux.map(function(x) {
                  return x.innerHTML;
              });
              
              console.log(textos2);
              var aux2 = document.getElementsByName('dataFinal');
          };
          pega();
    </script>
    
    <script type="text/javascript">
      window.addEventListener("load", function () {
        document.querySelector('body').classList.add('loaded');
      });
    </script>

    <script>
      $(document).ready(function () {
          $("#pesquisa-input").on("keyup", function () {
              var value = $(this).val().toLowerCase();
              $("#tb-lista tr").filter(function () {
                  $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
              });
          });
      });
      
      $(document).ready(function () {
          $("#pesquisa-input-2").on("keyup", function () {
              var value = $(this).val().toLowerCase();
              $("#tb-lista-2 tr").filter(function () {
                  $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
              });
          });
      });
    </script>
    
    <script>
      $(document).ready(function(){
        var date_input=$('input[name="date"]'); //our date input has the name "date"
        var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
        var options={
          format: 'dd/mm/yyyy',
          container: container,
          todayHighlight: true,
          autoclose: true
        };
        date_input.datepicker(options);
      });
    </script>
  </body>

</html>
