import $ from 'jquery';
import Controller from '@ember/controller';

export default Controller.extend({
  imagePublicUrl: '',
  
  actions: {
    uploadImage: function(event) { 
      var CLOUDINARY_URL = 'https://api.cloudinary.com/v1_1/dcshal8kv/image/upload';
      var CLOUDINARY_UPLOAD_PRESET = 'viywybi9';
      var file = event.target.files[0];
      var formData = new FormData();
      formData.append('file', file);
      formData.append('upload_preset', CLOUDINARY_UPLOAD_PRESET);
      $.ajax({
        url: CLOUDINARY_URL,
        method: "POST",
        data: formData,
        processData: false,
        contentType: false
      }).done(res => this.set('imagePublicUrl', res.url));
    }
  }
});
