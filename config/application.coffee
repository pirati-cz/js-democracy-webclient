###
Exports a function which returns an object that overrides the default &
 *   plugin grunt configuration object.
 *
 * You can familiarize yourself with Lineman's defaults by checking out:
 *
 *   - https:github.com/testdouble/lineman/blob/master/config/application.coffee
 *   - https:github.com/testdouble/lineman/blob/master/config/plugins
 *
 * You can also ask Lineman's about config from the command line:
 *
 *   $ lineman config #=> to print the entire config
 *   $ lineman config concat.js #=> to see the JS config for the concat task.
###
module.exports = (lineman) ->

  lineman.config.application.pages.dev.context.rest =
    url: '/'

  lineman.config.application.pages.dist.context.rest =
    url: process.env.VOTING_API_URL || '/'

  # copy bootstrap fonts
  lineman.config.application.copy.dev.files.push
    expand: true
    cwd: "vendor/components/bootstrap-sass/fonts"
    src: "**"
    dest: 'generated/fonts'

  lineman.config.application.copy.dist.files.push
    expand: true
    cwd: "vendor/components/bootstrap-sass/fonts"
    src: "**"
    dest: 'dist/fonts'

  # API Proxying
  #
  # During development, you'll likely want to make XHR (AJAX) requests to an API on the same
  # port as your lineman development server. By enabling the API proxy and setting the port, all
  # requests for paths that don't match a static asset in ./generated will be forwarded to
  # whatever service might be running on the specified port.
  #server:
    #apiProxy:
      #enabled: true
      #host: 'localhost'
      #port: 3000

  #Sass
  #
  #Lineman supports Sass via grunt-contrib-sass, which requires you first
  #have Ruby installed as well as the `sass` gem. To enable it, comment out the
  #following line:
  enableSass: true

  #Asset Fingerprints
  #
  #Lineman can fingerprint your static assets by appending a hash to the filename
  #and logging a manifest of logical-to-hashed filenames in dist/assets.json
  #via grunt-asset-fingerprint
  #enableAssetFingerprint: false
