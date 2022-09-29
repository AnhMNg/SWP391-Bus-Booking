(function () {
    var imageUpload = function () {
        var self = this;
        this.selector = {
            fileInput: document.getElementById('inputUpload'),
            imagePreview: document.getElementById('user-photo'),
        };
        this.onChangeInput = function (e) {
            self.selector.imagePreview.setAttribute('src', "");
            self.imageData='';
            var file = e.target.files[0];
            var reader = new FileReader();
            reader.onload = function (e) {
                self.imageData = e.target.result;
                self.selector.imagePreview.setAttribute('src', self.imageData);
            };
            reader.readAsDataURL(file);
        };
        this.selector.fileInput.addEventListener('change', function (e) {
            self.onChangeInput(e);
        });
    };
    window.addEventListener("DOMContentLoaded", function () {
        console.log('DOM is loaded');
        new imageUpload();
    });
})();