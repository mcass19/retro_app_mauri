import DS from 'ember-data';

export default DS.Model.extend({
  username: DS.attr("string"),
  email: DS.attr("string"),
  password: DS.attr("string"),
  profile_img: DS.attr("string")
});
