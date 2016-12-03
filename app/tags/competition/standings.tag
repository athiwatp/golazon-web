<competition-standings>
  <div class="standings__container block wrapped">
    <loading></loading>

    <div each={ rounds } class="standings">
      <h2>{ name }</h2>

      <table class="standings-table">
        <thead>
          <tr>
            <th class="rank">&nbsp;</th>
            <th class="team">Team</th>
            <th class="mp"><acronym title="Matches Played">MP</acronym></th>
            <th class="gd"><acronym title="Goals For / Goals Against">GF&#8209;GA</acronym></th>
            <th class="pts"><acronym title="Points">Pts</acronym></th>
          </tr>
        </thead>
        <tbody>
          <tr each={ standings }>
            <td class="rank { zone_class(zone) }"><span>{ rank }</span></td>
            <td class="team" title="{ team_name }">{ team_name }</td>
            <td class="mp">{ matches }</td>
            <td class="gd">{ goals_for }&nbsp;-&nbsp;{ goals_against }</td>
            <td class="pts">{ points }</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>

  <script type="coffee">
    util = require 'util'

    @on 'mount', () =>
      season_id = @parent.competition.season.season_id

      util.request @, '/season/' + season_id + '/standings', (rounds) =>
        @rounds = rounds
        @update()

    @zone_class = (zone) =>
      return '' unless zone
      ('zone zone-' + zone)
  </script>

  <style type="scss">
    @import 'app/support.scss';

    $standings-border-color: #ddd;
    $blurred-text-color: #888;

    .standings {
      table {
        margin: 10px 0;
        width: 100%;
        table-layout: fixed;
      }

      tbody tr {
        border-top: 1px solid $standings-border-color;
      }

      th,
      td {
        text-align: center;
        padding: 10px 7px;

        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
      }

      th {
        text-align: center;
        color: $blurred-text-color;
        font-weight: normal;
      }

      .rank {
        color: $blurred-text-color;
        width: 40px;
      }
      .team {
        text-align: left;
        font-weight: 500;
      }
      .mp {
        width: 45px;
      }
      .gd {
        width: 65px;
      }
      .pts {
        font-weight: 700;
        width: 45px;
      }

      .zone {
        span {
          display: inline-block;
          width: 24px;
          height: 24px;
          line-height: 24px;
          border-radius: 12px;
          color: #fff;
        }

        &-1 span { background-color: #388E3C; }
        &-2 span { background-color: #00796B; }
        &-3 span { background-color: #0097A7; }
        &-4 span { background-color: #1976D2; }
        &-5 span { background-color: #303F9F; }
        &-11 span { background-color: #FFA000; }
        &-12 span { background-color: #F57C00; }
        &-13 span { background-color: #E64A19; }
        &-14 span { background-color: #5D4037; }
        &-15 span { background-color: #455A64; }
      }
    }
  </style>
</competition-standings>
