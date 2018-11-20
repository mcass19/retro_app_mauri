import Route from '@ember/routing/route';

export default Route.extend({
  actions: {
    signUpUser: function(username, email, password) {
      let user = this.get('store').createRecord('user', {
        username: username,
        email: email,
        password: password,
        profile_img: this.controller.get('imagePublicUrl')
      });
      user.save();
      this.transitionTo('retrospective');
    }
  }
});
