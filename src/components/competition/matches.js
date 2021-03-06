import matchService from '../../services/match';
import limitableMatches from '../util/limitable_matches';

const dataSource = ({ seasonId, type, limit }) => {
  return matchService.seasonMatches(seasonId, type, limit).then(matches => ({ matches }));
};

export default limitableMatches(dataSource);
