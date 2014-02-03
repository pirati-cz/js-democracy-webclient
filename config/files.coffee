###
Exports a function which returns an object that overrides the default &
plugin file patterns (used widely through the app configuration)

To see the default definitions for Lineman's file paths and globs, see:

- https://github.com/testdouble/lineman/blob/master/config/files.coffee
###

module.exports = (lineman) ->

  # due to order issues, explicit array of files given
  coffee:
    app: [
      "app/js/controllers/index.coffee"
      "app/js/controllers/create.coffee"
      "app/js/controllers/login.coffee"
      "app/js/services/server_rest.coffee"
      "app/js/services/auth.coffee"
      "app/js/app.coffee"
    ]

  js:
    vendor: [
      "vendor/components/moment/moment.js"
      "vendor/components/jquery/jquery.js"

      "vendor/components/angular/angular.js"
      "vendor/components/angular-resource/angular-resource.js"
      "vendor/components/angular-cookies/angular-cookies.js"
      "vendor/components/angular-sanitize/angular-sanitize.js"
      "vendor/components/angular-bootstrap-datetimepicker/src/js/datetimepicker.js"

      "vendor/components/bootstrap-sass/js/affix.js"
      "vendor/components/bootstrap-sass/js/alert.js"
      "vendor/components/bootstrap-sass/js/dropdown.js"
      "vendor/components/bootstrap-sass/js/tooltip.js"
      "vendor/components/bootstrap-sass/js/modal.js"
      "vendor/components/bootstrap-sass/js/transition.js"
      "vendor/components/bootstrap-sass/js/button.js"
      "vendor/components/bootstrap-sass/js/popover.js"
      #"vendor/components/bootstrap-sass/js/typeahead.js"
      "vendor/components/bootstrap-sass/js/carousel.js"
      "vendor/components/bootstrap-sass/js/scrollspy.js"
      "vendor/components/bootstrap-sass/js/collapse.js"
      "vendor/components/bootstrap-sass/js/tab.js"
    ]

  css:
    vendor: [
      "vendor/css/**/*.css"
      "vendor/components/angular-bootstrap-datetimepicker/src/css/datetimepicker.css"
    ]

  copy:
    files: [
      expand: true
      cwd: "vendor/components/bootstrap-sass/fonts"
      src: "**"
      dest: 'generated/fonts'
    ]
