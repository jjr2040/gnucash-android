const caps = require('../helpers/caps');
const webdriverio = require('webdriverio');
const selectorById = require('../helpers/utils').selectorById;
const androidSelectorById = require('../helpers/utils').androidSelectorById;
const compareAndSaveScreenshot = require('../helpers/utils').compareAndSaveScreenshot;

jest.setTimeout(30000);

describe('Onboarding', () => {

  let client;
  let currentPackage;

  beforeAll(async () => {
    client = await webdriverio.remote(caps);
    currentPackage = await client.getCurrentPackage();    
  });

  afterAll( async () => {
    await client.deleteSession();
  });

  test('App has next button', async () => {
    const resourceId = 'btn_save';
    const selector = selectorById(currentPackage, resourceId);

    const button = await client.$(selector);

    const isDisplayed = await button.isDisplayed();

    await compareAndSaveScreenshot(client, 'onboarding-greetings.png');
    
    expect(isDisplayed).toBe(true);
  });

  test('Can go to default currency page', async () => {

    const nextButton = await client.$(selectorById(currentPackage, 'btn_save'));

    await nextButton.click();
    
    const title = await client.$(androidSelectorById('title'));
    const text = await title.getText()

    await compareAndSaveScreenshot(client, 'onboarding-select-currency.png');

    expect(text).toBe('Default Currency');
  });

});