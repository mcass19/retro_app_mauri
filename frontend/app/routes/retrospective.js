import Route from '@ember/routing/route';

export default Route.extend({
  beforeModel() {
    window.location.replace('http://localhost:3000/retrospectives');
  }
});
