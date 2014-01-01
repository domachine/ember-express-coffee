if window.location.search.match(/\?test/)
  document.write '''
    <div id="qunit"></div>
    <div id="qunit-fixture"></div>
    <div id="ember-testing-container">
      <div id="ember-testing"></div>
    </div>
    <link rel="stylesheet" href="css/runner.css">
    <link rel="stylesheet" href="bower_components/qunit/qunit/qunit.css">
    <script src="bower_components/qunit/qunit/qunit.js"></script>
    <script src="js/tests.js"></script>
  '''
