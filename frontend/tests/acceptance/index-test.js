import { module, test } from 'qunit';
import { visit, currentURL, click, find, findAll, querySelectorAll } from '@ember/test-helpers';
import { setupApplicationTest } from 'ember-qunit';

module('Acceptance | index', function(hooks) {
  setupApplicationTest(hooks);

  test('visiting /', async function(assert) {
    await visit('/');
    assert.equal(currentURL(), '/');

    assert.equal(findAll('.home_title').length, 2, 'Page contains title');
    assert.equal(findAll('.home_center_items').length, 2, 'Page contains center divs');
    assert.equal(findAll('img').length, 3, 'Page contains images');
    assert.equal(find('.button_app.home').length, 1, 'Page contains button');

    click('.button_app.home');
    assert.equal(currentURL(), '/retrospective');
  });
});
