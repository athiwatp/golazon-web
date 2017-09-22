<app>
  <search></search>

  <div id="main"></div>

  <p class="disclaimer block">
    Football data mnmlist way. Open source prototype.<br>
    (<a href="https://github.com/sobstel/golazon#readme">click here to learn more</a>)
  </p>

  <script type="coffee">
    riot.route.base '#!'

    riot.route '/', () =>
      riot.mount '#main', 'home'

    riot.route '/c/*', (competition_id) =>
      riot.mount '#main', 'competition', competition_id: competition_id

    riot.route '/m/*', (match_id) =>
      riot.mount '#main', 'match', match_id: match_id

    riot.route () =>
      riot.mount '#main', 'error404'

    riot.route.start true

    @update()
  </script>

  <style type="scss">
    @import 'app/support.scss';

    .disclaimer {
      margin-top: 1em;
      margin-bottom: 2em;
      font-style: italic;
      padding: 0 $default-padding;
      font-size: 12px;
      text-align: center;

      a {
        border-bottom: 1px dotted #666;
        text-decoration: none;
      }
    }
  </style>
</app>
